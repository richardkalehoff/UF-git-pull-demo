#!/bin/bash

function removeCommit () {
    # make sure we're on the master branch
    git checkout master &> /dev/null

    # delete the most recent commit so we have something to pull
    git reset --hard HEAD~1 &> /dev/null

    # remove the existing remote
    git remote rm origin &> /dev/null

    # add the remote back
    git remote add origin     https://github.com/richardkalehoff/UF-git-pull-demo.git

    echo "The project is ready. You can now pull in new changes."
}

REQUIRED_NUM_OF_COMMITS=3

CURRENT_NUM_OF_COMMITS=$(git log --oneline | wc -l | awk '{print $1;}')

if [[ "$CURRENT_NUM_OF_COMMITS" -gt "$REQUIRED_NUM_OF_COMMITS" ]]
then
    echo "Removing a commit..."
    removeCommit
else
    echo "You've removed all the commits you can without breaking anything. Now try pulling in new commits!"
fi
