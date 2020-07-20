
# installing Ansible
sudo apt update -y
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# replace hosts file
sudo rm /etc/ansible/hosts
sudo cp /home/vagrant/environment/control/hosts /etc/ansible/hosts
