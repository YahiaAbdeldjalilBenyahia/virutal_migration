┌──(kali㉿vmsrc)-[~]
└─$ sudo cat migrate_lazy.sh     
#!/bin/bash

# Configurations
SOURCE_VM="192.168.196.10"
TARGET_VM="192.168.196.20"
USER="kali"
PASSWORD="yahia123"
REMOTE_DIR="./checkpoint"  # Directory on target VM to store dumped images
PROCESS_NAME="./simple_loop.out"   # process to be dumped
IMAGE_DIR="./checkpoint/lazy"   # Local directory for CRIU images
PAGE_SERVER="192.168.196.20"

START_TIME_FILE="./start_time.log"
END_TIME_FILE="./end_time.log"


# Step 1: Dump the process with CRIU
echo "Dumping the process..."
start_time=$(date +%s%3N)  # Capture start time for downtime
sudo criu dump --tree $(pidof $PROCESS_NAME) --images-dir $IMAGE_DIR --shell-job

# Step 2: Send the images to the target VM using SCP with sshpass
echo "Sending the images to the target VM..."
sudo sshpass -p "$PASSWORD" sudo scp -r $IMAGE_DIR $USER@$TARGET_VM:$REMOTE_DIR
sudo sshpass -p "$PASSWORD" sudo scp -r $PROCSES_NAME $USER@$TARGET_VM:$PROCESS_NAME
 

end_time=$(date +%s%3N) # Capture end time
downtime=$((end_time - start_time))
# Step 3: Output the downtime
echo "Migration downtime: $downtime miliseconds"
