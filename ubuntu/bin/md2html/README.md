# Convert Markdown to HTML

# Requirements

- bash (GNU Bourne-Again SHell)
- pandoc : `sudo apt install pandoc`

# Test

- Ubuntu 18.04.4 LTS

# Description
Convert a file written in Markdown to HTML

- use pandoc
- css file

# What is done
Generate

- an HTML file from its Markdown (both have the same name)
- along side with its md.css file
- both located in output path

# Usage

```bash
Usage: md2html <path_markdown_file> [<path_output>]
```

# Biblio

- [css](https://raw.githubusercontent.com/KrauseFx/markdown-to-html-github-style/master/style.css)
- [pandoc](https://pandoc.org/)
- [script directory](https://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script)
