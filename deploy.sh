echo "Building site"
jekyll build
echo "Deploying site to s3"
s3_website push
echo
echo "Don't forget to commit and push to github as well"
