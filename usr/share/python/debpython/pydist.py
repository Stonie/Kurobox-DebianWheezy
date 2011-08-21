# -*- coding: UTF-8 -*-
# Copyright © 2010 Piotr Ożarowski <piotr@debian.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

from __future__ import with_statement
import logging
import os
import re
from os.path import exists, isdir, join
from subprocess import PIPE, Popen
from debpython.version import vrepr, getver, get_requested_versions
from debpython.tools import memoize

log = logging.getLogger(__name__)

PUBLIC_DIR_RE = re.compile(r'.*?/usr/lib/python(\d.\d+)/(site|dist)-packages')
PYDIST_RE = re.compile(r"""
    (?P<name>[A-Za-z][A-Za-z0-9_.]*)             # Python distribution name
    \s*
    (?P<vrange>(?:-?\d\.\d+(?:-(?:\d\.\d+)?)?)?) # version range
    \s*
    (?P<dependency>(?:[a-z][^;]*)?)              # Debian dependency
    (?:  # optional upstream version -> Debian version translator
        ;\s*
        (?P<standard>PEP386)?                    # PEP-386 mode
        \s*
        (?P<rules>s/.*)?                         # translator rules
    )?
    """, re.VERBOSE)
REQUIRES_RE = re.compile(r'''
    (?P<name>[A-Za-z][A-Za-z0-9_.]*)     # Python distribution name
    \s*
    (?P<enabled_extras>(?:\[[^\]]*\])?)  # ignored for now
    \s*
    (?:  # optional minimum/maximum version
        (?P<operator><=?|>=?|==|!=)
        \s*
        (?P<version>(\w|[-.])+)
    )?
    ''', re.VERBOSE)


def validate(fpath, exit_on_error=False):
    """Check if pydist file looks good."""
    with open(fpath) as fp:
        for line in fp:
            line = line.strip('\r\n')
            if line.startswith('#') or not line:
                continue
            if not PYDIST_RE.match(line):
                log.error('invalid pydist data in file %s: %s', \
                          fpath.rsplit('/', 1)[-1], line)
                if exit_on_error:
                    exit(3)
                return False
    return True


@memoize
def load(dname='/usr/share/python/dist/', fname='debian/pydist-overrides',
         fbname='/usr/share/python/dist_fallback'):
    """Load iformation about installed Python distributions."""
    if exists(fname):
        to_check = [fname]  # first one!
    else:
        to_check = []
    if isdir(dname):
        to_check.extend(join(dname, i) for i in os.listdir(dname))
    if exists(fbname):  # fall back generated at python-defaults build time
        to_check.append(fbname)  # last one!

    result = {}
    for fpath in to_check:
        with open(fpath) as fp:
            for line in fp:
                line = line.strip('\r\n')
                if line.startswith('#') or not line:
                    continue
                dist = PYDIST_RE.search(line)
                if not dist:
                    log.error('%s file has a broken line: %s', fpath, line)
                    exit(9)
                dist = dist.groupdict()
                name = safe_name(dist['name'])
                dist['versions'] = get_requested_versions(dist['vrange'])
                dist['dependency'] = dist['dependency'].strip()
                if dist['rules']:
                    dist['rules'] = dist['rules'].split(';')
                else:
                    dist['rules'] = []
                result.setdefault(name, []).append(dist)
    return result


def guess_dependency(req, version=None):
    log.debug('trying to guess dependency for %s (python=%s)',
              req, vrepr(version) if version else None)
    if isinstance(version, basestring):
        version = getver(version)

    # some upstreams have weird ideas for distribution name...
    name, rest = re.compile('([^><= ]+)(.*)').match(req).groups()
    req = safe_name(name) + rest

    data = load()
    req_dict = REQUIRES_RE.match(req)
    if not req_dict:
        log.error('requirement is not valid: %s', req)
        log.info('please ask dh_python2 author to fix REQUIRES_RE '
                 'or your upstream author to fix requires.txt')
        exit(8)
    req_dict = req_dict.groupdict()
    details = data.get(req_dict['name'].lower())
    if details:
        for item in details:
            if version and version not in item.get('versions', version):
                # rule doesn't match version, try next one
                continue

            if not item['dependency']:
                return  # this requirement should be ignored
            if item['dependency'].endswith(')'):
                # no need to translate versions if version is hardcoded in Debian
                # dependency
                return item['dependency']
            if req_dict['version']:
                # FIXME: translate it (rules, versions)
                return item['dependency']
            else:
                return item['dependency']

    # try dpkg -S
    query = "'%s-?*\.egg-info'" % safe_name(name)  # TODO: .dist-info
    if version:
        query = "%s | grep '/python%s/\|/pyshared/'" % \
                (query, vrepr(version))
    else:
        query = "%s | grep '/python2\../\|/pyshared/'" % query

    log.debug("invoking dpkg -S %s", query)
    process = Popen("/usr/bin/dpkg -S %s" % query, \
                    shell=True, stdout=PIPE)
    stdout, stderr = process.communicate()
    if process.returncode == 0:
        result = set()
        for line in stdout.split('\n'):
            if not line.strip():
                continue
            result.add(line.split(':')[0])
        if len(result) > 1:
            log.error('more than one package name found for %s dist', name)
        else:
            return result.pop()

    # fall back to python-distname
    pname = sensible_pname(name)
    log.warn('Cannot find package that provides %s. '
             'Using %s as package name. Please add "%s correct_package_name" '
             'line to debian/pydist-overrides to override it.',
             name, pname, name)
    return pname


def parse_pydep(fname):
    public_dir = PUBLIC_DIR_RE.match(fname)
    if public_dir:
        ver = public_dir.group(1)
    else:
        ver = None

    result = []
    with open(fname, 'r') as fp:
        for line in fp:
            line = line.strip()
            # ignore all optional sections
            if line.startswith('['):
                break
            if line:
                dependency = guess_dependency(line, ver)
                if dependency:
                    result.append(dependency)
    return result


def safe_name(name):
    """Emulate distribute's safe_name."""
    return re.compile('[^A-Za-z0-9.]+').sub('_', name).lower()


def sensible_pname(egg_name):
    """Guess Debian package name from Egg name."""
    egg_name = safe_name(egg_name).replace('_', '-')
    if egg_name.startswith('python-'):
        egg_name = egg_name[7:]
    return "python-%s" % egg_name.lower()
