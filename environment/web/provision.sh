
# replace sshd_config file
sudo rm /etc/ssh/sshd_config
sudo cp /home/vagrant/environment/web/sshd_config /etc/ssh/sshd_config
sudo service ssh restart
# changes password
echo "root:vagrant" | sudo chpasswd
