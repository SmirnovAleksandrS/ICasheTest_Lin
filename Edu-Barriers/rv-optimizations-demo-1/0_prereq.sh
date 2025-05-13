#!/bin/sh

. ./config.sh

[ -z "`grep safe-path ~/.gdbinit`" ] && echo 'Add "set auto-load safe-path /" to your ~/.gdbinit (or limit to this directory)'

# Fedora
#sudo dnf install ncurses-devel perl-ExtUtils-MakeMaker ninja-build glib2-devel pixman-devel libslirp-devel perl-IPC-Cmd perl-open
# Ubuntu
sudo apt install libncurses-dev libextutils-makemaker-cpanfile-perl ninja-build libglib2.0-dev libpixman-1-dev libslirp-dev lz4 libmpc-dev libgmp-dev gawk

git clone -b 2024.11.x https://git.busybox.net/buildroot
#git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
#cd linux; git checkout v6.13; cd ..
git clone https://github.com/riscv-software-src/opensbi.git
cd opensbi; git checkout v1.6; cd ..
git clone https://github.com/qemu/qemu.git
cd qemu; git checkout v9.1.1; cd ..
git clone https://github.com/hugsy/gef.git
git clone https://github.com/dwks/pagemap.git demo_races/pagemap
sed -i 's/CC = gcc/CC ?= gcc/' demo_races/pagemap/Makefile

mkdir -p output
mkdir -p $ROOTFS_OVERLAY
