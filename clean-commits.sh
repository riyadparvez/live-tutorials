#!/bin/bash

git reset $(git commit-tree HEAD^{tree} -m "Clean slate!")
git push -f
