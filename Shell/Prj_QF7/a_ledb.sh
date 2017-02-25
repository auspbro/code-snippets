pca=ledb

echo "INFO, test PCA $pca"

./ledx_i2c_detect.sh $pca
read keyboard
./ledx_led.sh $pca
read keyboard
./ledx_health.sh $pca
read keyboard

./ledb_nfc.sh
read keyboard
