call npm run build
cd dist

call git init .

call git add -A

call git commit -m "deploy"

call git push -f git@github.com:SamiKoh/dashbord-optician.git master:gh-pages

cd ..