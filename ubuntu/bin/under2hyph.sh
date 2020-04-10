#/usr/bin/env bash

#set -x

# =============================================================================
# Rename files
# by replacing _ by - (or doing the opposite)
# =============================================================================

# ------------------------------------------------------------------------------
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly TMP_WORK_FILE=$(mktemp)
# ------------------------------------------------------------------------------

replace_all() {
	local old=${1}
	local new=${2}

	for ls_elmnt in $(ls $(pwd)); do
		[[ ${ls_elmnt} =~ ${old} ]] && echo "${ls_elmnt}" >>${TMP_WORK_FILE}
	done

	for elmnt in $(cat ${TMP_WORK_FILE}); do
		mv ${SCRIPT_DIR}/$(echo $elmnt) ${SCRIPT_DIR}/$(echo $elmnt | sed -e "s/${old}/${new}/g")
	done
}

replace_word() {
	local old=${1}
	local new=${2}
	local word=${3}

	[ -e ${word} ] && [[ ${word} =~ ${old} ]] && echo "${word}" >>${TMP_WORK_FILE}

	mv ${SCRIPT_DIR}/$(echo ${word}) ${SCRIPT_DIR}/$(echo ${word} | sed -e "s/${old}/${new}/g")
}

replace_all_underscore() {
	replace_all "\_" "\-"
}

replace_all_hyphens() {
	replace_all "\-" "\_"
}

replace_word_underscore() {
  local word=${1}
	replace_word "\_" "\-" ${word}
}

replace_word_hyphens() {
  local word=${1}
	replace_word "\-" "\_" ${word}
}

usage() {
	echo "Usage:"
  echo -e "\t$(basename ${0}) [-rev]"
  echo -e "\t$(basename ${0}) [-w [-rev]] <word>"
}

# ------------------------------------------------------------------------------
if [ ${#} -eq 0 ]; then
	replace_all_underscore
elif [ ${#} -eq 1 ]; then
	case "${1}" in
	-rev)
		replace_all_hyphens
		;;
	*)
		usage
		;;
	esac
elif [ ${#} -le 3 ]; then
  case "${1}" in 
    -w)
      case "${2}" in 
        -rev)
          replace_all_hyphens ${3}
          ;;
        *)
          replace_all_underscore ${2}
          ;;
      esac
      ;;
    *)
      usage
      ;;
  esac
else
	usage
fi

rm ${TMP_WORK_FILE}
