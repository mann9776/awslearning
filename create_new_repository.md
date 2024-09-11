## How to create new repository using CLI
### Use below commands in git bash or windows cmd terminal
1. mkdir myDir
2. cd myDir
3. echo any_text > README.md # to create first file
4. git init
5. git add README.md
6. git commit -m "first commit using git cli"
7. curl -u username:Personal_Access_Token https://api.github.com/user/repos -d '{"name":"myDir"}' # this creates repository with name myDir
8. git remote add origin git@github.com:mann9776/awslearning.git
9. git push -u origin master(or main)
