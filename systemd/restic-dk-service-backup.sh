#!/bin/bash

# Create the systemd user directory if it doesn't exist
mkdir -p ~/.config/systemd/user/

# Create the service file
cat > ~/.config/systemd/user/restic-dk-backup.service << 'EOF'
[Unit]
Description=Restic Home Backup Service
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/backups/restic/restic-dk-backup
Nice=19
IOSchedulingClass=idle
TimeoutStartSec=12h

[Install]
WantedBy=default.target
EOF

# Create the timer file
cat > ~/.config/systemd/user/restic-dk-backup.timer << 'EOF'
[Unit]
Description=Run Restic Home Backup daily at 8pm

[Timer]
# Run at 08:00 PM  with a random delay of up to 1 hour
OnCalendar=*-*-* 20:00:00
RandomizedDelaySec=3600
# If system was off when backup should have run, run it when system is on
Persistent=true

[Install]
WantedBy=timers.target
EOF

# Reload systemd user daemon
systemctl --user daemon-reload

# Enable and start the timer
systemctl --user enable restic-dk-backup.timer
systemctl --user start restic-dk-backup.timer

# Verify the timer is active
systemctl --user list-timers --all

