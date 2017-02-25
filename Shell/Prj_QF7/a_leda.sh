pca=leda

echo "INFO, test PCA $pca"

./ledx_i2c_detect.sh $pca
read keyboard
./ledx_led.sh $pca
read keyboard
./ledx_health.sh $pca
read keyboard

./leda_bt.sh
read keyboard
