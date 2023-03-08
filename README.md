# MIT App Inventor Extensions

This repository is a template repository that you can use for building
an App Inventor extension separate from the App Inventor source repository.

To get started, place the sources for your extension under the `src/`
directory. All of the standard annotations App Inventor provides are
available to you. Any libraries you need should be placed under
`lib/deps/`.

This repository is a fork of the [App Inventor source repository](https://github.com/mit-cml/extension-template).
This one is modified to be run directly on a Vagrant machine.

Vagrant will install all the necessary dependencies for you :
* java 1.8 (OpenJDK)
* ant 1.10 or higher
* git 2.3.10 or higher

When cloning this repository, use the following command:

```shell
git clone --recurse-submodules https://gitlab.u-angers.fr/TomDugue/vagrant-mit-ai2-extension-template.git my-extension
```

## Setup instructions (Vagrant)

Install [Vagrant](https://developer.hashicorp.com/vagrant/downloads) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Open a terminal in the root directory of this repository. Run the following commands

```bash
vagrant plugin install vagrant-vbguest  # optionally for virtualbox users, and only once
vagrant up                              # initializes the VM
```

It may take a few minutes for Vagrant to initialize as it will pull down a virtual machine image from the Internet and configure it with all of the App Inventor dependencies. Subsequent start-ups will be faster. Next, enter the virtual machine by running:

```bash
vagrant ssh
```

This should open up a terminal within the virtual machine in the directory `/vagrant/appinventor`. This directory is the same as the `Inventor Extensions` directory in this repository, shared between your host machine and the virtual machine. Any changes made on one side will be visible in the other. This allows you to edit files on your host machine with your preferred editor, while keeping the build environment relegated to the virtual machine. To build the .aix extenction, you may now run:

```bash
ant
```

Then you can find the extension in the `out` directory.
Enter exit at the prompt to leave the virtual machine. To reclaim resources when you are not actively developing, you can run `vagrant halt` to stop the virtual machine. To completely remove the virtual machine, run `vagrant destroy`. If you destroy the VM, you will need to start these instructions from the top.

Note 1: For macOS users, if you are using VirtualBox and get any error while initializing the VM it may be due to security restrictions in System Preferences, consider reading [this](https://medium.com/@Aenon/mac-virtualbox-kernel-driver-error-df39e7e10cd8) article. 

Note 2: If it seems like none of the dependencies are installed in the VM, run ```vagrant provision```.

If you are cloning from a repository created using GitHub's template
repository feature, you will need to run the `upgrade-appinventor.sh`
script in vagrant to obtain the initial dependencies.
