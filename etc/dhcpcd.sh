#!/bin/bash
#
#  This is a sample /etc/dhcpc/dhcpcd.sh script.
#  /etc/dhcpc/dhcpcd.sh script is executed by dhcpcd daemon
#  any time it configures or shuts down interface.
#  The following parameters are passed to dhcpcd.sh script:
#  $1 = HostInfoFilePath, e.g  "/var/lib/dhcpc/dhcpcd-eth0.info"
#  $2 = "up" if interface has been configured with the same
#       IP address as before reboot;
#  $2 = "down" if interface has been shut down;
#  $2 = "new" if interface has been configured with new IP address;
#
# This script sources /var/lib/dhcpc/dhcpcd-<interface>.info which defines 
# a set of variables. 
# NOTE THAT THE DATA IN SOME OF THESE VARIABLES COME FROM 
# UNTRUSTED SOURCES AND ARE UNCHECKED.
# The variables in question are HOSTNAME, DOMAIN, NISDOMAIN, 
# ROOTPATH DNSSEARCH and DHCPSNAME. Enough quoting is done to ensure that
# execution of this script is safe, but beware if you pass the value of any of
# these variables to another shell or perl script - there is nothing to
# stop an attacker putting dangerous characters in these variables. 
#
# This is important: if noglob not set a filename expansion metachar may be
# included in one of the variables set in the info file and executed
# if that variable is used.
# Try this to see the effect:
# TEST='*'; echo $TEST
set -o noglob

#  Sanity checks

if [ $# -lt 2 ]; then
  logger -s -p local0.err -t dhcpcd.sh "wrong usage"
  exit 1
fi

hostinfo="$1"
state="$2"

# Reading HostInfo file for configuration parameters
if ! [ -f ${hostinfo} ]; then
   logger -s -p local0.err -t dhcpcd.sh "No hostinfo file"
   exit 1
fi

. ${hostinfo}

write_resolv_info()
{
    dnsservs=${DNSSERVERS}
    r=""
    [ "$dnsservs" != "" ] && [ "$DNSSEARCH" != "" ] && r="${r}search $DNSSEARCH
"
    [ "$dnsservs" != "" ] && [ "$DNSSEARCH" == "" ] && [ "$DNSDOMAIN" != "" ] && r="${r}search $DNSDOMAIN
"
    for serv in $dnsservs; do
        r="${r}nameserver $serv
"
    done
    if [ -x /sbin/resolvconf ] ; then
        echo -n "$r" | /sbin/resolvconf -a "$INTERFACE"
    else
        # set /etc/dhcpc/resolv.conf for compatiblity with older packages
	echo -n "$r" >| /etc/dhcpc/resolv.conf
        chmod 644 /etc/dhcpc/resolv.conf
    fi
}

delete_resolv_info()
{
    if [ -x /sbin/resolvconf ] ; then
        /sbin/resolvconf -d "$INTERFACE"
    fi
}


case ${state} in
 up) logger -s -p local0.info -t dhcpcd.sh "interface ${INTERFACE} has been configured with old IP=${IPADDR}"
     write_resolv_info

# ====  Put your code for the case interface has been brought up with old IP address here




# ====  End
     ;;

 new) logger -s -p local0.info -t dhcpcd.sh "interface ${INTERFACE} has been configured with new IP=${IPADDR}"
     write_resolv_info

# ====  Put your code for the case interface has been brought up with new IP address here




# ====  End
     ;;

 down) logger -s -p local0.info -t dhcpcd.sh "interface ${INTERFACE} has been brought down"
     delete_resolv_info
# ====  Put your code for the case interface has been shut down here




# ====  End
     ;;
esac

exit 0
