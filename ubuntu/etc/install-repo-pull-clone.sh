#!/usr/bin/env bash

# Create a script repo-pull-clone
# - in ${HOME}/.local/bin
# - to run repo-pull-clone.sh
#   - located in git-github
# git-github [directory containing]
# - git clone https://github.com/github.git
# - and certainly mode

readonly NAME=repo-pull-clone
readonly GIT_PATH=${HOME}/git-github/github
readonly DST_SCRIPT=${HOME}/.local/bin/${NAME}

cat <<EOF >${DST_SCRIPT}
#!/usr/bin/env bash

cd ${GIT_PATH} 1> /dev/null
./${NAME}.sh $@
cd - 1> /dev/null
EOF

[ -f ${DST_SCRIPT} ] && chmod +x ${DST_SCRIPT}
