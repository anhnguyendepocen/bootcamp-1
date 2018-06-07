#!/usr/bin/env bash

sitedir=../../python-stats/_pages
while read p; do
  repo=$(dirname "$p")
  user=$(basename $(dirname $(dirname "$p")))
  # git -C $repo pull origin master
  notebook=$(basename "$p")
  cp "$p" "$user.ipynb"
  echo "Copied $notebook as $user.ipynb"
  jupyter nbconvert --output-dir=$sitedir $user.ipynb
done < projects.txt
rm *.ipynb