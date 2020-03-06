# fhooe-webdev - A Vagrantfile and Vagrant Box for web development classes

This repository provides a Vagrantfile for a consistent Linux-based web development environment for exercises in web classes at the [Upper Austria University of Applied Sciences (FH Oberösterreich), Hagenberg Campus](https://www.fh-ooe.at/en/hagenberg-campus/).

The box is based on Ubuntu 18.04 LTS and includes Apache 2, PHP 7.4, MariaDB 10.4, Redis Server 5.0, Elasticsearch 7.4, as well as additional tools and scripts.

## Installation of software and prerequisites

To use this environment, you will need [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/). For them to work, make sure the following prerequisites are fulfilled:

* Virtualization is activated in BIOS.
* 10GB disk space is available locally. If possible use an SSD disk for better performance.
* Hyper-V in Windows is deactivated.
* On Mac OS X: Make sure, VirtualBox has the necessary permissions. Go to "System Settings -> Security -> Allow Virtual Box".

Then install the necessary software in the following order:

1. Download the latest version of VirtualBox from <https://www.virtualbox.org/wiki/Downloads> and install. Alternatively, when running Windows, use [Chocolatey](https://chocolatey.org/): `choco install virtualbox`.
2. Download the latest version of Vagrant from <https://www.vagrantup.com/downloads.html> and install. With Chocolatey on Windows run `choco install vagrant`.
3. Reboot your computer for all changes to take effect.

## How to use the Vagrantfile

1. Download or clone the [fhooe-webdev](https://github.com/Digital-Media/fhooe-webdev) repository to a location of your choice on your computer. If you don't want the whole repository, downloading the [Vagrantfile](https://github.com/Digital-Media/fhooe-webdev/blob/master/Vagrantfile) will suffice.
2. Open PowerShell, a command prompt or the terminal.
3. Switch to the directory where you cloned/downloaded the repository or Vagrantfile, e.g. `cd \<path-to\>fhooe-webdev`.
4. Run `vagrant up`. This will download the [fhooe/fhooe-webdev box](https://app.vagrantup.com/fhooe/boxes/fhooe-webdev) (a fully configured Ubuntu image) from Vagrant Cloud, provision it and run it without a GUI (headless mode).
5. Once the image has finished downloading and has started sucessfully, you can use `vagrant ssh` to connect to the image's shell via SSH.
6. To stop and shut down the image call `vagrant halt`.
7. To destroy the image (in case you don't need it anymore or want it re-initialized) call `vagrant destroy`.

## How to use the image for web development

Once the image has successfully booted you will notice that a folder called `code` inside of your `<path-to\>fhooe-webdev` directory has been created. This directory is mapped to `/var/www/html/code` in the image via Vagrant's shared folder functionality. Since it points to Apache's document root, files are immediately served through the web server.

Additionally, the Vagrantfile configures the IP address `192.168.7.7` as a private network, so you can access the machine - and therefore its web server - under this address.

To develop and deploy your web applications, copy them to the `code` folder on your host machine. They will be instantly available through the Vagrant image's web server at 192.168.7.7. E.g.: 

- `code/my_example_project/index.php` -> `https://192.168.7.7/code/my_example_project/index.php`

There's a file called `phpinfo.php` in the `code` directory that allows you to quickly check the configuration of this image. Also [phpMyAdmin] is already installed and configured. These are available like this:

- https://192.168.7.7/code/phpinfo.php
- https://192.168.7.7/phpmyadmin

## Tips and troubleshooting

- During the initial `vagrant up` a stable internet connection for downloading the box file is required. One the box has been downloaded you can work offline.
- If the box hangs during booting at the SSH steps, you can disable the automatic SSH login and use a user/password combination instead. See the commented out sections in the Vagrantfile for this.
- For more tips and troubleshooting, see the [fhooe-webdev Wiki](https://github.com/Digital-Media/fhooe-webdev/wiki).
