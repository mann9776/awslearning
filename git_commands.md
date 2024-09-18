## clone the repository to local terminal
git clone remote-url

## After modifications to old files or add new files #Staging
git add -all
# or, git add -A

## Use below command to check status
git status

## Commit changes
git commit -m 'Your description'

## Authenticate git operations and connect to github repo
git remote set-url origin https://<PAT_TOKEN>@github.com/username/repository.git

## push changes to the repo
git push

## Recommended  method to push changes to github repo
git config --global credential.helper 'f() { sleep 1; echo "usernam=<username> token=<PAT>"; }; f'

## then perform git push (for windows install git for windows then after git push it will ask for github username and token as password)
git push
