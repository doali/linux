#!/bin/bash

# Output file
OUTPUT_FILE=$HOME/.bashrc

# tilix package
sudo apt install tilix

# Settings bashrc
cat << EOT >>$OUTPUT_FILE
if [ \$TILIX_ID ] || [ \$VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
EOT

sudo ln -snf /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Settings bashrc
cat << EOT >>$OUTPUT_FILE
function custom_prompt() {
  __git_ps1 "\[\033[0;31m\]\u \[\033[0;36m\]\h:\w\[\033[00m\]" " \n\[\033[0;31m\]>\[\033[00m\] " " %s"
  VTE_PWD_THING="$(__vte_osc7)"
  PS1="$PS1$VTE_PWD_THING"
}
PROMPT_COMMAND=custom_prompt
EOT

