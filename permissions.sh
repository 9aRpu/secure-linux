#!/bin/bash
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly

chown root:root /etc/cron.daily 
chmod og-rwx /etc/cron.daily

chown root:root /etc/cron.weekly 
chmod og-rwx /etc/cron.weekly

chown root:root /etc/cron.monthly 
chmod og-rwx /etc/cron.monthly

chown root:root /etc/cron.d 
chmod og-rwx /etc/cron.d

chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config

chown root:root /etc/passwd 
chmod 644 /etc/passwd

chown root:shadow /etc/shadow 
chmod o-rwx,g-wx /etc/shadow

chown root:shadow /etc/gshadow 
chmod o-rwx,g-wx /etc/gshadow

chown root:root /etc/passwd- 
chmod 600 /etc/passwd-

chown root:shadow /etc/shadow-
chmod o-rwx,g-wx /etc/shadow-

chown root:shadow /etc/gshadow-
chmod o-rwx,g-wx /etc/gshadow-

chown root:root /boot/grub/grub.cfg 
chmod og-rwx /boot/grub/grub.cfg

for directory in $(getent passwd | cut -d: -f6 | grep home | cut -d/ -f 1-3); do
    chmod g-w $directory
    chmod o-rwx $directory
done