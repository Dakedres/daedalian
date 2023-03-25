rm -rf ../dist/packwiz
rsync -av \
  --exclude='resourcepacks/Daedalian' \
  --exclude='*.ignore' \
  --exclude='*.dev' \
  --exclude='*.xcf' \
  ../pack/* ../dist/packwiz
packsquash packsquash.toml
cd ../dist/packwiz
packwiz refresh
echo "Packwiz distribution ready!"