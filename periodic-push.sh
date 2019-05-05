#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
{
  cd ${DIR}
  CHANGED_FILE_LIST=$((git diff --cached --pretty --oneline --name-only; git diff --pretty --oneline --name-only) | xargs -L 1 echo)
  find . -name '*.py' -print0 | xargs -0 git add
  find . -name '*.ipynb' -print0 | xargs -0 git add
  find . -name '*.md' -print0 | xargs -0 git add
  find . -name '*.sh' -print0 | xargs -0 git add
  git add -u :/ && git commit -m "Changed: ${CHANGED_FILE_LIST}" && git push
} &> ${DIR}/push-log.txt
