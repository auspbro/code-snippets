echo "INFO, test carrier_health"

v_limit_high=5150
v_limit_low=4950

i_limit_high=2000
i_limit_low=100

p_limit_high=10000
p_limit_low=1000

t_limit_high=50
t_limit_low=20

#(set calibration register) for current monitor
i2cset -y 9 0x40 0x05 0x0064 w
sleep 1

#(read voltage 1.25mV per bit)
v_raw=`i2cget -y 9 0x40 0x02 w`
v_dec=$((256 * 0x${v_raw:4} + 0x${v_raw:2:2}))
v_mil=$((v_dec * 125 / 100))
if [ "$v_mil" -lt "$v_limit_high" ]; then
  if [ "$v_mil" -gt "$v_limit_low" ]; then
    echo "PASS, 5V supply IN spec mV, $v_mil"
  else
    echo "FAIL, 5V supply too low mV, $v_mil"
  fi
else
  echo "FAIL, 5V supply too high mV, $v_mil"
fi

#(read current 0.1mA per bit)
v_raw=`i2cget -y 9 0x40 0x04 w`
v_dec=$((256 * 0x${v_raw:4} + 0x${v_raw:2:2}))
v_mil=$((v_dec / 10))
if [ "$v_mil" -lt "$i_limit_high" ]; then
  if [ "$v_mil" -gt "$i_limit_low" ]; then
    echo "PASS, Current IN spec mA, $v_mil"
  else
    echo "FAIL, Current too low mA, $v_mil"
  fi
else
  echo "FAIL, Current too high mA, $v_mil"
fi

#(read power, 2.5mW per bit)
v_raw=`i2cget -y 9 0x40 0x03 w`
v_dec=$((256 * 0x${v_raw:4} + 0x${v_raw:2:2}))
v_mil=$((v_dec * 25 / 10))
if [ "$v_mil" -lt "$p_limit_high" ]; then
  if [ "$v_mil" -gt "$p_limit_low" ]; then
    echo "PASS, Power IN spec mW, $v_mil"
  else
    echo "FAIL, Power too low mW, $v_mil"
  fi
else
  echo "FAIL, Power too high mW, $v_mil"
fi

#TMP108 temperature measurements on carrier
for i2c_add in 0x48 0x4a; do
  t_raw=`i2cget -y 9 $i2c_add 0x00`
  t_dec=$((0x${t_raw:2}))
  if [ "$t_dec" -lt "$t_limit_high" ]; then
    if [ "$t_dec" -gt "$t_limit_low" ]; then
      echo "PASS, TMP108 at $i2c_add IN spec degC, $t_dec"
    else
      echo "FAIL, TMP108 at $i2c_add too low degC, $t_dec"
    fi
  else
    echo "FAIL, TMP108 at $i2c_add too high degC, $t_dec"
  fi
done
