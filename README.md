# rpi4-docker
The purpose of this project is to facilitate mastery with Docker and Visual Studio Code as the IDE for cross-compiling for aarch64 ARM processors, working on an x86-64 based Linux host.

Folks who are interested in a software toolkit with marketable practical value and available for the minor cost of a little bit of focused effort will hopefully find this useful.

- Docker container host capable of also running Visual Studio Code.
- Intended host: Ubuntu 20.04 (VMware guest)
- Intended purpose: Cross-compiler support for Raspberry Pi 4 64-bit development.
  - Value add: support Visual Studio Code as GUI
    - Build invocation
    - Launch build artifact with debugger
    - Remote source debugging with gdb backend
    - NFS & PXE boot for targets that support it
    - Support for Linux, freertos, bare-metal (u-boot) on target
    - Minimal deployment effort for this environment
    - git facilitator (maybe)

### Useful Links ###

- [Jens Depuydt's guide](https://jensd.be/1126/linux/cross-compiling-for-arm-or-aarch64-on-debian-or-ubuntu) to installing the cross compilation tools.

### Ubuntu 20.04 AMD64 Host ###
Download [Ubuntu 20.04 Desktop (AMD64)](https://releases.ubuntu.com/20.04.2.0/ubuntu-20.04.2.0-desktop-amd64.iso) from Canonical 
- Install this image as a bootable OS, however you prefer to do that.  I'm using a VMWare Player guest install, but a native boot should work too.  That's sorta the point with Docker.

**Install some prerequisites:**

    sudo apt install gnome-terminal
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

**Install Docker:**

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor \
        -o /usr/share/keyrings/docker-archive-keyring.gpg
    
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null    

    sudo apt-get install docker-ce docker-ce-cli containerd.io


