#!bin/bash
#Dev : F00b4rch

set -euo pipefail
IFS=$'\n\t'

#/ Usage: ./smart.sh
#/ Description: Testing disk health
#/ Examples: ./smart.sh 
#/ Options: None
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $*" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

# cleanup() {
    # Remove temporary files
    # Restart services
    # ...
    # rm $LOG_FILE
# }

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    # trap cleanup EXIT

    email="your@mail.here"
    smart=$(which smartctl)
    disks=$(ls /dev/ | grep -E 'sd[a-z]$')

    info "Disks found : $disks"

    # Looking for PASSED message
    for i in $disks ; do
        if sudo $smart -H /dev/$i | grep -qi 'passed'
            then
                info "$i OK"
        else

mail -s "ALERT : `hostname` disk $i" "$email" << EOF

            SMART $i
            `sudo $smart -a /dev/$i`
EOF

        fi
    done

fi
