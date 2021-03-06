#
# Functions used by several mount* scripts in initscripts package
#
# Sourcer must source /lib/lsb/init-functions.sh

fstab_files()
{
    if ! eval 'ls /etc/fstab.d/*.fstab' >/dev/null 2>&1; then
	echo /etc/fstab
    else
	echo '/etc/fstab' '/etc/fstab.d/*'
    fi
}

# $1: directory
is_empty_dir() {
	for FILE in $1/* $1/.*
	do
		case "$FILE" in
		  "$1/.*") return 0 ;;
		  "$1/*"|"$1/."|"$1/..") continue ;;
		  *) return 1 ;;
		esac
	done
	return 0
}


selinux_enabled () {
	which selinuxenabled >/dev/null 2>&1 && selinuxenabled
}

# Read /etc/fstab, looking for:
# 1) The root filesystem, resolving LABEL=*|UUID=* entries to the
#	device node,
# 2) Swap that is on a md device or a file that may be on a md
#	device,
read_fstab () {
	fstabroot=/dev/root
	rootdev=none
	roottype=none
	rootopts=defaults
	rootmode=rw
	rootcheck=no
	swap_on_lv=no
	swap_on_file=no

	for file in "$(eval ls $(fstab_files))"; do
		if [ -f "$file" ]; then
			while read DEV MTPT FSTYPE OPTS DUMP PASS JUNK; do
				case "$DEV" in
				  ""|\#*)
					continue;
					;;
				  /dev/mapper/*)
					[ "$FSTYPE" = "swap" ] && swap_on_lv=yes
					;;
				  /dev/*)
					;;
				  LABEL=*|UUID=*)
					if [ "$MTPT" = "/" ] && [ -x /sbin/findfs ]
					then
						DEV="$(findfs "$DEV")"
					fi
					;;
				  /*)
					[ "$FSTYPE" = "swap" ] && swap_on_file=yes
					;;
				  *)
					;;
				esac
				[ "$MTPT" != "/" ] && continue
				rootdev="$DEV"
				fstabroot="$DEV"
				rootopts="$OPTS"
				roottype="$FSTYPE"
				( [ "$PASS" != 0 ] && [ "$PASS" != "" ]   ) && rootcheck=yes
				( [ "$FSTYPE" = "nfs" ] || [ "$FSTYPE" = "nfs4" ] ) && rootcheck=no
				case "$OPTS" in
				  ro|ro,*|*,ro|*,ro,*)
					rootmode=ro
					;;
				esac
			done < "$file"
		fi
	done
}

# Find a specific fstab entry
# $1=mountpoint
# $2=fstype (optional)
# returns 0 on success, 1 on failure (not found or no fstab)
read_fstab_entry () {
	# Not found by default.
	found=1

	for file in "$(eval ls $(fstab_files))"; do
		if [ -f "$file" ]; then
			while read MNT_FSNAME MNT_DIR MNT_TYPE MNT_OPTS MNT_FREQ MNT_PASS MNT_JUNK; do
				case "$MNT_FSNAME" in
				  ""|\#*)
					continue;
					;;
				esac
				if [ "$MNT_DIR" = "$1" ]; then
					if [ -n "$2" ]; then
						[ "$MNT_TYPE" = "$2" ] || continue;
					fi
					found=0
					break 2
				fi
			done < "$file"
		fi
	done

	return $found
}

# Mount kernel and device file systems.
# $1: mount mode (mount, remount, mtab)
# $2: file system type
# $3: alternative file system type (or empty string if none)
# $4: mount point
# $5: mount device name
# $6... : extra mount program options
domount () {
	MOUNTMODE="$1"
	PRIFSTYPE="$2"
	ALTFSTYPE="$3"
	MTPT="$4"
	DEVNAME="$5"
	CALLER_OPTS="$6"

	KERNEL="$(uname -s)"
	# Figure out filesystem type from primary and alternative type
	FSTYPE=
	# Filesystem-specific mount options
	FS_OPTS=
	# Mount options from fstab
	FSTAB_OPTS=

	if [ "$PRIFSTYPE" = proc ]; then
		case "$KERNEL" in
			Linux|GNU) FSTYPE=proc ;;
			*FreeBSD)  FSTYPE=linprocfs ;;
			*)         FSTYPE=procfs ;;
		esac
	elif [ "$PRIFSTYPE" = bind ]; then
		case "$KERNEL" in
			Linux)     FSTYPE="$DEVNAME"; FS_OPTS="-obind" ;;
			*FreeBSD)  FSTYPE=nullfs ;;
			GNU)       FSTYPE=firmlink ;;
			*)         FSTYPE=none ;;
		esac
	elif [ "$PRIFSTYPE" = tmpfs ]; then
		# always accept tmpfs, to mount /run before /proc
		case "$KERNEL" in
			GNU)	FSTYPE=none ;; # for now
			*)	FSTYPE=$PRIFSTYPE ;;
		esac
	elif grep -E -qs "$PRIFSTYPE\$" /proc/filesystems; then
		FSTYPE=$PRIFSTYPE
	elif grep -E -qs "$ALTFSTYPE\$" /proc/filesystems; then
		FSTYPE=$ALTFSTYPE
	fi

	# Filesystem not supported by kernel
	if [ ! "$FSTYPE" ]; then
		if [ "$ALTFSTYPE" ]; then
			log_warning_msg "Filesystem types '$PRIFSTYPE' and '$ALTFSTYPE' are not supported. Skipping mount."
		else
			log_warning_msg "Filesystem type '$PRIFSTYPE' is not supported. Skipping mount."
		fi
		return
	fi

	# We give file system type as device name if not specified as
	# an argument
	if [ -z "$DEVNAME" ] ; then
	    DEVNAME=$FSTYPE
	fi

	# Get the mount options from /etc/fstab
	if read_fstab_entry "$MTPT" "$FSTYPE"; then
		case "$MNT_OPTS" in
			noauto|*,noauto|noauto,*|*,noauto,*)
				return
				;;
			?*)
				FSTAB_OPTS="-o$MNT_OPTS"
				;;
		esac
	fi

	if [ ! -d "$MTPT" ]
	then
		log_warning_msg "Mount point '$MTPT' does not exist. Skipping mount."
		return
	fi

	if [ "$MOUNTMODE" = "mount_noupdate" ]; then
		MOUNTFLAGS="-n"
		MOUNTMODE=mount
	fi
	if [ "$MOUNTMODE" = "remount_noupdate" ]; then
		MOUNTFLAGS="-n"
		MOUNTMODE=remount
	fi

	case "$MOUNTMODE" in
		mount)
			if mountpoint -q "$MTPT"; then
			    # Already mounted, probably moved from the
			    # initramfs, so remount with the
			    # user-specified mount options later on.
			    :
			else
				if [ "$VERBOSE" != "no" ]; then
					is_empty_dir "$MTPT" >/dev/null 2>&1 || log_warning_msg "Files under mount point '$MTPT' will be hidden."
				fi
				mount $MOUNTFLAGS -t $FSTYPE $CALLER_OPTS $FSTAB_OPTS $FS_OPTS $DEVNAME $MTPT
				if [ "$FSTYPE" = "tmpfs" -a -x /sbin/restorecon ]; then
					/sbin/restorecon $MTPT
				fi
			fi
			;;
		remount)
			if mountpoint -q "$MTPT"; then
				# Remount with user-specified mount options
				mount $MOUNTFLAGS -oremount $CALLER_OPTS $FSTAB_OPTS $MTPT
			fi
			;;
	        mtab)
			# Update mtab with correct mount options if
			# the filesystem is mounted
			MOUNTFLAGS="-f"

			if mountpoint -q "$MTPT"; then
				# Already recorded?
				if ! grep -E -sq "^([^ ]+) +$MTPT +" /etc/mtab < /dev/null
				then
					mount $MOUNTFLAGS -t $FSTYPE $CALLER_OPTS $FSTAB_OPTS $FS_OPTS $DEVNAME $MTPT < /dev/null
				fi
			fi
			;;
	        fstab)
			# Generate fstab with default mount options.
			# Note does not work for bind mounts, and does
			# not work if the fstab already has an entry
			# for the filesystem.

			if ! read_fstab_entry "$MTPT" "$FSTYPE"; then
				CALLER_OPTS="$(echo "$CALLER_OPTS" | sed -e 's/^-o//')"
				echo "Creating /etc/fstab entry for $MTPT to replace default in /etc/default/tmpfs (deprecated)" >&2
				cat << EOF
# This mount for $MTPT replaces the default configured in /etc/default/tmpfs
$DEVNAME	$MTPT	$FSTYPE	$CALLER_OPTS	0	0
EOF
			fi
			;;
	esac
}

#
# Preserve /var/run and /var/lock mountpoints
#
pre_mountall ()
{
	# RAMRUN and RAMLOCK on /var/run and /var/lock are obsoleted by
	# /run.  Note that while RAMRUN is no longer used (/run is always
	# a tmpfs), RAMLOCK is still functional, but will cause a second
	# tmpfs to be mounted on /run/lock.
	:
}

#
# Migrate a directory to /run and create compatibility symlink or bind
# mount.
#
run_migrate ()
{
	OLD=$1
	RUN=$2

	KERNEL="$(uname -s)"
	OPTS=""
	case "$KERNEL" in
		Linux)     FSTYPE=none OPTS="-orw -obind";;
		*FreeBSD)  FSTYPE=nullfs OPTS="-orw" ;;
		GNU)       FSTYPE=firmlink ;;
		*)         FSTYPE=none ;;
	esac

	# Create absolute symlink if not already present.  This is to
	# upgrade from older versions which created relative links,
	# which are not permitted in policy between top-level
	# directories.
	if [ -L "$OLD" ] && [ "$(readlink "$OLD")" != "$RUN" ]; then
		rm -f "$OLD"
		ln -fs "$RUN" "$OLD"
		[ -x /sbin/restorecon ] && /sbin/restorecon "$OLD"
	fi

	# If both directories are the same, we don't need to do
	# anything further.
	sold="$(/usr/bin/stat -L --format="%d %i" "$OLD" 2>/dev/null || :)"
	srun="$(/usr/bin/stat -L --format="%d %i" "$RUN" 2>/dev/null || :)"
	if [ -n "$sold" ] && [ "$sold" = "$srun" ]; then
		return 0
	fi

	# Try to remove if a directory.  Note this is safe because the
	# system is not yet fully up, and nothing is allowed to use
	# them yet.  If the user explicitly mounted a filesystem here,
	# it will be cleaned out, but this would happen later on when
	# bootclean runs in any case.
	if [ ! -L "$OLD" ] && [ -d "$OLD" ] ; then
		rm -fr "$OLD" 2>/dev/null || true
	fi

	# If removal failed (directory still exists), set up bind mount.
	if [ ! -L "$OLD" ] && [ -d "$OLD" ] ; then
		if [ "$OLD" != "/tmp" ]; then
			log_warning_msg "Filesystem mounted on $OLD; setting up compatibility bind mount."
			log_warning_msg "Please remove this mount from /etc/fstab; it is no longer needed, and it is preventing completion of the transition to $RUN."
		fi
		mount -t $FSTYPE "$RUN" "$OLD" $OPTS
	else
		# Create symlink if not already present.
		if [ -L "$OLD" ] && [ "$(readlink "$OLD")" != "$RUN" ]; then
			:
		else
			rm -f "$OLD"
			ln -fs "$RUN" "$OLD"
			[ -x /sbin/restorecon ] && /sbin/restorecon "$OLD"
		fi
	fi

	return 0
}

#
# Migrate /etc/mtab to a compatibility symlink
#
mtab_migrate ()
{
	# Don't symlink if /proc/mounts does not exist.
	if [ ! -r "/proc/mounts" ]; then
		return 1
	fi

	# Create symlink if not already present.
	if [ -L "/etc/mtab" ] && [ "$(readlink "/etc/mtab")" = "/proc/mounts" ]; then
		:
	else
		log_warning_msg "Creating compatibility symlink from /etc/mtab to /proc/mounts."

		rm -f "/etc/mtab" || return 1
		ln -fs "/proc/mounts" "/etc/mtab" || return 1
		[ -x /sbin/restorecon ] && /sbin/restorecon "/etc/mtab"
	fi

	return 0
}

#
# For compatibility, create /var/run and /var/lock symlinks to /run
# and /run/lock, respectively.
#
post_mountall ()
{
	# /var/run and /var/lock are now /run and /run/lock,
	# respectively.  Cope with filesystems being deliberately
	# mounted on /var/run and /var/lock.  We will create bind
	# mounts from /run and /run/lock to /var/run and /var/lock if
	# we can't remove the /var/run and /var/lock directories, or
	# else simply create symlinks.  For example, in the case that
	# the user has explicitly mounted filesystems on /var/run or
	# /var/lock, we bind mount over the top of them.  Where no
	# filesystems are mounted, we replace the directory with a
	# symlink where possible.

	run_migrate /var/run /run
	run_migrate /var/lock /run/lock
	run_migrate /dev/shm /run/shm
}
