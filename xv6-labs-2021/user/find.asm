
user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	84aa                	mv	s1,a0
    static char buf[DIRSIZ+1];
    char *p;

    // Find first character after last slash.
    for(p=path+strlen(path); p >= path && *p != '/'; p--)
  10:	00000097          	auipc	ra,0x0
  14:	3a0080e7          	jalr	928(ra) # 3b0 <strlen>
  18:	02051793          	slli	a5,a0,0x20
  1c:	9381                	srli	a5,a5,0x20
  1e:	97a6                	add	a5,a5,s1
  20:	02f00693          	li	a3,47
  24:	0097e963          	bltu	a5,s1,36 <fmtname+0x36>
  28:	0007c703          	lbu	a4,0(a5)
  2c:	00d70563          	beq	a4,a3,36 <fmtname+0x36>
  30:	17fd                	addi	a5,a5,-1
  32:	fe97fbe3          	bgeu	a5,s1,28 <fmtname+0x28>
        ;
    p++;
  36:	00178493          	addi	s1,a5,1

    // Return blank-padded name.
    if(strlen(p) >= DIRSIZ)
  3a:	8526                	mv	a0,s1
  3c:	00000097          	auipc	ra,0x0
  40:	374080e7          	jalr	884(ra) # 3b0 <strlen>
  44:	2501                	sext.w	a0,a0
  46:	47b5                	li	a5,13
  48:	00a7fa63          	bgeu	a5,a0,5c <fmtname+0x5c>
        return p;
    memmove(buf, p, strlen(p));
    memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
    return buf;
}
  4c:	8526                	mv	a0,s1
  4e:	70a2                	ld	ra,40(sp)
  50:	7402                	ld	s0,32(sp)
  52:	64e2                	ld	s1,24(sp)
  54:	6942                	ld	s2,16(sp)
  56:	69a2                	ld	s3,8(sp)
  58:	6145                	addi	sp,sp,48
  5a:	8082                	ret
    memmove(buf, p, strlen(p));
  5c:	8526                	mv	a0,s1
  5e:	00000097          	auipc	ra,0x0
  62:	352080e7          	jalr	850(ra) # 3b0 <strlen>
  66:	00001997          	auipc	s3,0x1
  6a:	b4a98993          	addi	s3,s3,-1206 # bb0 <buf.0>
  6e:	0005061b          	sext.w	a2,a0
  72:	85a6                	mv	a1,s1
  74:	854e                	mv	a0,s3
  76:	00000097          	auipc	ra,0x0
  7a:	4ae080e7          	jalr	1198(ra) # 524 <memmove>
    memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
  7e:	8526                	mv	a0,s1
  80:	00000097          	auipc	ra,0x0
  84:	330080e7          	jalr	816(ra) # 3b0 <strlen>
  88:	0005091b          	sext.w	s2,a0
  8c:	8526                	mv	a0,s1
  8e:	00000097          	auipc	ra,0x0
  92:	322080e7          	jalr	802(ra) # 3b0 <strlen>
  96:	1902                	slli	s2,s2,0x20
  98:	02095913          	srli	s2,s2,0x20
  9c:	4639                	li	a2,14
  9e:	9e09                	subw	a2,a2,a0
  a0:	4581                	li	a1,0
  a2:	01298533          	add	a0,s3,s2
  a6:	00000097          	auipc	ra,0x0
  aa:	334080e7          	jalr	820(ra) # 3da <memset>
    return buf;
  ae:	84ce                	mv	s1,s3
  b0:	bf71                	j	4c <fmtname+0x4c>

00000000000000b2 <find>:
void
find(char *path, char* name)
{
  b2:	d8010113          	addi	sp,sp,-640
  b6:	26113c23          	sd	ra,632(sp)
  ba:	26813823          	sd	s0,624(sp)
  be:	26913423          	sd	s1,616(sp)
  c2:	27213023          	sd	s2,608(sp)
  c6:	25313c23          	sd	s3,600(sp)
  ca:	25413823          	sd	s4,592(sp)
  ce:	25513423          	sd	s5,584(sp)
  d2:	25613023          	sd	s6,576(sp)
  d6:	23713c23          	sd	s7,568(sp)
  da:	23813823          	sd	s8,560(sp)
  de:	0500                	addi	s0,sp,640
  e0:	892a                	mv	s2,a0
  e2:	89ae                	mv	s3,a1
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st;

    if((fd = open(path, 0)) < 0){
  e4:	4581                	li	a1,0
  e6:	00000097          	auipc	ra,0x0
  ea:	530080e7          	jalr	1328(ra) # 616 <open>
  ee:	06054c63          	bltz	a0,166 <find+0xb4>
  f2:	84aa                	mv	s1,a0
        fprintf(2, "find: %s doesnot exist\n", path);
        return;
    }

    if(fstat(fd, &st) < 0){
  f4:	d8840593          	addi	a1,s0,-632
  f8:	00000097          	auipc	ra,0x0
  fc:	536080e7          	jalr	1334(ra) # 62e <fstat>
 100:	06054e63          	bltz	a0,17c <find+0xca>
        close(fd);
        return;
    }
//    printf("name:%s\n",name);

    switch(st.type){
 104:	d9041783          	lh	a5,-624(s0)
 108:	0007869b          	sext.w	a3,a5
 10c:	4705                	li	a4,1
 10e:	0ae68763          	beq	a3,a4,1bc <find+0x10a>
 112:	4709                	li	a4,2
 114:	00e69d63          	bne	a3,a4,12e <find+0x7c>
        case T_FILE:
            if(strcmp(fmtname(path),name)==0)
 118:	854a                	mv	a0,s2
 11a:	00000097          	auipc	ra,0x0
 11e:	ee6080e7          	jalr	-282(ra) # 0 <fmtname>
 122:	85ce                	mv	a1,s3
 124:	00000097          	auipc	ra,0x0
 128:	260080e7          	jalr	608(ra) # 384 <strcmp>
 12c:	c925                	beqz	a0,19c <find+0xea>
                    find(buf,name);
                }
            }
            break;
    }
    close(fd);
 12e:	8526                	mv	a0,s1
 130:	00000097          	auipc	ra,0x0
 134:	4ce080e7          	jalr	1230(ra) # 5fe <close>
}
 138:	27813083          	ld	ra,632(sp)
 13c:	27013403          	ld	s0,624(sp)
 140:	26813483          	ld	s1,616(sp)
 144:	26013903          	ld	s2,608(sp)
 148:	25813983          	ld	s3,600(sp)
 14c:	25013a03          	ld	s4,592(sp)
 150:	24813a83          	ld	s5,584(sp)
 154:	24013b03          	ld	s6,576(sp)
 158:	23813b83          	ld	s7,568(sp)
 15c:	23013c03          	ld	s8,560(sp)
 160:	28010113          	addi	sp,sp,640
 164:	8082                	ret
        fprintf(2, "find: %s doesnot exist\n", path);
 166:	864a                	mv	a2,s2
 168:	00001597          	auipc	a1,0x1
 16c:	98858593          	addi	a1,a1,-1656 # af0 <malloc+0xe4>
 170:	4509                	li	a0,2
 172:	00000097          	auipc	ra,0x0
 176:	7ae080e7          	jalr	1966(ra) # 920 <fprintf>
        return;
 17a:	bf7d                	j	138 <find+0x86>
        fprintf(2, "find: cannot stat %s\n", path);
 17c:	864a                	mv	a2,s2
 17e:	00001597          	auipc	a1,0x1
 182:	98a58593          	addi	a1,a1,-1654 # b08 <malloc+0xfc>
 186:	4509                	li	a0,2
 188:	00000097          	auipc	ra,0x0
 18c:	798080e7          	jalr	1944(ra) # 920 <fprintf>
        close(fd);
 190:	8526                	mv	a0,s1
 192:	00000097          	auipc	ra,0x0
 196:	46c080e7          	jalr	1132(ra) # 5fe <close>
        return;
 19a:	bf79                	j	138 <find+0x86>
                printf("%s %d %d %l\n", (path), st.type, st.ino, st.size);
 19c:	d9843703          	ld	a4,-616(s0)
 1a0:	d8c42683          	lw	a3,-628(s0)
 1a4:	d9041603          	lh	a2,-624(s0)
 1a8:	85ca                	mv	a1,s2
 1aa:	00001517          	auipc	a0,0x1
 1ae:	97650513          	addi	a0,a0,-1674 # b20 <malloc+0x114>
 1b2:	00000097          	auipc	ra,0x0
 1b6:	79c080e7          	jalr	1948(ra) # 94e <printf>
 1ba:	bf95                	j	12e <find+0x7c>
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1bc:	854a                	mv	a0,s2
 1be:	00000097          	auipc	ra,0x0
 1c2:	1f2080e7          	jalr	498(ra) # 3b0 <strlen>
 1c6:	2541                	addiw	a0,a0,16
 1c8:	20000793          	li	a5,512
 1cc:	00a7fb63          	bgeu	a5,a0,1e2 <find+0x130>
                printf("find: path too long\n");
 1d0:	00001517          	auipc	a0,0x1
 1d4:	96050513          	addi	a0,a0,-1696 # b30 <malloc+0x124>
 1d8:	00000097          	auipc	ra,0x0
 1dc:	776080e7          	jalr	1910(ra) # 94e <printf>
                break;
 1e0:	b7b9                	j	12e <find+0x7c>
            strcpy(buf, path);
 1e2:	85ca                	mv	a1,s2
 1e4:	db040513          	addi	a0,s0,-592
 1e8:	00000097          	auipc	ra,0x0
 1ec:	180080e7          	jalr	384(ra) # 368 <strcpy>
            p = buf+strlen(buf);
 1f0:	db040513          	addi	a0,s0,-592
 1f4:	00000097          	auipc	ra,0x0
 1f8:	1bc080e7          	jalr	444(ra) # 3b0 <strlen>
 1fc:	02051913          	slli	s2,a0,0x20
 200:	02095913          	srli	s2,s2,0x20
 204:	db040793          	addi	a5,s0,-592
 208:	993e                	add	s2,s2,a5
            *p++ = '/';
 20a:	00190a13          	addi	s4,s2,1
 20e:	02f00793          	li	a5,47
 212:	00f90023          	sb	a5,0(s2)
                if( strcmp(fmtname(buf),".")!=0 && strcmp(fmtname(buf),"..")!=0 &&st.type==T_DIR){
 216:	00001a97          	auipc	s5,0x1
 21a:	942a8a93          	addi	s5,s5,-1726 # b58 <malloc+0x14c>
 21e:	00001b97          	auipc	s7,0x1
 222:	942b8b93          	addi	s7,s7,-1726 # b60 <malloc+0x154>
 226:	4c05                	li	s8,1
                    printf("%s %d %d %d\n", (buf), st.type, st.ino, st.size);
 228:	00001b17          	auipc	s6,0x1
 22c:	920b0b13          	addi	s6,s6,-1760 # b48 <malloc+0x13c>
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
 230:	4641                	li	a2,16
 232:	da040593          	addi	a1,s0,-608
 236:	8526                	mv	a0,s1
 238:	00000097          	auipc	ra,0x0
 23c:	3b6080e7          	jalr	950(ra) # 5ee <read>
 240:	47c1                	li	a5,16
 242:	eef516e3          	bne	a0,a5,12e <find+0x7c>
                if(de.inum == 0)
 246:	da045783          	lhu	a5,-608(s0)
 24a:	d3fd                	beqz	a5,230 <find+0x17e>
                memmove(p, de.name, DIRSIZ);
 24c:	4639                	li	a2,14
 24e:	da240593          	addi	a1,s0,-606
 252:	8552                	mv	a0,s4
 254:	00000097          	auipc	ra,0x0
 258:	2d0080e7          	jalr	720(ra) # 524 <memmove>
                p[DIRSIZ] = 0;
 25c:	000907a3          	sb	zero,15(s2)
                if(stat(buf, &st) < 0){
 260:	d8840593          	addi	a1,s0,-632
 264:	db040513          	addi	a0,s0,-592
 268:	00000097          	auipc	ra,0x0
 26c:	22c080e7          	jalr	556(ra) # 494 <stat>
 270:	06054263          	bltz	a0,2d4 <find+0x222>
                if(strcmp(fmtname(buf),name)==0)
 274:	db040513          	addi	a0,s0,-592
 278:	00000097          	auipc	ra,0x0
 27c:	d88080e7          	jalr	-632(ra) # 0 <fmtname>
 280:	85ce                	mv	a1,s3
 282:	00000097          	auipc	ra,0x0
 286:	102080e7          	jalr	258(ra) # 384 <strcmp>
 28a:	c125                	beqz	a0,2ea <find+0x238>
                if( strcmp(fmtname(buf),".")!=0 && strcmp(fmtname(buf),"..")!=0 &&st.type==T_DIR){
 28c:	db040513          	addi	a0,s0,-592
 290:	00000097          	auipc	ra,0x0
 294:	d70080e7          	jalr	-656(ra) # 0 <fmtname>
 298:	85d6                	mv	a1,s5
 29a:	00000097          	auipc	ra,0x0
 29e:	0ea080e7          	jalr	234(ra) # 384 <strcmp>
 2a2:	d559                	beqz	a0,230 <find+0x17e>
 2a4:	db040513          	addi	a0,s0,-592
 2a8:	00000097          	auipc	ra,0x0
 2ac:	d58080e7          	jalr	-680(ra) # 0 <fmtname>
 2b0:	85de                	mv	a1,s7
 2b2:	00000097          	auipc	ra,0x0
 2b6:	0d2080e7          	jalr	210(ra) # 384 <strcmp>
 2ba:	d93d                	beqz	a0,230 <find+0x17e>
 2bc:	d9041783          	lh	a5,-624(s0)
 2c0:	f78798e3          	bne	a5,s8,230 <find+0x17e>
                    find(buf,name);
 2c4:	85ce                	mv	a1,s3
 2c6:	db040513          	addi	a0,s0,-592
 2ca:	00000097          	auipc	ra,0x0
 2ce:	de8080e7          	jalr	-536(ra) # b2 <find>
 2d2:	bfb9                	j	230 <find+0x17e>
                    printf("find: cannot stat %s\n", buf);
 2d4:	db040593          	addi	a1,s0,-592
 2d8:	00001517          	auipc	a0,0x1
 2dc:	83050513          	addi	a0,a0,-2000 # b08 <malloc+0xfc>
 2e0:	00000097          	auipc	ra,0x0
 2e4:	66e080e7          	jalr	1646(ra) # 94e <printf>
                    continue;
 2e8:	b7a1                	j	230 <find+0x17e>
                    printf("%s %d %d %d\n", (buf), st.type, st.ino, st.size);
 2ea:	d9843703          	ld	a4,-616(s0)
 2ee:	d8c42683          	lw	a3,-628(s0)
 2f2:	d9041603          	lh	a2,-624(s0)
 2f6:	db040593          	addi	a1,s0,-592
 2fa:	855a                	mv	a0,s6
 2fc:	00000097          	auipc	ra,0x0
 300:	652080e7          	jalr	1618(ra) # 94e <printf>
 304:	b761                	j	28c <find+0x1da>

0000000000000306 <main>:

int
main(int argc, char *argv[])
{
 306:	1141                	addi	sp,sp,-16
 308:	e406                	sd	ra,8(sp)
 30a:	e022                	sd	s0,0(sp)
 30c:	0800                	addi	s0,sp,16
    if(argc < 2){
 30e:	4705                	li	a4,1
 310:	02a75463          	bge	a4,a0,338 <main+0x32>
 314:	87ae                	mv	a5,a1
        printf("usage:find <path> <name>");
        exit(0);
    }
    if(argc < 3){
 316:	4709                	li	a4,2
 318:	02a74d63          	blt	a4,a0,352 <main+0x4c>
        find(".",argv[1]);
 31c:	658c                	ld	a1,8(a1)
 31e:	00001517          	auipc	a0,0x1
 322:	83a50513          	addi	a0,a0,-1990 # b58 <malloc+0x14c>
 326:	00000097          	auipc	ra,0x0
 32a:	d8c080e7          	jalr	-628(ra) # b2 <find>
        exit(0);
 32e:	4501                	li	a0,0
 330:	00000097          	auipc	ra,0x0
 334:	2a6080e7          	jalr	678(ra) # 5d6 <exit>
        printf("usage:find <path> <name>");
 338:	00001517          	auipc	a0,0x1
 33c:	83050513          	addi	a0,a0,-2000 # b68 <malloc+0x15c>
 340:	00000097          	auipc	ra,0x0
 344:	60e080e7          	jalr	1550(ra) # 94e <printf>
        exit(0);
 348:	4501                	li	a0,0
 34a:	00000097          	auipc	ra,0x0
 34e:	28c080e7          	jalr	652(ra) # 5d6 <exit>
    }
    find(argv[1],argv[2]);
 352:	698c                	ld	a1,16(a1)
 354:	6788                	ld	a0,8(a5)
 356:	00000097          	auipc	ra,0x0
 35a:	d5c080e7          	jalr	-676(ra) # b2 <find>
    exit(0);
 35e:	4501                	li	a0,0
 360:	00000097          	auipc	ra,0x0
 364:	276080e7          	jalr	630(ra) # 5d6 <exit>

0000000000000368 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 368:	1141                	addi	sp,sp,-16
 36a:	e422                	sd	s0,8(sp)
 36c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 36e:	87aa                	mv	a5,a0
 370:	0585                	addi	a1,a1,1
 372:	0785                	addi	a5,a5,1
 374:	fff5c703          	lbu	a4,-1(a1)
 378:	fee78fa3          	sb	a4,-1(a5)
 37c:	fb75                	bnez	a4,370 <strcpy+0x8>
    ;
  return os;
}
 37e:	6422                	ld	s0,8(sp)
 380:	0141                	addi	sp,sp,16
 382:	8082                	ret

0000000000000384 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 384:	1141                	addi	sp,sp,-16
 386:	e422                	sd	s0,8(sp)
 388:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 38a:	00054783          	lbu	a5,0(a0)
 38e:	cb91                	beqz	a5,3a2 <strcmp+0x1e>
 390:	0005c703          	lbu	a4,0(a1)
 394:	00f71763          	bne	a4,a5,3a2 <strcmp+0x1e>
    p++, q++;
 398:	0505                	addi	a0,a0,1
 39a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 39c:	00054783          	lbu	a5,0(a0)
 3a0:	fbe5                	bnez	a5,390 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 3a2:	0005c503          	lbu	a0,0(a1)
}
 3a6:	40a7853b          	subw	a0,a5,a0
 3aa:	6422                	ld	s0,8(sp)
 3ac:	0141                	addi	sp,sp,16
 3ae:	8082                	ret

00000000000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	1141                	addi	sp,sp,-16
 3b2:	e422                	sd	s0,8(sp)
 3b4:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 3b6:	00054783          	lbu	a5,0(a0)
 3ba:	cf91                	beqz	a5,3d6 <strlen+0x26>
 3bc:	0505                	addi	a0,a0,1
 3be:	87aa                	mv	a5,a0
 3c0:	4685                	li	a3,1
 3c2:	9e89                	subw	a3,a3,a0
 3c4:	00f6853b          	addw	a0,a3,a5
 3c8:	0785                	addi	a5,a5,1
 3ca:	fff7c703          	lbu	a4,-1(a5)
 3ce:	fb7d                	bnez	a4,3c4 <strlen+0x14>
    ;
  return n;
}
 3d0:	6422                	ld	s0,8(sp)
 3d2:	0141                	addi	sp,sp,16
 3d4:	8082                	ret
  for(n = 0; s[n]; n++)
 3d6:	4501                	li	a0,0
 3d8:	bfe5                	j	3d0 <strlen+0x20>

00000000000003da <memset>:

void*
memset(void *dst, int c, uint n)
{
 3da:	1141                	addi	sp,sp,-16
 3dc:	e422                	sd	s0,8(sp)
 3de:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 3e0:	ca19                	beqz	a2,3f6 <memset+0x1c>
 3e2:	87aa                	mv	a5,a0
 3e4:	1602                	slli	a2,a2,0x20
 3e6:	9201                	srli	a2,a2,0x20
 3e8:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 3ec:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 3f0:	0785                	addi	a5,a5,1
 3f2:	fee79de3          	bne	a5,a4,3ec <memset+0x12>
  }
  return dst;
}
 3f6:	6422                	ld	s0,8(sp)
 3f8:	0141                	addi	sp,sp,16
 3fa:	8082                	ret

00000000000003fc <strchr>:

char*
strchr(const char *s, char c)
{
 3fc:	1141                	addi	sp,sp,-16
 3fe:	e422                	sd	s0,8(sp)
 400:	0800                	addi	s0,sp,16
  for(; *s; s++)
 402:	00054783          	lbu	a5,0(a0)
 406:	cb99                	beqz	a5,41c <strchr+0x20>
    if(*s == c)
 408:	00f58763          	beq	a1,a5,416 <strchr+0x1a>
  for(; *s; s++)
 40c:	0505                	addi	a0,a0,1
 40e:	00054783          	lbu	a5,0(a0)
 412:	fbfd                	bnez	a5,408 <strchr+0xc>
      return (char*)s;
  return 0;
 414:	4501                	li	a0,0
}
 416:	6422                	ld	s0,8(sp)
 418:	0141                	addi	sp,sp,16
 41a:	8082                	ret
  return 0;
 41c:	4501                	li	a0,0
 41e:	bfe5                	j	416 <strchr+0x1a>

0000000000000420 <gets>:

char*
gets(char *buf, int max)
{
 420:	711d                	addi	sp,sp,-96
 422:	ec86                	sd	ra,88(sp)
 424:	e8a2                	sd	s0,80(sp)
 426:	e4a6                	sd	s1,72(sp)
 428:	e0ca                	sd	s2,64(sp)
 42a:	fc4e                	sd	s3,56(sp)
 42c:	f852                	sd	s4,48(sp)
 42e:	f456                	sd	s5,40(sp)
 430:	f05a                	sd	s6,32(sp)
 432:	ec5e                	sd	s7,24(sp)
 434:	1080                	addi	s0,sp,96
 436:	8baa                	mv	s7,a0
 438:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 43a:	892a                	mv	s2,a0
 43c:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 43e:	4aa9                	li	s5,10
 440:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 442:	89a6                	mv	s3,s1
 444:	2485                	addiw	s1,s1,1
 446:	0344d863          	bge	s1,s4,476 <gets+0x56>
    cc = read(0, &c, 1);
 44a:	4605                	li	a2,1
 44c:	faf40593          	addi	a1,s0,-81
 450:	4501                	li	a0,0
 452:	00000097          	auipc	ra,0x0
 456:	19c080e7          	jalr	412(ra) # 5ee <read>
    if(cc < 1)
 45a:	00a05e63          	blez	a0,476 <gets+0x56>
    buf[i++] = c;
 45e:	faf44783          	lbu	a5,-81(s0)
 462:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 466:	01578763          	beq	a5,s5,474 <gets+0x54>
 46a:	0905                	addi	s2,s2,1
 46c:	fd679be3          	bne	a5,s6,442 <gets+0x22>
  for(i=0; i+1 < max; ){
 470:	89a6                	mv	s3,s1
 472:	a011                	j	476 <gets+0x56>
 474:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 476:	99de                	add	s3,s3,s7
 478:	00098023          	sb	zero,0(s3)
  return buf;
}
 47c:	855e                	mv	a0,s7
 47e:	60e6                	ld	ra,88(sp)
 480:	6446                	ld	s0,80(sp)
 482:	64a6                	ld	s1,72(sp)
 484:	6906                	ld	s2,64(sp)
 486:	79e2                	ld	s3,56(sp)
 488:	7a42                	ld	s4,48(sp)
 48a:	7aa2                	ld	s5,40(sp)
 48c:	7b02                	ld	s6,32(sp)
 48e:	6be2                	ld	s7,24(sp)
 490:	6125                	addi	sp,sp,96
 492:	8082                	ret

0000000000000494 <stat>:

int
stat(const char *n, struct stat *st)
{
 494:	1101                	addi	sp,sp,-32
 496:	ec06                	sd	ra,24(sp)
 498:	e822                	sd	s0,16(sp)
 49a:	e426                	sd	s1,8(sp)
 49c:	e04a                	sd	s2,0(sp)
 49e:	1000                	addi	s0,sp,32
 4a0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a2:	4581                	li	a1,0
 4a4:	00000097          	auipc	ra,0x0
 4a8:	172080e7          	jalr	370(ra) # 616 <open>
  if(fd < 0)
 4ac:	02054563          	bltz	a0,4d6 <stat+0x42>
 4b0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 4b2:	85ca                	mv	a1,s2
 4b4:	00000097          	auipc	ra,0x0
 4b8:	17a080e7          	jalr	378(ra) # 62e <fstat>
 4bc:	892a                	mv	s2,a0
  close(fd);
 4be:	8526                	mv	a0,s1
 4c0:	00000097          	auipc	ra,0x0
 4c4:	13e080e7          	jalr	318(ra) # 5fe <close>
  return r;
}
 4c8:	854a                	mv	a0,s2
 4ca:	60e2                	ld	ra,24(sp)
 4cc:	6442                	ld	s0,16(sp)
 4ce:	64a2                	ld	s1,8(sp)
 4d0:	6902                	ld	s2,0(sp)
 4d2:	6105                	addi	sp,sp,32
 4d4:	8082                	ret
    return -1;
 4d6:	597d                	li	s2,-1
 4d8:	bfc5                	j	4c8 <stat+0x34>

00000000000004da <atoi>:

int
atoi(const char *s)
{
 4da:	1141                	addi	sp,sp,-16
 4dc:	e422                	sd	s0,8(sp)
 4de:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4e0:	00054603          	lbu	a2,0(a0)
 4e4:	fd06079b          	addiw	a5,a2,-48
 4e8:	0ff7f793          	andi	a5,a5,255
 4ec:	4725                	li	a4,9
 4ee:	02f76963          	bltu	a4,a5,520 <atoi+0x46>
 4f2:	86aa                	mv	a3,a0
  n = 0;
 4f4:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 4f6:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 4f8:	0685                	addi	a3,a3,1
 4fa:	0025179b          	slliw	a5,a0,0x2
 4fe:	9fa9                	addw	a5,a5,a0
 500:	0017979b          	slliw	a5,a5,0x1
 504:	9fb1                	addw	a5,a5,a2
 506:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 50a:	0006c603          	lbu	a2,0(a3)
 50e:	fd06071b          	addiw	a4,a2,-48
 512:	0ff77713          	andi	a4,a4,255
 516:	fee5f1e3          	bgeu	a1,a4,4f8 <atoi+0x1e>
  return n;
}
 51a:	6422                	ld	s0,8(sp)
 51c:	0141                	addi	sp,sp,16
 51e:	8082                	ret
  n = 0;
 520:	4501                	li	a0,0
 522:	bfe5                	j	51a <atoi+0x40>

0000000000000524 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 524:	1141                	addi	sp,sp,-16
 526:	e422                	sd	s0,8(sp)
 528:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 52a:	02b57463          	bgeu	a0,a1,552 <memmove+0x2e>
    while(n-- > 0)
 52e:	00c05f63          	blez	a2,54c <memmove+0x28>
 532:	1602                	slli	a2,a2,0x20
 534:	9201                	srli	a2,a2,0x20
 536:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 53a:	872a                	mv	a4,a0
      *dst++ = *src++;
 53c:	0585                	addi	a1,a1,1
 53e:	0705                	addi	a4,a4,1
 540:	fff5c683          	lbu	a3,-1(a1)
 544:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 548:	fee79ae3          	bne	a5,a4,53c <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 54c:	6422                	ld	s0,8(sp)
 54e:	0141                	addi	sp,sp,16
 550:	8082                	ret
    dst += n;
 552:	00c50733          	add	a4,a0,a2
    src += n;
 556:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 558:	fec05ae3          	blez	a2,54c <memmove+0x28>
 55c:	fff6079b          	addiw	a5,a2,-1
 560:	1782                	slli	a5,a5,0x20
 562:	9381                	srli	a5,a5,0x20
 564:	fff7c793          	not	a5,a5
 568:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 56a:	15fd                	addi	a1,a1,-1
 56c:	177d                	addi	a4,a4,-1
 56e:	0005c683          	lbu	a3,0(a1)
 572:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 576:	fee79ae3          	bne	a5,a4,56a <memmove+0x46>
 57a:	bfc9                	j	54c <memmove+0x28>

000000000000057c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 57c:	1141                	addi	sp,sp,-16
 57e:	e422                	sd	s0,8(sp)
 580:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 582:	ca05                	beqz	a2,5b2 <memcmp+0x36>
 584:	fff6069b          	addiw	a3,a2,-1
 588:	1682                	slli	a3,a3,0x20
 58a:	9281                	srli	a3,a3,0x20
 58c:	0685                	addi	a3,a3,1
 58e:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 590:	00054783          	lbu	a5,0(a0)
 594:	0005c703          	lbu	a4,0(a1)
 598:	00e79863          	bne	a5,a4,5a8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 59c:	0505                	addi	a0,a0,1
    p2++;
 59e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 5a0:	fed518e3          	bne	a0,a3,590 <memcmp+0x14>
  }
  return 0;
 5a4:	4501                	li	a0,0
 5a6:	a019                	j	5ac <memcmp+0x30>
      return *p1 - *p2;
 5a8:	40e7853b          	subw	a0,a5,a4
}
 5ac:	6422                	ld	s0,8(sp)
 5ae:	0141                	addi	sp,sp,16
 5b0:	8082                	ret
  return 0;
 5b2:	4501                	li	a0,0
 5b4:	bfe5                	j	5ac <memcmp+0x30>

00000000000005b6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 5b6:	1141                	addi	sp,sp,-16
 5b8:	e406                	sd	ra,8(sp)
 5ba:	e022                	sd	s0,0(sp)
 5bc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 5be:	00000097          	auipc	ra,0x0
 5c2:	f66080e7          	jalr	-154(ra) # 524 <memmove>
}
 5c6:	60a2                	ld	ra,8(sp)
 5c8:	6402                	ld	s0,0(sp)
 5ca:	0141                	addi	sp,sp,16
 5cc:	8082                	ret

00000000000005ce <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 5ce:	4885                	li	a7,1
 ecall
 5d0:	00000073          	ecall
 ret
 5d4:	8082                	ret

00000000000005d6 <exit>:
.global exit
exit:
 li a7, SYS_exit
 5d6:	4889                	li	a7,2
 ecall
 5d8:	00000073          	ecall
 ret
 5dc:	8082                	ret

00000000000005de <wait>:
.global wait
wait:
 li a7, SYS_wait
 5de:	488d                	li	a7,3
 ecall
 5e0:	00000073          	ecall
 ret
 5e4:	8082                	ret

00000000000005e6 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 5e6:	4891                	li	a7,4
 ecall
 5e8:	00000073          	ecall
 ret
 5ec:	8082                	ret

00000000000005ee <read>:
.global read
read:
 li a7, SYS_read
 5ee:	4895                	li	a7,5
 ecall
 5f0:	00000073          	ecall
 ret
 5f4:	8082                	ret

00000000000005f6 <write>:
.global write
write:
 li a7, SYS_write
 5f6:	48c1                	li	a7,16
 ecall
 5f8:	00000073          	ecall
 ret
 5fc:	8082                	ret

00000000000005fe <close>:
.global close
close:
 li a7, SYS_close
 5fe:	48d5                	li	a7,21
 ecall
 600:	00000073          	ecall
 ret
 604:	8082                	ret

0000000000000606 <kill>:
.global kill
kill:
 li a7, SYS_kill
 606:	4899                	li	a7,6
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <exec>:
.global exec
exec:
 li a7, SYS_exec
 60e:	489d                	li	a7,7
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <open>:
.global open
open:
 li a7, SYS_open
 616:	48bd                	li	a7,15
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 61e:	48c5                	li	a7,17
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 626:	48c9                	li	a7,18
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 62e:	48a1                	li	a7,8
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <link>:
.global link
link:
 li a7, SYS_link
 636:	48cd                	li	a7,19
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 63e:	48d1                	li	a7,20
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 646:	48a5                	li	a7,9
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <dup>:
.global dup
dup:
 li a7, SYS_dup
 64e:	48a9                	li	a7,10
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 656:	48ad                	li	a7,11
 ecall
 658:	00000073          	ecall
 ret
 65c:	8082                	ret

000000000000065e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 65e:	48b1                	li	a7,12
 ecall
 660:	00000073          	ecall
 ret
 664:	8082                	ret

0000000000000666 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 666:	48b5                	li	a7,13
 ecall
 668:	00000073          	ecall
 ret
 66c:	8082                	ret

000000000000066e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 66e:	48b9                	li	a7,14
 ecall
 670:	00000073          	ecall
 ret
 674:	8082                	ret

0000000000000676 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 676:	1101                	addi	sp,sp,-32
 678:	ec06                	sd	ra,24(sp)
 67a:	e822                	sd	s0,16(sp)
 67c:	1000                	addi	s0,sp,32
 67e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 682:	4605                	li	a2,1
 684:	fef40593          	addi	a1,s0,-17
 688:	00000097          	auipc	ra,0x0
 68c:	f6e080e7          	jalr	-146(ra) # 5f6 <write>
}
 690:	60e2                	ld	ra,24(sp)
 692:	6442                	ld	s0,16(sp)
 694:	6105                	addi	sp,sp,32
 696:	8082                	ret

0000000000000698 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 698:	7139                	addi	sp,sp,-64
 69a:	fc06                	sd	ra,56(sp)
 69c:	f822                	sd	s0,48(sp)
 69e:	f426                	sd	s1,40(sp)
 6a0:	f04a                	sd	s2,32(sp)
 6a2:	ec4e                	sd	s3,24(sp)
 6a4:	0080                	addi	s0,sp,64
 6a6:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6a8:	c299                	beqz	a3,6ae <printint+0x16>
 6aa:	0805c863          	bltz	a1,73a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6ae:	2581                	sext.w	a1,a1
  neg = 0;
 6b0:	4881                	li	a7,0
 6b2:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 6b6:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 6b8:	2601                	sext.w	a2,a2
 6ba:	00000517          	auipc	a0,0x0
 6be:	4d650513          	addi	a0,a0,1238 # b90 <digits>
 6c2:	883a                	mv	a6,a4
 6c4:	2705                	addiw	a4,a4,1
 6c6:	02c5f7bb          	remuw	a5,a1,a2
 6ca:	1782                	slli	a5,a5,0x20
 6cc:	9381                	srli	a5,a5,0x20
 6ce:	97aa                	add	a5,a5,a0
 6d0:	0007c783          	lbu	a5,0(a5)
 6d4:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 6d8:	0005879b          	sext.w	a5,a1
 6dc:	02c5d5bb          	divuw	a1,a1,a2
 6e0:	0685                	addi	a3,a3,1
 6e2:	fec7f0e3          	bgeu	a5,a2,6c2 <printint+0x2a>
  if(neg)
 6e6:	00088b63          	beqz	a7,6fc <printint+0x64>
    buf[i++] = '-';
 6ea:	fd040793          	addi	a5,s0,-48
 6ee:	973e                	add	a4,a4,a5
 6f0:	02d00793          	li	a5,45
 6f4:	fef70823          	sb	a5,-16(a4)
 6f8:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 6fc:	02e05863          	blez	a4,72c <printint+0x94>
 700:	fc040793          	addi	a5,s0,-64
 704:	00e78933          	add	s2,a5,a4
 708:	fff78993          	addi	s3,a5,-1
 70c:	99ba                	add	s3,s3,a4
 70e:	377d                	addiw	a4,a4,-1
 710:	1702                	slli	a4,a4,0x20
 712:	9301                	srli	a4,a4,0x20
 714:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 718:	fff94583          	lbu	a1,-1(s2)
 71c:	8526                	mv	a0,s1
 71e:	00000097          	auipc	ra,0x0
 722:	f58080e7          	jalr	-168(ra) # 676 <putc>
  while(--i >= 0)
 726:	197d                	addi	s2,s2,-1
 728:	ff3918e3          	bne	s2,s3,718 <printint+0x80>
}
 72c:	70e2                	ld	ra,56(sp)
 72e:	7442                	ld	s0,48(sp)
 730:	74a2                	ld	s1,40(sp)
 732:	7902                	ld	s2,32(sp)
 734:	69e2                	ld	s3,24(sp)
 736:	6121                	addi	sp,sp,64
 738:	8082                	ret
    x = -xx;
 73a:	40b005bb          	negw	a1,a1
    neg = 1;
 73e:	4885                	li	a7,1
    x = -xx;
 740:	bf8d                	j	6b2 <printint+0x1a>

0000000000000742 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 742:	7119                	addi	sp,sp,-128
 744:	fc86                	sd	ra,120(sp)
 746:	f8a2                	sd	s0,112(sp)
 748:	f4a6                	sd	s1,104(sp)
 74a:	f0ca                	sd	s2,96(sp)
 74c:	ecce                	sd	s3,88(sp)
 74e:	e8d2                	sd	s4,80(sp)
 750:	e4d6                	sd	s5,72(sp)
 752:	e0da                	sd	s6,64(sp)
 754:	fc5e                	sd	s7,56(sp)
 756:	f862                	sd	s8,48(sp)
 758:	f466                	sd	s9,40(sp)
 75a:	f06a                	sd	s10,32(sp)
 75c:	ec6e                	sd	s11,24(sp)
 75e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 760:	0005c903          	lbu	s2,0(a1)
 764:	18090f63          	beqz	s2,902 <vprintf+0x1c0>
 768:	8aaa                	mv	s5,a0
 76a:	8b32                	mv	s6,a2
 76c:	00158493          	addi	s1,a1,1
  state = 0;
 770:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 772:	02500a13          	li	s4,37
      if(c == 'd'){
 776:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 77a:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 77e:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 782:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 786:	00000b97          	auipc	s7,0x0
 78a:	40ab8b93          	addi	s7,s7,1034 # b90 <digits>
 78e:	a839                	j	7ac <vprintf+0x6a>
        putc(fd, c);
 790:	85ca                	mv	a1,s2
 792:	8556                	mv	a0,s5
 794:	00000097          	auipc	ra,0x0
 798:	ee2080e7          	jalr	-286(ra) # 676 <putc>
 79c:	a019                	j	7a2 <vprintf+0x60>
    } else if(state == '%'){
 79e:	01498f63          	beq	s3,s4,7bc <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 7a2:	0485                	addi	s1,s1,1
 7a4:	fff4c903          	lbu	s2,-1(s1)
 7a8:	14090d63          	beqz	s2,902 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 7ac:	0009079b          	sext.w	a5,s2
    if(state == 0){
 7b0:	fe0997e3          	bnez	s3,79e <vprintf+0x5c>
      if(c == '%'){
 7b4:	fd479ee3          	bne	a5,s4,790 <vprintf+0x4e>
        state = '%';
 7b8:	89be                	mv	s3,a5
 7ba:	b7e5                	j	7a2 <vprintf+0x60>
      if(c == 'd'){
 7bc:	05878063          	beq	a5,s8,7fc <vprintf+0xba>
      } else if(c == 'l') {
 7c0:	05978c63          	beq	a5,s9,818 <vprintf+0xd6>
      } else if(c == 'x') {
 7c4:	07a78863          	beq	a5,s10,834 <vprintf+0xf2>
      } else if(c == 'p') {
 7c8:	09b78463          	beq	a5,s11,850 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 7cc:	07300713          	li	a4,115
 7d0:	0ce78663          	beq	a5,a4,89c <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7d4:	06300713          	li	a4,99
 7d8:	0ee78e63          	beq	a5,a4,8d4 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 7dc:	11478863          	beq	a5,s4,8ec <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7e0:	85d2                	mv	a1,s4
 7e2:	8556                	mv	a0,s5
 7e4:	00000097          	auipc	ra,0x0
 7e8:	e92080e7          	jalr	-366(ra) # 676 <putc>
        putc(fd, c);
 7ec:	85ca                	mv	a1,s2
 7ee:	8556                	mv	a0,s5
 7f0:	00000097          	auipc	ra,0x0
 7f4:	e86080e7          	jalr	-378(ra) # 676 <putc>
      }
      state = 0;
 7f8:	4981                	li	s3,0
 7fa:	b765                	j	7a2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 7fc:	008b0913          	addi	s2,s6,8
 800:	4685                	li	a3,1
 802:	4629                	li	a2,10
 804:	000b2583          	lw	a1,0(s6)
 808:	8556                	mv	a0,s5
 80a:	00000097          	auipc	ra,0x0
 80e:	e8e080e7          	jalr	-370(ra) # 698 <printint>
 812:	8b4a                	mv	s6,s2
      state = 0;
 814:	4981                	li	s3,0
 816:	b771                	j	7a2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 818:	008b0913          	addi	s2,s6,8
 81c:	4681                	li	a3,0
 81e:	4629                	li	a2,10
 820:	000b2583          	lw	a1,0(s6)
 824:	8556                	mv	a0,s5
 826:	00000097          	auipc	ra,0x0
 82a:	e72080e7          	jalr	-398(ra) # 698 <printint>
 82e:	8b4a                	mv	s6,s2
      state = 0;
 830:	4981                	li	s3,0
 832:	bf85                	j	7a2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 834:	008b0913          	addi	s2,s6,8
 838:	4681                	li	a3,0
 83a:	4641                	li	a2,16
 83c:	000b2583          	lw	a1,0(s6)
 840:	8556                	mv	a0,s5
 842:	00000097          	auipc	ra,0x0
 846:	e56080e7          	jalr	-426(ra) # 698 <printint>
 84a:	8b4a                	mv	s6,s2
      state = 0;
 84c:	4981                	li	s3,0
 84e:	bf91                	j	7a2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 850:	008b0793          	addi	a5,s6,8
 854:	f8f43423          	sd	a5,-120(s0)
 858:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 85c:	03000593          	li	a1,48
 860:	8556                	mv	a0,s5
 862:	00000097          	auipc	ra,0x0
 866:	e14080e7          	jalr	-492(ra) # 676 <putc>
  putc(fd, 'x');
 86a:	85ea                	mv	a1,s10
 86c:	8556                	mv	a0,s5
 86e:	00000097          	auipc	ra,0x0
 872:	e08080e7          	jalr	-504(ra) # 676 <putc>
 876:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 878:	03c9d793          	srli	a5,s3,0x3c
 87c:	97de                	add	a5,a5,s7
 87e:	0007c583          	lbu	a1,0(a5)
 882:	8556                	mv	a0,s5
 884:	00000097          	auipc	ra,0x0
 888:	df2080e7          	jalr	-526(ra) # 676 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 88c:	0992                	slli	s3,s3,0x4
 88e:	397d                	addiw	s2,s2,-1
 890:	fe0914e3          	bnez	s2,878 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 894:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 898:	4981                	li	s3,0
 89a:	b721                	j	7a2 <vprintf+0x60>
        s = va_arg(ap, char*);
 89c:	008b0993          	addi	s3,s6,8
 8a0:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 8a4:	02090163          	beqz	s2,8c6 <vprintf+0x184>
        while(*s != 0){
 8a8:	00094583          	lbu	a1,0(s2)
 8ac:	c9a1                	beqz	a1,8fc <vprintf+0x1ba>
          putc(fd, *s);
 8ae:	8556                	mv	a0,s5
 8b0:	00000097          	auipc	ra,0x0
 8b4:	dc6080e7          	jalr	-570(ra) # 676 <putc>
          s++;
 8b8:	0905                	addi	s2,s2,1
        while(*s != 0){
 8ba:	00094583          	lbu	a1,0(s2)
 8be:	f9e5                	bnez	a1,8ae <vprintf+0x16c>
        s = va_arg(ap, char*);
 8c0:	8b4e                	mv	s6,s3
      state = 0;
 8c2:	4981                	li	s3,0
 8c4:	bdf9                	j	7a2 <vprintf+0x60>
          s = "(null)";
 8c6:	00000917          	auipc	s2,0x0
 8ca:	2c290913          	addi	s2,s2,706 # b88 <malloc+0x17c>
        while(*s != 0){
 8ce:	02800593          	li	a1,40
 8d2:	bff1                	j	8ae <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 8d4:	008b0913          	addi	s2,s6,8
 8d8:	000b4583          	lbu	a1,0(s6)
 8dc:	8556                	mv	a0,s5
 8de:	00000097          	auipc	ra,0x0
 8e2:	d98080e7          	jalr	-616(ra) # 676 <putc>
 8e6:	8b4a                	mv	s6,s2
      state = 0;
 8e8:	4981                	li	s3,0
 8ea:	bd65                	j	7a2 <vprintf+0x60>
        putc(fd, c);
 8ec:	85d2                	mv	a1,s4
 8ee:	8556                	mv	a0,s5
 8f0:	00000097          	auipc	ra,0x0
 8f4:	d86080e7          	jalr	-634(ra) # 676 <putc>
      state = 0;
 8f8:	4981                	li	s3,0
 8fa:	b565                	j	7a2 <vprintf+0x60>
        s = va_arg(ap, char*);
 8fc:	8b4e                	mv	s6,s3
      state = 0;
 8fe:	4981                	li	s3,0
 900:	b54d                	j	7a2 <vprintf+0x60>
    }
  }
}
 902:	70e6                	ld	ra,120(sp)
 904:	7446                	ld	s0,112(sp)
 906:	74a6                	ld	s1,104(sp)
 908:	7906                	ld	s2,96(sp)
 90a:	69e6                	ld	s3,88(sp)
 90c:	6a46                	ld	s4,80(sp)
 90e:	6aa6                	ld	s5,72(sp)
 910:	6b06                	ld	s6,64(sp)
 912:	7be2                	ld	s7,56(sp)
 914:	7c42                	ld	s8,48(sp)
 916:	7ca2                	ld	s9,40(sp)
 918:	7d02                	ld	s10,32(sp)
 91a:	6de2                	ld	s11,24(sp)
 91c:	6109                	addi	sp,sp,128
 91e:	8082                	ret

0000000000000920 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 920:	715d                	addi	sp,sp,-80
 922:	ec06                	sd	ra,24(sp)
 924:	e822                	sd	s0,16(sp)
 926:	1000                	addi	s0,sp,32
 928:	e010                	sd	a2,0(s0)
 92a:	e414                	sd	a3,8(s0)
 92c:	e818                	sd	a4,16(s0)
 92e:	ec1c                	sd	a5,24(s0)
 930:	03043023          	sd	a6,32(s0)
 934:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 938:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 93c:	8622                	mv	a2,s0
 93e:	00000097          	auipc	ra,0x0
 942:	e04080e7          	jalr	-508(ra) # 742 <vprintf>
}
 946:	60e2                	ld	ra,24(sp)
 948:	6442                	ld	s0,16(sp)
 94a:	6161                	addi	sp,sp,80
 94c:	8082                	ret

000000000000094e <printf>:

void
printf(const char *fmt, ...)
{
 94e:	711d                	addi	sp,sp,-96
 950:	ec06                	sd	ra,24(sp)
 952:	e822                	sd	s0,16(sp)
 954:	1000                	addi	s0,sp,32
 956:	e40c                	sd	a1,8(s0)
 958:	e810                	sd	a2,16(s0)
 95a:	ec14                	sd	a3,24(s0)
 95c:	f018                	sd	a4,32(s0)
 95e:	f41c                	sd	a5,40(s0)
 960:	03043823          	sd	a6,48(s0)
 964:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 968:	00840613          	addi	a2,s0,8
 96c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 970:	85aa                	mv	a1,a0
 972:	4505                	li	a0,1
 974:	00000097          	auipc	ra,0x0
 978:	dce080e7          	jalr	-562(ra) # 742 <vprintf>
}
 97c:	60e2                	ld	ra,24(sp)
 97e:	6442                	ld	s0,16(sp)
 980:	6125                	addi	sp,sp,96
 982:	8082                	ret

0000000000000984 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 984:	1141                	addi	sp,sp,-16
 986:	e422                	sd	s0,8(sp)
 988:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 98a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 98e:	00000797          	auipc	a5,0x0
 992:	21a7b783          	ld	a5,538(a5) # ba8 <freep>
 996:	a805                	j	9c6 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 998:	4618                	lw	a4,8(a2)
 99a:	9db9                	addw	a1,a1,a4
 99c:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a0:	6398                	ld	a4,0(a5)
 9a2:	6318                	ld	a4,0(a4)
 9a4:	fee53823          	sd	a4,-16(a0)
 9a8:	a091                	j	9ec <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9aa:	ff852703          	lw	a4,-8(a0)
 9ae:	9e39                	addw	a2,a2,a4
 9b0:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 9b2:	ff053703          	ld	a4,-16(a0)
 9b6:	e398                	sd	a4,0(a5)
 9b8:	a099                	j	9fe <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ba:	6398                	ld	a4,0(a5)
 9bc:	00e7e463          	bltu	a5,a4,9c4 <free+0x40>
 9c0:	00e6ea63          	bltu	a3,a4,9d4 <free+0x50>
{
 9c4:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c6:	fed7fae3          	bgeu	a5,a3,9ba <free+0x36>
 9ca:	6398                	ld	a4,0(a5)
 9cc:	00e6e463          	bltu	a3,a4,9d4 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d0:	fee7eae3          	bltu	a5,a4,9c4 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 9d4:	ff852583          	lw	a1,-8(a0)
 9d8:	6390                	ld	a2,0(a5)
 9da:	02059713          	slli	a4,a1,0x20
 9de:	9301                	srli	a4,a4,0x20
 9e0:	0712                	slli	a4,a4,0x4
 9e2:	9736                	add	a4,a4,a3
 9e4:	fae60ae3          	beq	a2,a4,998 <free+0x14>
    bp->s.ptr = p->s.ptr;
 9e8:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 9ec:	4790                	lw	a2,8(a5)
 9ee:	02061713          	slli	a4,a2,0x20
 9f2:	9301                	srli	a4,a4,0x20
 9f4:	0712                	slli	a4,a4,0x4
 9f6:	973e                	add	a4,a4,a5
 9f8:	fae689e3          	beq	a3,a4,9aa <free+0x26>
  } else
    p->s.ptr = bp;
 9fc:	e394                	sd	a3,0(a5)
  freep = p;
 9fe:	00000717          	auipc	a4,0x0
 a02:	1af73523          	sd	a5,426(a4) # ba8 <freep>
}
 a06:	6422                	ld	s0,8(sp)
 a08:	0141                	addi	sp,sp,16
 a0a:	8082                	ret

0000000000000a0c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a0c:	7139                	addi	sp,sp,-64
 a0e:	fc06                	sd	ra,56(sp)
 a10:	f822                	sd	s0,48(sp)
 a12:	f426                	sd	s1,40(sp)
 a14:	f04a                	sd	s2,32(sp)
 a16:	ec4e                	sd	s3,24(sp)
 a18:	e852                	sd	s4,16(sp)
 a1a:	e456                	sd	s5,8(sp)
 a1c:	e05a                	sd	s6,0(sp)
 a1e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a20:	02051493          	slli	s1,a0,0x20
 a24:	9081                	srli	s1,s1,0x20
 a26:	04bd                	addi	s1,s1,15
 a28:	8091                	srli	s1,s1,0x4
 a2a:	0014899b          	addiw	s3,s1,1
 a2e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a30:	00000517          	auipc	a0,0x0
 a34:	17853503          	ld	a0,376(a0) # ba8 <freep>
 a38:	c515                	beqz	a0,a64 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a3c:	4798                	lw	a4,8(a5)
 a3e:	02977f63          	bgeu	a4,s1,a7c <malloc+0x70>
 a42:	8a4e                	mv	s4,s3
 a44:	0009871b          	sext.w	a4,s3
 a48:	6685                	lui	a3,0x1
 a4a:	00d77363          	bgeu	a4,a3,a50 <malloc+0x44>
 a4e:	6a05                	lui	s4,0x1
 a50:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a54:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a58:	00000917          	auipc	s2,0x0
 a5c:	15090913          	addi	s2,s2,336 # ba8 <freep>
  if(p == (char*)-1)
 a60:	5afd                	li	s5,-1
 a62:	a88d                	j	ad4 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a64:	00000797          	auipc	a5,0x0
 a68:	15c78793          	addi	a5,a5,348 # bc0 <base>
 a6c:	00000717          	auipc	a4,0x0
 a70:	12f73e23          	sd	a5,316(a4) # ba8 <freep>
 a74:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a76:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a7a:	b7e1                	j	a42 <malloc+0x36>
      if(p->s.size == nunits)
 a7c:	02e48b63          	beq	s1,a4,ab2 <malloc+0xa6>
        p->s.size -= nunits;
 a80:	4137073b          	subw	a4,a4,s3
 a84:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a86:	1702                	slli	a4,a4,0x20
 a88:	9301                	srli	a4,a4,0x20
 a8a:	0712                	slli	a4,a4,0x4
 a8c:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a8e:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a92:	00000717          	auipc	a4,0x0
 a96:	10a73b23          	sd	a0,278(a4) # ba8 <freep>
      return (void*)(p + 1);
 a9a:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a9e:	70e2                	ld	ra,56(sp)
 aa0:	7442                	ld	s0,48(sp)
 aa2:	74a2                	ld	s1,40(sp)
 aa4:	7902                	ld	s2,32(sp)
 aa6:	69e2                	ld	s3,24(sp)
 aa8:	6a42                	ld	s4,16(sp)
 aaa:	6aa2                	ld	s5,8(sp)
 aac:	6b02                	ld	s6,0(sp)
 aae:	6121                	addi	sp,sp,64
 ab0:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 ab2:	6398                	ld	a4,0(a5)
 ab4:	e118                	sd	a4,0(a0)
 ab6:	bff1                	j	a92 <malloc+0x86>
  hp->s.size = nu;
 ab8:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 abc:	0541                	addi	a0,a0,16
 abe:	00000097          	auipc	ra,0x0
 ac2:	ec6080e7          	jalr	-314(ra) # 984 <free>
  return freep;
 ac6:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 aca:	d971                	beqz	a0,a9e <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 acc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 ace:	4798                	lw	a4,8(a5)
 ad0:	fa9776e3          	bgeu	a4,s1,a7c <malloc+0x70>
    if(p == freep)
 ad4:	00093703          	ld	a4,0(s2)
 ad8:	853e                	mv	a0,a5
 ada:	fef719e3          	bne	a4,a5,acc <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 ade:	8552                	mv	a0,s4
 ae0:	00000097          	auipc	ra,0x0
 ae4:	b7e080e7          	jalr	-1154(ra) # 65e <sbrk>
  if(p == (char*)-1)
 ae8:	fd5518e3          	bne	a0,s5,ab8 <malloc+0xac>
        return 0;
 aec:	4501                	li	a0,0
 aee:	bf45                	j	a9e <malloc+0x92>
