#! /bin/sh
### BEGIN INIT INFO
# Provides:          mountkernfs
# Required-Start:
# Required-Stop:
# Should-Start:      glibc
# Default-Start:     S
# Default-Stop:
# Short-Description: Mount kernel virtual file systems.
# Description:       Mount initial set of virtual filesystems the kernel
#                    provides and that are required by everything.
### END INIT INFO

PATH=/sbin:/bin
. /lib/init/vars.sh
. /lib/init/tmpfs.sh

. /lib/lsb/init-functions
. /lib/init/mount-functions.sh

# May be run several times, so must be idempotent.
# $1: Mount mode, to allow for remounting and mtab updating
mount_filesystems () {
	MNTMODE="$1"

	# Needed to determine if root is being mounted read-only.
	read_fstab

	#
	# Get some writable area available before the root is checked
	# and remounted.  Note that /run may be handed over from the
	# initramfs.
	#

	# If /run/shm is separately mounted, /run can be safely mounted noexec.
	RUNEXEC=
	if [ yes = "$RAMSHM" ] || read_fstab_entry /run/shm tmpfs; then
	    RUNEXEC=',noexec'
	fi
	# TODO: Add -onodev once checkroot no longer creates a device node.
	domount "$MNTMODE" tmpfs shmfs /run tmpfs "-onosuid$RUNEXEC$RUN_OPT"
	[ -x /sbin/restorecon ] && /sbin/restorecon -r /run
	[ -f /run/.ramfs ] || touch /run/.ramfs

	# Make lock directory as the replacement for /var/lock
	[ -d /run/lock ] || mkdir --mode=755 /run/lock
	[ -x /sbin/restorecon ] && /sbin/restorecon /run/lock

	# Mount /run/lock as tmpfs if enabled.  This prevents user DoS
	# of /run by filling /run/lock at the expense of using an
	# additional tmpfs.
	if [ yes = "$RAMLOCK" ] || read_fstab_entry /run/lock tmpfs; then
		domount "$MNTMODE" tmpfs shmfs /run/lock tmpfs "-onodev,noexec,nosuid$LOCK_OPT"
	else
		chmod "$LOCK_MODE" /run/lock
	fi

	[ -f /run/lock/.ramfs ] || touch /run/lock/.ramfs

	# If /tmp is a symlink, make sure the linked-to directory exists.
	if [ -L /tmp ] && [ ! -d /tmp ]; then
		TMPPATH="$(readlink /tmp)"
		mkdir -p --mode=755 "$TMPPATH"
		[ -x /sbin/restorecon ] && /sbin/restorecon "$TMPPATH"
	fi

	# If root is read only, default to mounting a tmpfs on /tmp,
	# unless one is due to be mounted from fstab.
	if [ rw != "$rootmode" ]; then
		# If there's an entry in fstab for /tmp (any
		# filesystem type, not just tmpfs), then we don't need
		# a tmpfs on /tmp by default.
		if read_fstab_entry /tmp ; then
			:
		else
			RAMTMP="yes"
		fi
	fi

	# Mount /tmp as tmpfs if enabled.
	if [ yes = "$RAMTMP" ] || read_fstab_entry /tmp tmpfs; then
		domount "$MNTMODE" tmpfs shmfs /tmp tmpfs "-onodev,nosuid$TMP_OPT"
	else
		# When root is still read only, this will fail.
		if [ mount_noupdate != "$MNTMODE" ] && [ rw = "$rootmode" ]; then
			chmod "$TMP_MODE" /tmp
		fi
	fi

	# Make pidfile omit directory for sendsigs
	[ -d /run/sendsigs.omit.d ] || mkdir --mode=755 /run/sendsigs.omit.d/

	#
	# Mount proc filesystem on /proc
	#
	domount "$MNTMODE" proc "" /proc proc "-onodev,noexec,nosuid"

	#
	# Mount sysfs on /sys
	#
	# Only mount sysfs if it is supported (kernel >= 2.6)
	if grep -E -qs "sysfs\$" /proc/filesystems
	then
		domount "$MNTMODE" sysfs "" /sys sysfs "-onodev,noexec,nosuid"
	fi
}

case "$1" in
  "")
	echo "Warning: mountkernfs should be called with the 'start' argument." >&2
	mount_filesystems mount_noupdate
	;;
  start)
	mount_filesystems mount_noupdate
	;;
  mtab)
	mount_filesystems mtab
	;;
  restart|reload|force-reload)
	mount_filesystems remount
	;;
  stop)
	# No-op
	;;
  *)
	echo "Usage: mountkernfs [start|stop]" >&2
	exit 3
	;;
esac
