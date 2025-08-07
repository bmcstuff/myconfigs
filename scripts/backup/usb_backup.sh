#!/bin/bash

# Config
DEVICE_LABEL="usb_backup"
MOUNT_POINT="/mnt/usbbackup"
SOURCE_DIR="/mnt/data/shared/Info"
DEST_DIR="$MOUNT_POINT/backup"
LOG_FILE="/var/log/usb_backup.log"
RSYNC_LOG_FILE="/var/log/usb_backup_rsync.log"

# Logger
log() {
    local message="$1"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $message" | tee -a "$LOG_FILE"
}

log "============================================================="
log "Starting USB Backup"

# Find the device by label
DEVICE=$(lsblk -o NAME,LABEL | grep "$DEVICE_LABEL" | awk '{print $1}')
if [ -z "$DEVICE" ]; then
    log "ERROR: Device with label '$DEVICE_LABEL' not found."
    exit 1
fi

DEVICE_PATH="/dev/$DEVICE"

# Create mount point if it doesn't exist
mkdir -p "$MOUNT_POINT"

# Mount the USB if not already mounted
if ! mount | grep -q "$MOUNT_POINT"; then
    log "Mounting $DEVICE_PATH to $MOUNT_POINT..."
    mount "$DEVICE_PATH" "$MOUNT_POINT"
    if [ $? -ne 0 ]; then
        log "ERROR: Failed to mount $DEVICE_PATH."
        exit 1
    fi
fi

# Run rsync
log "Running rsync"
log "   Source Dir: ${SOURCE_DIR}/"
log "   Dest Dir: ${DEST_DIR}/"
rsync -avh --delete --progress --no-perms --no-group --no-owner "$SOURCE_DIR/" "$DEST_DIR/" --log-file="$RSYNC_LOG_FILE" 2>&1

log "Backup finished successfully."
log "--------------------------------------------------------------"
exit 0
