TARGETS = mountkernfs.sh mountdevsubfs.sh bootlogd hostname.sh hwclockfirst.sh checkroot.sh ifupdown-clean hwclock.sh module-init-tools mtab.sh checkfs.sh ifupdown mountall.sh mountall-bootclean.sh mountoverflowtmp networking urandom procps portmap nfs-common mountnfs.sh mountnfs-bootclean.sh bootmisc.sh stop-bootlogd-single
INTERACTIVE = checkroot.sh checkfs.sh
mountdevsubfs.sh: mountkernfs.sh
bootlogd: mountdevsubfs.sh
hostname.sh: bootlogd
hwclockfirst.sh: bootlogd mountdevsubfs.sh
checkroot.sh: mountdevsubfs.sh hostname.sh hwclockfirst.sh bootlogd
ifupdown-clean: checkroot.sh
hwclock.sh: checkroot.sh bootlogd
module-init-tools: checkroot.sh
mtab.sh: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
ifupdown: ifupdown-clean
mountall.sh: checkfs.sh
mountall-bootclean.sh: mountall.sh
mountoverflowtmp: mountall-bootclean.sh
networking: mountkernfs.sh mountall.sh mountoverflowtmp ifupdown
urandom: mountall.sh mountoverflowtmp
procps: mountkernfs.sh mountall.sh mountoverflowtmp module-init-tools bootlogd
portmap: networking ifupdown mountall.sh mountoverflowtmp
nfs-common: portmap hwclock.sh
mountnfs.sh: mountall.sh mountoverflowtmp networking ifupdown portmap nfs-common
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
bootmisc.sh: mountall.sh mountoverflowtmp hostname.sh mountnfs.sh mountnfs-bootclean.sh
stop-bootlogd-single: mountall.sh mountoverflowtmp ifupdown ifupdown-clean mountnfs.sh mountnfs-bootclean.sh hwclock.sh networking mountkernfs.sh urandom checkroot.sh portmap nfs-common hostname.sh procps module-init-tools mountdevsubfs.sh bootlogd hwclockfirst.sh mtab.sh checkfs.sh mountall-bootclean.sh bootmisc.sh
