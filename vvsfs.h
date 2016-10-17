#define BLOCKSIZE 512
#define BLOCKSIZE_BITS 8
#define NUMBLOCKS 100
#define MAXNAME 15

#define MAXFILESIZE (BLOCKSIZE - 3*sizeof(int) - sizeof(uid_t) - sizeof(gid_t) - sizeof(umode_t))

#define MIN(a,b) (((a)<(b))?(a):(b))
typedef unsigned short umode_t;

#define true 1
#define false 0


struct vvsfs_inode {
  int is_empty;
  int is_directory;
  int size;
  uid_t i_uid;
  gid_t i_gid;
  umode_t i_mode;
  char data[MAXFILESIZE];
};

struct vvsfs_dir_entry {
  char name[MAXNAME+1];
  int inode_number;
};
