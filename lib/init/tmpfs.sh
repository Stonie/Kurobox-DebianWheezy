#
# Set tmpfs vars
#

# Set defaults for /etc/default/tmpfs, in case any options are
# commented out which are needed for booting.  So that an empty or
# outdated file missing newer options works correctly, set the default
# values here.

TMPFS_SIZE=20%
TMPFS_MODE=755

RUN_SIZE=10%
RUN_MODE=755

LOCK_SIZE=5242880 # 5MiB
LOCK_MODE=1777

SHM_SIZE=
SHM_MODE=1777

TMP_SIZE=
TMP_MODE=1777


# Source conffile
if [ -f /etc/default/tmpfs ]; then
    . /etc/default/tmpfs
fi

RUN_OPT=
[ "${RUN_SIZE:=$TMPFS_SIZE}" ] && RUN_OPT=",size=$RUN_SIZE"
[ "${RUN_MODE:=$TMPFS_MODE}" ] && RUN_OPT="$RUN_OPT,mode=$RUN_MODE"

LOCK_OPT=
[ "${LOCK_SIZE:=$TMPFS_SIZE}" ] && LOCK_OPT=",size=$LOCK_SIZE"
[ "${LOCK_MODE:=$TMPFS_MODE}" ] && LOCK_OPT="$LOCK_OPT,mode=$LOCK_MODE"

SHM_OPT=
[ "${SHM_SIZE:=$TMPFS_SIZE}" ] && SHM_OPT=",size=$SHM_SIZE"
[ "${SHM_MODE:=$TMPFS_MODE}" ] && SHM_OPT="$SHM_OPT,mode=$SHM_MODE"

TMP_OPT=
[ "${TMP_SIZE:=$TMPFS_SIZE}" ] && TMP_OPT=",size=$TMP_SIZE"
[ "${TMP_MODE:=$TMPFS_MODE}" ] && TMP_OPT="$TMP_OPT,mode=$TMP_MODE"
