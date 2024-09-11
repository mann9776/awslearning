### How to create new repository using CLI
mkdir myDir
cd myDir
echo any_text > README.md # to create first file
git init
git add README.md
git commit -m "first commit using git cli"
curl -u username:Personal_Access_Token https://api.github.com/user/repos -d '{"name":"myDir"}' # this creates repository with name myDir
git remote add origin git@github.com:mann9776/awslearning.git
git push -u origin master(or main)
