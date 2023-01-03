//
// Created by jacken on 2023/1/3.
//

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
    static char buf[DIRSIZ+1];
    char *p;

    // Find first character after last slash.
    for(p=path+strlen(path); p >= path && *p != '/'; p--)
        ;
    p++;

    // Return blank-padded name.
    if(strlen(p) >= DIRSIZ)
        return p;
    memmove(buf, p, strlen(p));
    memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
    return buf;
}
void
find(char *path, char* name)
{
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st;

    if((fd = open(path, 0)) < 0){
        fprintf(2, "find: %s doesnot exist\n", path);
        return;
    }

    if(fstat(fd, &st) < 0){
        fprintf(2, "find: cannot stat %s\n", path);
        close(fd);
        return;
    }
//    printf("name:%s\n",name);

    switch(st.type){
        case T_FILE:
            if(strcmp(fmtname(path),name)==0)
                printf("%s %d %d %l\n", (path), st.type, st.ino, st.size);
            break;

        case T_DIR:
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
                printf("find: path too long\n");
                break;
            }
            strcpy(buf, path);
            p = buf+strlen(buf);
            *p++ = '/';
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
                if(de.inum == 0)
                    continue;
                memmove(p, de.name, DIRSIZ);
                p[DIRSIZ] = 0;
                if(stat(buf, &st) < 0){
                    printf("find: cannot stat %s\n", buf);
                    continue;
                }
//                printf("buf:%s,name:%s\n",fmtname(buf),name);
                if(strcmp(fmtname(buf),name)==0)
                    printf("%s %d %d %d\n", (buf), st.type, st.ino, st.size);
                if( strcmp(fmtname(buf),".")!=0 && strcmp(fmtname(buf),"..")!=0 &&st.type==T_DIR){
//                    printf("buf:%s,name:%s\n",(buf),name);
                    find(buf,name);
                }
            }
            break;
    }
    close(fd);
}

int
main(int argc, char *argv[])
{
    if(argc < 2){
        printf("usage:find <path> <name>");
        exit(0);
    }
    if(argc < 3){
        find(".",argv[1]);
        exit(0);
    }
    find(argv[1],argv[2]);
    exit(0);
}

