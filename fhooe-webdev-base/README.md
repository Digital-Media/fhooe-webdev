# fhooe-webdev-base - A Vagrantfile for Developing the fhooe-webdev Vagrant Box

This directory provides the Vagrantfile that configures the [fhooe/fhooe-webdev box](https://app.vagrantup.com/fhooe/boxes/fhooe-webdev). It is based on the [bento/ubuntu-18.04 box](https://app.vagrantup.com/bento/boxes/ubuntu-18.04) and adds Apache2, PHP 7.4, MariaDB 10.4, Redis Server 5.0, Elasticsearch 7.4, as well as additional tools and scripts.

This Vagrantfile is solely meant for developing the final Vagrant box. Although you can use for web development, provisioning the image takes some time and is most likely not very convenient.

## Installation of software and prerequisites

To use this environment, you will need [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/). For them to work on your machine, make sure the following prerequisites are fulfilled:

* Virtualization is activated in BIOS.
* 10 GB of disk space is available locally. If possible use an SSD for better performance.
* Hyper-V in Windows is deactivated.
* On Mac OS X make sure, VirtualBox has the necessary permissions. Go to "System Settings -> Security -> Allow Virtual Box".

Then install the required software in the following order:

1. Download the latest version of VirtualBox from <https://www.virtualbox.org/wiki/Downloads> and install. Alternatively, when running Windows, use [Chocolatey](https://chocolatey.org/): `choco install virtualbox`.
2. Download the latest version of Vagrant from <https://www.vagrantup.com/downloads.html> and install. With Chocolatey on Windows run `choco install vagrant`.
3. Reboot your computer for all changes to take effect.

## How to use

Follow these steps to build a new fhooe/fhooe-webdev base box and distribute it on Vagrant Cloud.

### Downloading and customizing

Download or clone the [fhooe-webdev](https://github.com/Digital-Media/fhooe-webdev) repository to a location of your choice on your computer.

Make all the changes in the Vagrantfile of the `fhooe-webdev-base` directory. Make sure to document everything in the Vagrantfile, if possible use `echo` statements to show what you are doing.

To test everything, switch to the directory where you cloned/downloaded the repository and select the development subdirectory, e.g. `cd <path-to>/fhooe-webdev/fhooe-webdev-base`. Then run `vagrant up`. This will download the [bento/ubuntu-18.04 box](https://app.vagrantup.com/bento/boxes/ubuntu-18.04) (a minimal Ubuntu image) from Vagrant Cloud, and run all the provisioning steps from the Vagrantfile. Finally, the mache is run in headless mode. Use `vagrant ssh` to connect to the box and make sure, everything is running and configured as planned.

### Creating the fhooe/fhooe-webdev box

If the image has started successfully and all provisioning has worked out as planned, you can package the current state of the machine into a Vagrant box file, which can then be uploaded to Vagrant Cloud as a new release.

#### Cleaning up the image

Before packaging, clean up the image to remove unnecessary files. SSH into the box using `vagrant ssh` and run the subsequent commands:

First, the APT cache is cleaned:

```
$ sudo apt-get clean
```

Then the drive is zeroed out:

```
$ sudo dd if=/dev/zero of=/EMPTY bs=1M
$ sudo rm -f /EMPTY
```

Finally, the bash history is cleared and the SSH connection is exited:

```
$ cat /dev/null > ~/.bash_history && history -c && exit
```

#### Packaging the Vagrant box

The currently running (and now cleaned) machine is now packaged into a Vagrant box file so it can be uploaded to Vagrant Cloud and made available for distribution.

```
vagrant package --output fhooe-webdev-vX.Y.Z.box
```

Replace `X.Y.Z` with the version number you're planning to release. Frankly, the filename doesn't matter for Vagrant Cloud since will be renamed anyway but this lowers the risk of uploading the wrong box version.

### Uploading to Vagrant Cloud

Go to the [fhooe/fhooe-webdev site](https://app.vagrantup.com/fhooe/boxes/fhooe-webdev) on Vagrant Cloud, log in and select [New Version](https://app.vagrantup.com/fhooe/boxes/fhooe-webdev/versions/new).

Add a version number in the RubyGems versioning scheme (e.g. 1.2.3). Do *not* precede the version number with a "v" (e.g. v1.0.0). Also, add a description for this version. This functions as release notes, so include what has changed in this release. Then click "Create version".

Once the version has been created, select "Add a provider" to add the actual box. Choose "virtualbox" in the list of providers and select "SHA512" as a checksum type. To calculate the SHA512 checksum on Windows for your newly created box, use the following PowerShell commandlet:

```
PS> Get-FileHash -Path .\fhooe-webdev-vX.Y.Z.box -Algorithm SHA512 | Format-List
```

On Linux and Mac OS X use this in your terminal:

```
$ shasum -a512 fhooe-webdev-vX.Y.Z.box
```

These commands will calculate and print the checksum for your box. Copy the value and enter it into the "Checksum" field.

Below this, keep the radio button with "Upload to Vagrant Cloud" checked and press "Continue to upload". Choose your box file and upload it. Once this has been done, return to your box's page on Vagrant Cloud. You will notice that the latest release is marked as "unreleased". Click the "Release..." button next to it and then select "Release version". The box is now publicly available for all users.
