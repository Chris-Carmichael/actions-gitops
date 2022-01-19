#!/bin/bash

COUNT=$(git log --oneline HEAD ^refs/remotes/origin/main  | wc -l)
FILES=$(git diff HEAD..HEAD~$COUNT --name-only)

for file in $FILES; do
  DIR=$(dirname $file)
  echo $DIR
done
