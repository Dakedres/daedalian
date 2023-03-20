# cp -r template /tmp/packsquash
cp -r ../pack/resourcepacks/Better\ Extra /tmp/packsquash/pack
packsquash options.toml
cd ../dist
unzip /tmp/packsquash/resources.zip -x pack.mcmeta
mv -f assets resources
# rm -rf /tmp/packsquash/pack