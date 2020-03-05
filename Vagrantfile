# -*- mode: ruby -*-
# vi: set ft=ruby :
# vim: set et :

Vagrant.configure("2") do |config|
  # Using the fhooe/fhooe-webdev image based Bento Ubuntu box with Ubuntu 18.04 LTS
  config.vm.box = "fhooe/fhooe-webdev" 
  config.vm.box_version = "~> 1.0"
  config.vm.boot_timeout = 1500

  # If Vagrant hangs at SSH to box during startup, this may help if normal troubleshooting doesn't work
  # Deactivate ssh keys for login and use password instead
  # config.ssh.password = "vagrant"
  # config.ssh.insert_key = false

  # Deactivate hardware acceleration for vitualization in VirtualBox (don't use Intel or AMD VT-X)
  # config.vm.provider :virtualbox do |vb|
  #   vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
  # end 
  
  # Creating a private network, which allows host-only access to the machine using a specific IP.
  # Important: avoid IP conflicts with the university network based on 10.*.*.*
  config.vm.network "private_network", ip: "192.168.7.7"

  # Mapping a folder, that can be used for web exercises, allowing Apache running as www-data to write data to these directories
  config.vm.synced_folder "code", "/var/www/html/code", create: true, owner: "www-data", group: "www-data"

  # Copy phpinfo.php to the code directory for easy access
  config.vm.provision "phpinfo: Copy phpinfo.php to code directory", type: "shell", inline: <<-SH
    cp /var/www/html/phpinfo.php /var/www/html/code
  SH

  # Perform service startup for all components (Elasticsearch is currently stopped)
  config.vm.provision "Service startup: Apache2, MariaDB, Redis and Elasticsearch with run: always", type: "shell", run: "always", inline: <<-SH
    service apache2 restart  && echo "Apache started with return code $?"   
    service mysql restart  && echo "MariaDB started with return code $?"
    service redis-server restart && echo "Redis started with return code $?"
    systemctl stop elasticsearch.service && echo "Elasticsearch stopped with return code $?"
  SH
end
