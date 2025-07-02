#! /bin/bash

R="$(date +%y%m%d)-${RANDOM}"
BRANCH_NAME="fix-testing-${R}"
CHANGE_TITLE="Fix simulation ${R}"
CHANGE_DESCRIPTION="Wiz test, simulation of a fix to trigger scanning process ${R}"
# GET LATEST VERSION FROM MAIN BRANCH
#git checkout main
#git pull origin main
# NEW LOCAL BRANCH FOR CHANGES
git checkout -b ${BRANCH_NAME}
# EDIT YOUR FILES
git add .
git commit -m "${CHANGE_DESCRIPTION}"
git push origin ${BRANCH_NAME}
gh pr create --base main --head ${BRANCH_NAME} --title "${CHANGE_TITLE}" --body "${CHANGE_DESCRIPTION}"
gh pr merge ${BRANCH_NAME} --merge
git branch -d ${BRANCH_NAME}
git push origin --delete ${BRANCH_NAME}
