#!/bin/sh -e

## Install Cg library
echo "Installing Cg library in $PS3DEV/bin"

case `uname -s` in
	'Linux')
		wget http://developer.download.nvidia.com/cg/Cg_3.1/Cg-3.1_April2012_x86_64.tgz -O Cg-3.1_April2012_x86_64.tar
		tar xf Cg-3.1_April2012_x86_64.tar usr/lib64/libCg.so
		mkdir -p $PS3DEV/bin
		mv usr/lib64/libCg.so $PS3DEV/bin/
		chmod 644 $PS3DEV/bin/libCg.so
		rm -f Cg-3.1_April2012_x86_64.tar
		rm -rf usr
	;;
	'Darwin')
		wget http://developer.download.nvidia.com/cg/Cg_3.1/Cg-3.1_April2012.dmg -O Cg-3.1_April2012.dmg
		7z -y e Cg-3.1_April2012.dmg NVIDIA_Cg.tgz -r
		tar xzf NVIDIA_Cg.tgz Library/Frameworks/Cg.framework/Versions/1.0/Cg
		mkdir -p $PS3DEV/bin
		mv Library/Frameworks/Cg.framework/Versions/1.0/Cg $PS3DEV/bin/
		chmod 644 $PS3DEV/bin/Cg
		rm -f NVIDIA_Cg.tgz Cg-3.1_April2012.dmg
		rm -rf Library
	;;
esac
