#!/bin/bash 


#remove public content 
echo "removing public "


rm -rf public
git subtree add --prefix=public https://github.com/jeremejazz/jeremejazz.github.com.git master --squash

git subtree pull --prefix=public  https://github.com/jeremejazz/jeremejazz.github.com.git master
#run hugo compiler
echo "building public folder"
/usr/bin/env hugo


# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi


echo "Starting deployment... press enter to Continue. CTRL + C to cancel"
read -p "Press enter to continue"
 
# Push the public subtree to the gh-pages branch
git subtree push --prefix=public https://github.com/jeremejazz/jeremejazz.github.com.git master
rm -rf public/ 

# Commit and push to master
git add -A
git commit -m "$msg" && git push origin master

