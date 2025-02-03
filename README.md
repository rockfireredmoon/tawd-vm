# TAWD Virtual Machines

This project makes use of a tool called [vmmmake](https://github.com/jadaptive/vmmake) to build all-in-one virtual machines that contain everything you need to run an [Earth Eternal](https://github.com/rockfireredmoon/iceee) server game, such as [Earth Eternal, Valkal's Shadow](https://github.com/rockfireredmoon/iceee-data/tree/valkals_shadow).

Logging in to to the VM, this is what you will see ...

![](screenshot.png) 

It contains ..

 * A lightweight Debian 12 based operating system. 
 * The [redis](https://redis.io/) database.
 * The `tawd` game server.
 * Appropriate game Data and client assets.
 * All required dependencies.
 
It is available for a number of different hypervisor platforms. Your provider should support one of these, with a fallback option of installing a generic ISO image.

 * OVA (for VirtualBox, VMWare and others)
 * HyperV (Windows)
 * Docker
 * Generic ISO image (Debian Installer)
 
The created VMs will also be easily updateable, both the operating system, the tawd server and game and client assets. Uses the familiar `apt` command.
 
## How To Use
 
Simply download the appropriate image for your provider and follow their instructions. Once you have a running virtual machine, you manage it as any other Debian based server.
 
For more instructions on maintaining a server (creating accounts, shard configuration and more), see [Running On A Server](https://github.com/rockfireredmoon/iceee/blob/master/Doc/SERVER.md) on the main project. 
 
You can also find instructions there if you want to install on top of another operating system. In that case, you will have to setup redis and any other dependencies yourself. This is no longer the recommend method. 
 
## Building Images

*You will need [vmmmake](https://github.com/jadaptive/vmmake) (which is a bit hard to obtain at the moment, it will be  available in the future). These instructions are mostly for my purposes. It is highly unlikely you will ever need them.*
 
```
vmmake -Pversion=0.9.0 --include=ova --workspace=/home/emerald/Desktop/my_workspace recipe.yml
```

 * `-Pversion` argument is used to when generating the final filename (ensuring they are versions). 
 * `--include` argument is used to specify the target type. Other types include `debianlive` (for the ISO image), `kvm`, `docker`, and more. See the `recipe.yml` file for more.
 * `--workspace` argument is to specify where the temporary build workspace is,and may be used to ensure the temporary workspace needed to build is located on a fast drive. 

Look in `artifacts` directory for the results.