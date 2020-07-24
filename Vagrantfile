# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|


  config.vm.define "web" do |web|
    # specifying the box
    web.vm.box = "ubuntu/bionic64"

    # assign IP
    web.vm.network :private_network, ip: "192.168.10.10"

    # assign host name for the vm
    web.vm.hostname = "web"

    # assign host name for browser access
    web.hostsupdater.aliases = ["development.local"]
    web.vm.synced_folder "environment", "/home/vagrant/environment"
    # web.vm.synced_folder "app", "/home/vagrant/app"
    web.vm.provision "shell", path: "environment/web/provision.sh"


  end

  config.vm.define "db" do |db|
    # specifying the box
    db.vm.box = "ubuntu/bionic64"

    # assign IP
    db.vm.network :private_network, ip: "192.168.10.20"

    # assign host name for the vm
    db.vm.hostname = "db"

    # assign host name for browser access
    db.hostsupdater.aliases = ["development.db"]
    db.vm.synced_folder "environment", "/home/vagrant/environment"
    db.vm.provision "shell", path: "environment/db/provision.sh"

  end

  config.vm.define "aws" do |aws|
    # specifying the box
    aws.vm.box = "ubuntu/bionic64"

    # assign IP
    aws.vm.network :private_network, ip: "192.168.10.30"

    # assign host name for the vm
    aws.vm.hostname = "aws"

    # assign host name for browser access
    aws.hostsupdater.aliases = ["development.aws"]
    aws.vm.synced_folder "environment", "/home/vagrant/environment"
    aws.vm.provision "shell", path: "environment/aws/provision.sh"

  end

  config.vm.define "control" do |control|
    # specifying the box
    control.vm.box = "ubuntu/bionic64"

    # assign IP
    control.vm.network :private_network, ip: "192.168.10.40"

    # assign host name for the vm
    control.vm.hostname = "ansible"
    # ansible.vm.synced_folder "environment", "/home/vagrant"
    # assign host name for browser access
    control.hostsupdater.aliases = ["development.ansible"]
    control.vm.synced_folder "environment", "/home/vagrant/environment"
    control.vm.synced_folder "playbook", "/home/vagrant/playbook"
    control.vm.synced_folder "app", "/home/vagrant/app"
    control.vm.provision "shell", path: "environment/control/provision.sh"
    control.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end

end
