# Readme
Application code used for the github wiz halftime demo

You will need gulp installed to build this

Once build run:

```bash
npm install -g gulp
```

Then to test built version:
```bash
gulp
node dist/app.js
```

View in browser:
```bash
http://localhost:3000
```

And to test built version in a container locally

```bash
gulp docker
```

View in browser:
```bash
http://localhost:3000
```

To do code changes, PR and merge, execute:
```BRANCH_NAME="fix-testing"
CHANGE_TITLE="Fix simulation"
CHANGE_DESCRIPTION="Wiz test, simulation of a fix to trigger scanning process"
# GET LATEST VERSION FROM MAIN BRANCH
git checkout main
git pull origin main
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
```

