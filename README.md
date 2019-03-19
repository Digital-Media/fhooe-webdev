# fhooe-webdev
Repo to provide a Vagrantfile for a web development environment for excercises in web lessons

Visit us at https://www.fh-ooe.at/en/hagenberg-campus/

See the [Wiki](https://github.com/Digital-Media/hgb-phpdev/wiki) to learn how the vagrant box was built.

For Troubleshooting Tips see the [Wiki](https://github.com/Digital-Media/fhooe-webdev/wiki)


# Install

* Virtualization has to be activated in BIOS
* 10GB disk space locally. If possible use a SSD disk for better performance.
* Hyper-V in Windows has to be inactive
* It looks like Windows 7 and PowerShell do not work any longer with Vagrant. Microsoft removed the link to the version, that worked.
* For MAC: System Settings -> Security --> Allow Virtual Box

* Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
* Install [Vagrant by HashiCorp](https://www.vagrantup.com/downloads.html)
* Reboot your computer
* Recommended: Install [PHPStorm Toolbox](https://www.jetbrains.com/toolbox/app/) 
* Optional: Install [GitHub Desktop](https://desktop.github.com/), [GitForWindows](https://gitforwindows.org/)

# Versions tested

* Vagrant 2.1.5 with Virtual Box 5.2.18
* Vagrant 2.2.4 with Virtual Box 6.0.4
* PHPStorm 2018.1.6
* Virtual Box Versions >= 6.x do not work

# Usage

* Download or clone fhooe-webdev from GitHub
* Open PowerShell or terminal
* ``cd \<path-to\>fhooe-webdev`` 
* Create a directory ``code``
* This ``code`` directory, is mapped to /var/www/html/code in the image via shared folders.
* While first ``vagrant up`` you need a stable internet connection for downloading the box file
* ``vagrant up`` (to start image)
* ``vagrant halt`` (to stop image)
* ``vagrant ssh`` (if you need a bash)
* for more information see [Vagrant Documentation](https://www.vagrantup.com/docs/)

# Test installation and mapping in browser

  * https://192.168.7.7/code/phpinfo.php
  * https://192.168.7.7/phpmyadmin
