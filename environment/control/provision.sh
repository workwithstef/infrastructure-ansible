
# installing Ansible
sudo apt update -y
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# replace hosts file
sudo rm /etc/ansible/hosts
sudo cp /home/vagrant/environment/control/hosts /etc/ansible/hosts

# set up aws_ec2

# sudo apt install -y python-boto3
# sudo apt install -y python3-botocore

# ALTERNATIVELY

sudo apt install python-pip
pip install botocore
pip install boto3

## Set aws keys

echo "export AWS_ACCESS_KEY_ID=AKIAR7JPX6TNBSTJMZ37" >> ~/.bashrc
echo "export AWS_SECRET_KEY_ID=e0TH9uz1SpoXHw7W8uAfx6dbcxhavBMK1V6bg1m3" >> ~/.bashrc
