service vsftpd start

adduser --disabled-password --gecos "" $USER

chown $USER:$USER /home/$USER

echo "$USER:$FTP_USER_PASS" | chpasswd

touch /etc/vsftpd.chroot_list

chmod 777 /etc/vsftpd.chroot_list

echo "$USER" >> /etc/vsftpd.chroot_list

mkdir -p /var/run/vsftpd/empty

echo "$USER" >> /etc/vsftpd.userlist

sed -i "s|listen=NO|listen=YES|g" /etc/vsftpd.conf

sed -i "s|listen_ipv6=YES|listen_ipv6=NO|g" /etc/vsftpd.conf

sed -i "s|#ftpd_banner|ftpd_banner|g" /etc/vsftpd.conf

sed -i "s|#write_enable=YES|write_enable=YES|g" /etc/vsftpd.conf

sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g" /etc/vsftpd.conf

sed -i "s|#chroot_list_enable=YES|chroot_list_enable=YES|g" /etc/vsftpd.conf

cat vsftpd.conf >> /etc/vsftpd.conf

service vsftpd stop

usr/sbin/vsftpd
