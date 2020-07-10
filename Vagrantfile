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

  end

end
