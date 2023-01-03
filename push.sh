git pull git@github.com:Jackenken/xv6.git main
git add .
echo "input commit:"
read ct
git commit -m$ct
git push xv6

