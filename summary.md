# ASSIGNMENT 2 - THE VVSFS

# Basic implementation part

## Remove (unlink)
`vvsfs_unlink` was added to remove files. This part was done in the lab, but, in order to be comaptible with the additional function which is to remove the bounds of the file size and name sizes, some modifications were done in this part.

## Truncate
Tracing through the ftruncate system call. A inode operation `set_attr` is called. Therefore, to implement this truncate, we need to add this operation into our `file_inode_operations`. In `vvsfs_setattr`, if the targeted size is smaller than the current one, it just simply changes the size of the file, while if the targeted size is larger, it will change the following bytes to 0. After doing this, now you are able to change the file size in this filesystem by using `truncate` command.

e.g.
```
truncate -s 10 file1
truncate -s 100 file1
```

## Make directories and remove directories
Two routines, `vvsfs_mkdir` and `vvsfs_rmdir`, were implemented, `mkdir` and `rmdir` commands now be executed to create a directory and remove a directory.

## Recording uid, gid and permissions
Extra routines were added into `vvsfs_inode` and some modifications were done in `vvsfs_create` and `vvsfs_readdir` so it is able to record information including uid, gid and permissions. 
Now you are able to see the users even after you remount the filesystem.

# Additional implementation part

## Remove bounds on the number of inodes for files 
The files are now stored like a linked list, so you are able to create a file with a long name and larger size now,
the inodes are connected to store larger files.

## Encryption
The data is now encrypted before storing into raw file and is decrypted before the file is opened to read.
This restricts users who don't have this particular file system to access and view the contents of all the files.