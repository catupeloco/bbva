#https://git.io/JuCuu

sudo useradd usr2 -s /bin/bash -d /home/usr
sudo useradd usr3 -s /bin/bash -d /home/usr
sudo useradd usr4 -s /bin/bash

sudo groupadd usr
sudo usermod -a -G usr usr2
sudo usermod -a -G usr usr3
sudo usermod -a -G sudo usr4
sudo mkdir /home/usr
sudo mkdir /home/usr4

sudo chgrp usr /home/usr
sudo chmod g+w /home/usr
sudo chmod g+s /home/usr
sudo chmod o-r /home/usr
sudo chmod o-w /home/usr
sudo chmod o-x /home/usr
sudo chown -R usr4:usr4 /home/usr4
sudo apt-get update
sudo apt install -y apache2
sudo sed -i '/Listen 80/c\Listen 8100' /etc/apache2/ports.conf
sudo /etc/init.d/apache2 restart
sudo chown -R usr4:usr4 /var/www
sudo chmod -R 755 /var/www
sudo chmod 777 /etc/ssh/sshd_config
grep AllowUsers /etc/ssh/sshd_config && grep usr1 /etc/ssh/sshd_config || sed -i 's/AllowUsers/& usr1/' /etc/ssh/sshd_config
grep AllowUsers /etc/ssh/sshd_config || echo AllowUsers usr1 >> /etc/ssh/sshd_config
sudo chmod 644 /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart
echo escriba la clave para usr2
sudo passwd usr2
echo escriba la clave para usr3
sudo passwd usr3
echo escriba la clave para usr4
sudo passwd usr4
