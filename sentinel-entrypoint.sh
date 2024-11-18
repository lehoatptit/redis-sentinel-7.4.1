#!/bin/sh
# sentinel-entrypoint.sh
#entrypoint chay sau khi hoan thanh build image no su dung de chay container
# dam bao thu muc log va data phai ton tai de chay service sentinel trong container

#echo "Tao thu muc cho config redis-sentinel..."
#mkdir -p /redis-sentinel/data
#mkdir -p /redis-sentinel/logs

# cap quyen cho thu muc
echo "cap quyen cho thu muc data va logs "
chmod -R 777 /etc/redis-sentinel/data /redis-sentinel/logs

# kiem tra file configure va chay redis-sentinel
if [ -f /redis-sentinel/sentinel.conf ]; then
  echo "tep da ton tai va dang khoi dong redis-sentinel.."
  redis-server /etc/redis-sentinel/sentinel.conf --sentinel
  echo " Service redis-sentinel da duoc khoi tao thanh cong"
else
  echo "Error: Tep khong ton tai !!! "
  exit 1
fi
