rm -rf dist/*
rsync -av \
  --exclude='resourcepacks/Daedalian' \
  --exclude='*.ignore' \
  --exclude='*.xcf' \
  ./pack/* ./dist
packsquash packsquash.toml
cd dist
packwiz refresh
echo "Pack distribution ready!"