#!/usr/bin/env bash

#set -x

# ------------------------------------------------------------------------------
# Convert a file written in Markdown to HTML
# - use pandoc
# - css file
# CSS used comes from
# https://raw.githubusercontent.com/KrauseFx/markdown-to-html-github-style/master/style.css
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# return script path from the current working directory
# https://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
get_script_dir() {
	local source="${BASH_SOURCE[0]}"
	local dir=""
	# While $source is a symlink, resolve it
	while [ -h "$source" ]; do
		dir="$(cd -P "$(dirname "$source")" && pwd)"
		source="$(readlink "$source")"
		# If $source was a relative symlink (so no "/" as prefix,
		# need to resolve it relative to the symlink base directory
		[[ $source != /* ]] && source="$dir/$source"
	done
	dir="$(cd -P "$(dirname "$source")" && pwd)"
	echo $dir # returns to sdout (clever mean to return results)
}

# symlinks are not handled using as described in the following command
#readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# ------------------------------------------------------------------------------
readonly FILE_CSS=md.css
readonly DIR_SCRIPT=$(get_script_dir) # gets from stdout
readonly PANDOC=$(which pandoc)
# ------------------------------------------------------------------------------

error_path() {
	echo "Error path"
	exit 1
}

error_cmd() {
	echo "Error pandoc not found"
	echo "Install it with : sudo apt install pandoc"
	exit 1
}

# Generate
# - an HTML file from ist Markdown (both have the same name)
# - along side with its md.css file
# - both located in $path_output
gen() {
	local path_md=${1}
	local path_output=${2}

	[ -f ${path_md} ] && [ -d ${path_output} ] || error_path

	local file_name_md=$(basename ${path_md})

	file_name_md_no_extension=${file_name_md%.*}

	[ ! -f ${path_output}/${FILE_CSS} ] && cp -f ${DIR_SCRIPT}/${FILE_CSS} ${path_output}

	${PANDOC} -f markdown -t html ${path_md} --css ${FILE_CSS} >${path_output}/${file_name_md_no_extension}.html
}

# Delete all files ending by .html or .css
clean() {
  local exist_html=$(ls *.html 2>/dev/null | wc -l)
  [ ${exist_html} -gt 0 ] && rm -i *.html
	[ -f md.css ] && rm md.css
}

usage() {
	echo "Usage:"
	echo "\t$(basename ${0}) <path_markdown_file> [<path_output>]"
	echo "\t$(basename ${0}) --clean"
}

# ------------------------------------------------------------------------------
if [ -z ${PANDOC} ]; then
	error_cmd
fi

if [ ${#} -eq 2 ]; then
	gen ${1} ${2}
elif [ ${#} -eq 1 ]; then
	case "$1" in
	--clean)
		clean
		;;
	*)
		gen ${1} $(pwd)
		;;
	esac
else
	usage
fi

exit 0
