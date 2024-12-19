┌──(kali㉿vmdst)-[~]
└─$ sudo cat restore_diskless.sh
#!/bin/bash
RESTORE_POINT="./checkpoint/diskless"
PAGE_MAP_POINT="./checkpoint"
PROCESS_NAME="simple_loop.out"
echo "Restoring..."
start_time=$(date +%s%3N)
sudo mv $PAGE_MAP_POINT/*.img $RESTORE_POINT
sudo mv $PAGE_MAP_POINT/$PROCESS_NAME .
sudo criu restore --images-dir $RESTORE_POINT --shell-job
end_time=$(date +%s%3N)
restore_time=$((end_time - start_time))
echo "Restoring time ${restore_time}."
