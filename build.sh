rm -rf dist/*
cd optimize
./optimize.sh
cd ../
find pack/ -maxdepth 1 -mindepth 1 ! -name resources -exec  cp -rt dist/ {}  \;
cd dist
packwiz refresh
echo "Pack distribution ready!"