if [ "$1" == "-r" ]; then
	sudo umount testdir;
	./mkfs.vvsfs vvsfs.raw;
	sudo mount -t vvsfs -o loop vvsfs.raw testdir;
elif [ "$1" == "-v" ]; then
	./view.vvsfs vvsfs.raw
else
	make;
	sudo umount testdir;
	sudo rmmod vvsfs;
	sudo insmod vvsfs.ko;
	sudo mount -t vvsfs -o loop vvsfs.raw testdir;
fi	
