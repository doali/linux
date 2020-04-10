#/usr/bin/env bash

# =============================================================================
# Rename files
# by replacing _ by - (or doing contrary)
# =============================================================================

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly TMP_WORK_FILE=$(mktemp)

replace() {
	local old=${1}
	local new=${2}
  
  for ls_elmnt in $(ls $(pwd)); do
    [[ ${ls_elmnt} =~ ${old} ]] && echo "${ls_elmnt}" >>${TMP_WORK_FILE}
  done

	for elmnt in $(cat ${TMP_WORK_FILE}); do
		mv ${SCRIPT_DIR}/$(echo $elmnt) ${SCRIPT_DIR}/$(echo $elmnt | sed -e "s/${old}/${new}/g")
	done
}

replace_underscore() {
	replace "\_" "\-"
}

replace_hyphens() {
	replace "\-" "\_"
}

usage() {
	echo "Usage: $(basename ${0}) [-rev]"
}

# ------------------------------------------------------------------------------
if [ ${#} -eq 0 ]; then
	replace_underscore
elif [ ${#} -eq 1 ]; then
	case "${1}" in
	-rev)
		replace_hyphens
		;;
	*)
		usage
		;;
	esac
else
	usage
fi

rm ${TMP_WORK_FILE}
