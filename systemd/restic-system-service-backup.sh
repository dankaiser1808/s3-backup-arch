#!/bin/bash

# Create the service file (requires sudo)
sudo bash -c 'cat > /etc/systemd/system/restic-system-backup.service << EOF
[Unit]
Description=Restic System Backup Service
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/backups/restic/restic-system-backup
Nice=19
IOSchedulingClass=idle
TimeoutStartSec=2h

[Install]
WantedBy=multi-user.target
EOF'

# Create the timer file
sudo bash -c 'cat > /etc/systemd/system/restic-system-backup.timer << EOF
[Unit]
Description=Run Restic System Backup daily at 8pm

[Timer]
# Run at 08:00 PM  with a random delay of up to 1 hour
OnCalendar=*-*-* 20:00:00
RandomizedDelaySec=3600
Persistent=true

[Install]
WantedBy=timers.target
EOF'

# Reload system daemon
sudo systemctl daemon-reload

# Enable and start the timer
sudo systemctl enable restic-system-backup.timer
sudo systemctl start restic-system-backup.timer

# Verify the timer is active
sudo systemctl list-timers --all
