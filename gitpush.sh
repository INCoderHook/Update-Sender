#!/bin/bash
cd ~/Update-Sender || exit

# Git auto add, commit, push
git add .
git commit -m "Auto update from Termux"
git push origin main

# Agar push successful ho gaya to raw URL print karo
if [ $? -eq 0 ]; then
    echo -e "\n✅ Push successful!"

    # Remote repo URL nikaalo
    REPO_URL=$(git remote get-url origin)
    # Example: https://github.com/INCoderHook/Update-Sender.git
    USER_REPO=$(echo "$REPO_URL" | sed -E 's#https://github.com/([^/]+/[^.]+)(\.git)?#\1#')

    # Current branch
    BRANCH=$(git rev-parse --abbrev-ref HEAD)

    echo -e "\n📂 Updated file(s) Raw URL:\n"

    # Last commit me jo files change hue unko raw URL bana ke dikhao
    git diff-tree --no-commit-id --name-only -r HEAD | while read FILE; do
        echo "https://raw.githubusercontent.com/$USER_REPO/$BRANCH/$FILE"
    done
else
    echo -e "\n❌ Push failed!"
fi