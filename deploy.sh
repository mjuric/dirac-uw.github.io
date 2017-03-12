#!/bin/bash

set -e

if [[ $(git status -s) ]]; then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

# Make sure we've got sumo
git submodule init
git submodule update

echo -e "\033[0;32m============== Generating site... ==============\033[0m"
hugo

# Go To Public folder
(
	cd public

	# Add changes to git.
	git add -A

	# Commit changes.
	if [[ ! -z $(git status --untracked-files=no --porcelain) ]]; then
		echo -e "\033[0;32m======== Deploying updates to GitHub... ========\033[0m"

		git commit -m "Source built from $REV" -q

		# Push source and build repos.
		git push
	else
		echo -e "\033[0;32m==== Site unchanged, skipping deployment... ====\033[0m"
	fi
)

echo -e "\033[0;32m===================== Done =====================\033[0m"
