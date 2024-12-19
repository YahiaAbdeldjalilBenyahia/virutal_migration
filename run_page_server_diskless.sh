┌──(kali㉿vmdst)-[~]
└─$ sudo cat run_page_server_diskless.sh
#!/bin/bash
IMAGES_DIR="./checkpoint"
PORT="1234"

echo "Page server is listening at $PORT"
sudo criu page-server --images-dir $IMAGES_DIR --port $PORT
echo "Stopped listening"
