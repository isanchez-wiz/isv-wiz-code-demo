#! /bin/bash

R="$(date +%y%m%d-%H%M)-${RANDOM}"
BRANCH_NAME="fix-testing-${R}"
CHANGE_TITLE="Fix simulation ${R}"
CHANGE_DESCRIPTION="Wiz test, simulation of a fix to trigger scanning process ${R}"
# GET LATEST VERSION FROM MAIN BRANCH
#git checkout main
#git pull origin main
# NEW LOCAL BRANCH FOR CHANGES
git checkout -b ${BRANCH_NAME}
# EDIT YOUR FILES (force dummy change)
echo "RANDOM: ${R}" > random-file.dummy
git update-index --really-refresh
git add .
git commit -m "${CHANGE_DESCRIPTION}"
git push origin ${BRANCH_NAME}
gh pr create --base main --head ${BRANCH_NAME} --title "${CHANGE_TITLE}" --body "${CHANGE_DESCRIPTION}"
gh pr merge ${BRANCH_NAME} --merge
sleep 5
git branch -d ${BRANCH_NAME}
git push origin --delete ${BRANCH_NAME}
