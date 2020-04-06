# retroarch-buildroot
A retroarch system that is based off of Buildroot

# Supported Architectures:
 - X86_64

# Prerequisets:
 - A linux docker image or system with the following packages:
 https://buildroot.org/downloads/manual/manual.html#requirement-mandatory
 
 If you wish to use Docker, below is a project you can use which will contain
 everything needed to Build buildroot:
 https://github.com/aduskett/buildroot-docker-devel

# How to build

1. Perform the following:
 - Clone
 - make retroarch_x86_defconfig
 - make

2. Write the pendrive

  The build process will create a pendrive image called disk.img in
  output/images.

  Write the image to a pendrive:

  $ dd if=output/images/disk.img of=/dev/sdc; sync

  Once it's done insert it into the target PC and boot.

  Remember that if said PC has another boot device you might need to
  select this alternative for it to boot.

  In the case of EFI boot you might need to disable Secure Boot from
  the setup as well.

# Customizing the build

After running `make retroarch_x86_defconfig` you can run `make menuconfig`

Some key options to change are:
 - System Configuration -> Extra arguments.
   By default the data partition is set to 1GB, you may wish to increase the
   size.

  - Target packages -> Games -> Retroarch
    You can enable Xvideo and Wayland support in this menu or deselect options
    you do not wish to build.

# Adding Radeon Vega and Navi support:

type `make menuconfig` and go to `Target packages -> Graphic libraries and applications -> mesa3d`
Select `llvm support` and `Gallium Radeon SI driver` using the space bar.

Exit and save.

Enabling this option takes a significant amount of extra time to compile and build! Approximatly 150M extra!
