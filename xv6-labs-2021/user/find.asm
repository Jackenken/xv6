
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
  14:	388080e7          	jalr	904(ra) # 398 <strlen>
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
  40:	35c080e7          	jalr	860(ra) # 398 <strlen>
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
  62:	33a080e7          	jalr	826(ra) # 398 <strlen>
  66:	00001997          	auipc	s3,0x1
  6a:	b1a98993          	addi	s3,s3,-1254 # b80 <buf.0>
  6e:	0005061b          	sext.w	a2,a0
  72:	85a6                	mv	a1,s1
  74:	854e                	mv	a0,s3
  76:	00000097          	auipc	ra,0x0
  7a:	496080e7          	jalr	1174(ra) # 50c <memmove>
    memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
  7e:	8526                	mv	a0,s1
  80:	00000097          	auipc	ra,0x0
  84:	318080e7          	jalr	792(ra) # 398 <strlen>
  88:	0005091b          	sext.w	s2,a0
  8c:	8526                	mv	a0,s1
  8e:	00000097          	auipc	ra,0x0
  92:	30a080e7          	jalr	778(ra) # 398 <strlen>
  96:	1902                	slli	s2,s2,0x20
  98:	02095913          	srli	s2,s2,0x20
  9c:	4639                	li	a2,14
  9e:	9e09                	subw	a2,a2,a0
  a0:	4581                	li	a1,0
  a2:	01298533          	add	a0,s3,s2
  a6:	00000097          	auipc	ra,0x0
  aa:	31c080e7          	jalr	796(ra) # 3c2 <memset>
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
  ea:	518080e7          	jalr	1304(ra) # 5fe <open>
  ee:	06054c63          	bltz	a0,166 <find+0xb4>
  f2:	84aa                	mv	s1,a0
        fprintf(2, "find: %s doesnot exist\n", path);
        return;
    }

    if(fstat(fd, &st) < 0){
  f4:	d8840593          	addi	a1,s0,-632
  f8:	00000097          	auipc	ra,0x0
  fc:	51e080e7          	jalr	1310(ra) # 616 <fstat>
 100:	06054e63          	bltz	a0,17c <find+0xca>
        close(fd);
        return;
    }
//    printf("name:%s\n",name);

    switch(st.type){
 104:	d9041783          	lh	a5,-624(s0)
 108:	0007869b          	sext.w	a3,a5
 10c:	4705                	li	a4,1
 10e:	0ae68163          	beq	a3,a4,1b0 <find+0xfe>
 112:	4709                	li	a4,2
 114:	00e69d63          	bne	a3,a4,12e <find+0x7c>
        case T_FILE:
            if(strcmp(fmtname(path),name)==0)
 118:	854a                	mv	a0,s2
 11a:	00000097          	auipc	ra,0x0
 11e:	ee6080e7          	jalr	-282(ra) # 0 <fmtname>
 122:	85ce                	mv	a1,s3
 124:	00000097          	auipc	ra,0x0
 128:	248080e7          	jalr	584(ra) # 36c <strcmp>
 12c:	c925                	beqz	a0,19c <find+0xea>
                    find(buf,name);
                }
            }
            break;
    }
    close(fd);
 12e:	8526                	mv	a0,s1
 130:	00000097          	auipc	ra,0x0
 134:	4b6080e7          	jalr	1206(ra) # 5e6 <close>
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
 16c:	97058593          	addi	a1,a1,-1680 # ad8 <malloc+0xe4>
 170:	4509                	li	a0,2
 172:	00000097          	auipc	ra,0x0
 176:	796080e7          	jalr	1942(ra) # 908 <fprintf>
        return;
 17a:	bf7d                	j	138 <find+0x86>
        fprintf(2, "find: cannot stat %s\n", path);
 17c:	864a                	mv	a2,s2
 17e:	00001597          	auipc	a1,0x1
 182:	97258593          	addi	a1,a1,-1678 # af0 <malloc+0xfc>
 186:	4509                	li	a0,2
 188:	00000097          	auipc	ra,0x0
 18c:	780080e7          	jalr	1920(ra) # 908 <fprintf>
        close(fd);
 190:	8526                	mv	a0,s1
 192:	00000097          	auipc	ra,0x0
 196:	454080e7          	jalr	1108(ra) # 5e6 <close>
        return;
 19a:	bf79                	j	138 <find+0x86>
                printf("%s\n", (path));
 19c:	85ca                	mv	a1,s2
 19e:	00001517          	auipc	a0,0x1
 1a2:	96a50513          	addi	a0,a0,-1686 # b08 <malloc+0x114>
 1a6:	00000097          	auipc	ra,0x0
 1aa:	790080e7          	jalr	1936(ra) # 936 <printf>
 1ae:	b741                	j	12e <find+0x7c>
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	854a                	mv	a0,s2
 1b2:	00000097          	auipc	ra,0x0
 1b6:	1e6080e7          	jalr	486(ra) # 398 <strlen>
 1ba:	2541                	addiw	a0,a0,16
 1bc:	20000793          	li	a5,512
 1c0:	00a7fb63          	bgeu	a5,a0,1d6 <find+0x124>
                printf("find: path too long\n");
 1c4:	00001517          	auipc	a0,0x1
 1c8:	94c50513          	addi	a0,a0,-1716 # b10 <malloc+0x11c>
 1cc:	00000097          	auipc	ra,0x0
 1d0:	76a080e7          	jalr	1898(ra) # 936 <printf>
                break;
 1d4:	bfa9                	j	12e <find+0x7c>
            strcpy(buf, path);
 1d6:	85ca                	mv	a1,s2
 1d8:	db040513          	addi	a0,s0,-592
 1dc:	00000097          	auipc	ra,0x0
 1e0:	174080e7          	jalr	372(ra) # 350 <strcpy>
            p = buf+strlen(buf);
 1e4:	db040513          	addi	a0,s0,-592
 1e8:	00000097          	auipc	ra,0x0
 1ec:	1b0080e7          	jalr	432(ra) # 398 <strlen>
 1f0:	02051913          	slli	s2,a0,0x20
 1f4:	02095913          	srli	s2,s2,0x20
 1f8:	db040793          	addi	a5,s0,-592
 1fc:	993e                	add	s2,s2,a5
            *p++ = '/';
 1fe:	00190a13          	addi	s4,s2,1
 202:	02f00793          	li	a5,47
 206:	00f90023          	sb	a5,0(s2)
                if( strcmp(fmtname(buf),".")!=0 && strcmp(fmtname(buf),"..")!=0 &&st.type==T_DIR){
 20a:	00001a97          	auipc	s5,0x1
 20e:	91ea8a93          	addi	s5,s5,-1762 # b28 <malloc+0x134>
 212:	00001b97          	auipc	s7,0x1
 216:	91eb8b93          	addi	s7,s7,-1762 # b30 <malloc+0x13c>
 21a:	4c05                	li	s8,1
                    printf("%s\n", (buf));
 21c:	00001b17          	auipc	s6,0x1
 220:	8ecb0b13          	addi	s6,s6,-1812 # b08 <malloc+0x114>
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
 224:	4641                	li	a2,16
 226:	da040593          	addi	a1,s0,-608
 22a:	8526                	mv	a0,s1
 22c:	00000097          	auipc	ra,0x0
 230:	3aa080e7          	jalr	938(ra) # 5d6 <read>
 234:	47c1                	li	a5,16
 236:	eef51ce3          	bne	a0,a5,12e <find+0x7c>
                if(de.inum == 0)
 23a:	da045783          	lhu	a5,-608(s0)
 23e:	d3fd                	beqz	a5,224 <find+0x172>
                memmove(p, de.name, DIRSIZ);
 240:	4639                	li	a2,14
 242:	da240593          	addi	a1,s0,-606
 246:	8552                	mv	a0,s4
 248:	00000097          	auipc	ra,0x0
 24c:	2c4080e7          	jalr	708(ra) # 50c <memmove>
                p[DIRSIZ] = 0;
 250:	000907a3          	sb	zero,15(s2)
                if(stat(buf, &st) < 0){
 254:	d8840593          	addi	a1,s0,-632
 258:	db040513          	addi	a0,s0,-592
 25c:	00000097          	auipc	ra,0x0
 260:	220080e7          	jalr	544(ra) # 47c <stat>
 264:	06054263          	bltz	a0,2c8 <find+0x216>
                if(strcmp(fmtname(buf),name)==0)
 268:	db040513          	addi	a0,s0,-592
 26c:	00000097          	auipc	ra,0x0
 270:	d94080e7          	jalr	-620(ra) # 0 <fmtname>
 274:	85ce                	mv	a1,s3
 276:	00000097          	auipc	ra,0x0
 27a:	0f6080e7          	jalr	246(ra) # 36c <strcmp>
 27e:	c125                	beqz	a0,2de <find+0x22c>
                if( strcmp(fmtname(buf),".")!=0 && strcmp(fmtname(buf),"..")!=0 &&st.type==T_DIR){
 280:	db040513          	addi	a0,s0,-592
 284:	00000097          	auipc	ra,0x0
 288:	d7c080e7          	jalr	-644(ra) # 0 <fmtname>
 28c:	85d6                	mv	a1,s5
 28e:	00000097          	auipc	ra,0x0
 292:	0de080e7          	jalr	222(ra) # 36c <strcmp>
 296:	d559                	beqz	a0,224 <find+0x172>
 298:	db040513          	addi	a0,s0,-592
 29c:	00000097          	auipc	ra,0x0
 2a0:	d64080e7          	jalr	-668(ra) # 0 <fmtname>
 2a4:	85de                	mv	a1,s7
 2a6:	00000097          	auipc	ra,0x0
 2aa:	0c6080e7          	jalr	198(ra) # 36c <strcmp>
 2ae:	d93d                	beqz	a0,224 <find+0x172>
 2b0:	d9041783          	lh	a5,-624(s0)
 2b4:	f78798e3          	bne	a5,s8,224 <find+0x172>
                    find(buf,name);
 2b8:	85ce                	mv	a1,s3
 2ba:	db040513          	addi	a0,s0,-592
 2be:	00000097          	auipc	ra,0x0
 2c2:	df4080e7          	jalr	-524(ra) # b2 <find>
 2c6:	bfb9                	j	224 <find+0x172>
                    printf("find: cannot stat %s\n", buf);
 2c8:	db040593          	addi	a1,s0,-592
 2cc:	00001517          	auipc	a0,0x1
 2d0:	82450513          	addi	a0,a0,-2012 # af0 <malloc+0xfc>
 2d4:	00000097          	auipc	ra,0x0
 2d8:	662080e7          	jalr	1634(ra) # 936 <printf>
                    continue;
 2dc:	b7a1                	j	224 <find+0x172>
                    printf("%s\n", (buf));
 2de:	db040593          	addi	a1,s0,-592
 2e2:	855a                	mv	a0,s6
 2e4:	00000097          	auipc	ra,0x0
 2e8:	652080e7          	jalr	1618(ra) # 936 <printf>
 2ec:	bf51                	j	280 <find+0x1ce>

00000000000002ee <main>:

int
main(int argc, char *argv[])
{
 2ee:	1141                	addi	sp,sp,-16
 2f0:	e406                	sd	ra,8(sp)
 2f2:	e022                	sd	s0,0(sp)
 2f4:	0800                	addi	s0,sp,16
    if(argc < 2){
 2f6:	4705                	li	a4,1
 2f8:	02a75463          	bge	a4,a0,320 <main+0x32>
 2fc:	87ae                	mv	a5,a1
        printf("usage:find <path> <name>");
        exit(0);
    }
    if(argc < 3){
 2fe:	4709                	li	a4,2
 300:	02a74d63          	blt	a4,a0,33a <main+0x4c>
        find(".",argv[1]);
 304:	658c                	ld	a1,8(a1)
 306:	00001517          	auipc	a0,0x1
 30a:	82250513          	addi	a0,a0,-2014 # b28 <malloc+0x134>
 30e:	00000097          	auipc	ra,0x0
 312:	da4080e7          	jalr	-604(ra) # b2 <find>
        exit(0);
 316:	4501                	li	a0,0
 318:	00000097          	auipc	ra,0x0
 31c:	2a6080e7          	jalr	678(ra) # 5be <exit>
        printf("usage:find <path> <name>");
 320:	00001517          	auipc	a0,0x1
 324:	81850513          	addi	a0,a0,-2024 # b38 <malloc+0x144>
 328:	00000097          	auipc	ra,0x0
 32c:	60e080e7          	jalr	1550(ra) # 936 <printf>
        exit(0);
 330:	4501                	li	a0,0
 332:	00000097          	auipc	ra,0x0
 336:	28c080e7          	jalr	652(ra) # 5be <exit>
    }
    find(argv[1],argv[2]);
 33a:	698c                	ld	a1,16(a1)
 33c:	6788                	ld	a0,8(a5)
 33e:	00000097          	auipc	ra,0x0
 342:	d74080e7          	jalr	-652(ra) # b2 <find>
    exit(0);
 346:	4501                	li	a0,0
 348:	00000097          	auipc	ra,0x0
 34c:	276080e7          	jalr	630(ra) # 5be <exit>

0000000000000350 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 350:	1141                	addi	sp,sp,-16
 352:	e422                	sd	s0,8(sp)
 354:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 356:	87aa                	mv	a5,a0
 358:	0585                	addi	a1,a1,1
 35a:	0785                	addi	a5,a5,1
 35c:	fff5c703          	lbu	a4,-1(a1)
 360:	fee78fa3          	sb	a4,-1(a5)
 364:	fb75                	bnez	a4,358 <strcpy+0x8>
    ;
  return os;
}
 366:	6422                	ld	s0,8(sp)
 368:	0141                	addi	sp,sp,16
 36a:	8082                	ret

000000000000036c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 36c:	1141                	addi	sp,sp,-16
 36e:	e422                	sd	s0,8(sp)
 370:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 372:	00054783          	lbu	a5,0(a0)
 376:	cb91                	beqz	a5,38a <strcmp+0x1e>
 378:	0005c703          	lbu	a4,0(a1)
 37c:	00f71763          	bne	a4,a5,38a <strcmp+0x1e>
    p++, q++;
 380:	0505                	addi	a0,a0,1
 382:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 384:	00054783          	lbu	a5,0(a0)
 388:	fbe5                	bnez	a5,378 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 38a:	0005c503          	lbu	a0,0(a1)
}
 38e:	40a7853b          	subw	a0,a5,a0
 392:	6422                	ld	s0,8(sp)
 394:	0141                	addi	sp,sp,16
 396:	8082                	ret

0000000000000398 <strlen>:

uint
strlen(const char *s)
{
 398:	1141                	addi	sp,sp,-16
 39a:	e422                	sd	s0,8(sp)
 39c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 39e:	00054783          	lbu	a5,0(a0)
 3a2:	cf91                	beqz	a5,3be <strlen+0x26>
 3a4:	0505                	addi	a0,a0,1
 3a6:	87aa                	mv	a5,a0
 3a8:	4685                	li	a3,1
 3aa:	9e89                	subw	a3,a3,a0
 3ac:	00f6853b          	addw	a0,a3,a5
 3b0:	0785                	addi	a5,a5,1
 3b2:	fff7c703          	lbu	a4,-1(a5)
 3b6:	fb7d                	bnez	a4,3ac <strlen+0x14>
    ;
  return n;
}
 3b8:	6422                	ld	s0,8(sp)
 3ba:	0141                	addi	sp,sp,16
 3bc:	8082                	ret
  for(n = 0; s[n]; n++)
 3be:	4501                	li	a0,0
 3c0:	bfe5                	j	3b8 <strlen+0x20>

00000000000003c2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c2:	1141                	addi	sp,sp,-16
 3c4:	e422                	sd	s0,8(sp)
 3c6:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 3c8:	ca19                	beqz	a2,3de <memset+0x1c>
 3ca:	87aa                	mv	a5,a0
 3cc:	1602                	slli	a2,a2,0x20
 3ce:	9201                	srli	a2,a2,0x20
 3d0:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 3d4:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 3d8:	0785                	addi	a5,a5,1
 3da:	fee79de3          	bne	a5,a4,3d4 <memset+0x12>
  }
  return dst;
}
 3de:	6422                	ld	s0,8(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret

00000000000003e4 <strchr>:

char*
strchr(const char *s, char c)
{
 3e4:	1141                	addi	sp,sp,-16
 3e6:	e422                	sd	s0,8(sp)
 3e8:	0800                	addi	s0,sp,16
  for(; *s; s++)
 3ea:	00054783          	lbu	a5,0(a0)
 3ee:	cb99                	beqz	a5,404 <strchr+0x20>
    if(*s == c)
 3f0:	00f58763          	beq	a1,a5,3fe <strchr+0x1a>
  for(; *s; s++)
 3f4:	0505                	addi	a0,a0,1
 3f6:	00054783          	lbu	a5,0(a0)
 3fa:	fbfd                	bnez	a5,3f0 <strchr+0xc>
      return (char*)s;
  return 0;
 3fc:	4501                	li	a0,0
}
 3fe:	6422                	ld	s0,8(sp)
 400:	0141                	addi	sp,sp,16
 402:	8082                	ret
  return 0;
 404:	4501                	li	a0,0
 406:	bfe5                	j	3fe <strchr+0x1a>

0000000000000408 <gets>:

char*
gets(char *buf, int max)
{
 408:	711d                	addi	sp,sp,-96
 40a:	ec86                	sd	ra,88(sp)
 40c:	e8a2                	sd	s0,80(sp)
 40e:	e4a6                	sd	s1,72(sp)
 410:	e0ca                	sd	s2,64(sp)
 412:	fc4e                	sd	s3,56(sp)
 414:	f852                	sd	s4,48(sp)
 416:	f456                	sd	s5,40(sp)
 418:	f05a                	sd	s6,32(sp)
 41a:	ec5e                	sd	s7,24(sp)
 41c:	1080                	addi	s0,sp,96
 41e:	8baa                	mv	s7,a0
 420:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 422:	892a                	mv	s2,a0
 424:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 426:	4aa9                	li	s5,10
 428:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 42a:	89a6                	mv	s3,s1
 42c:	2485                	addiw	s1,s1,1
 42e:	0344d863          	bge	s1,s4,45e <gets+0x56>
    cc = read(0, &c, 1);
 432:	4605                	li	a2,1
 434:	faf40593          	addi	a1,s0,-81
 438:	4501                	li	a0,0
 43a:	00000097          	auipc	ra,0x0
 43e:	19c080e7          	jalr	412(ra) # 5d6 <read>
    if(cc < 1)
 442:	00a05e63          	blez	a0,45e <gets+0x56>
    buf[i++] = c;
 446:	faf44783          	lbu	a5,-81(s0)
 44a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 44e:	01578763          	beq	a5,s5,45c <gets+0x54>
 452:	0905                	addi	s2,s2,1
 454:	fd679be3          	bne	a5,s6,42a <gets+0x22>
  for(i=0; i+1 < max; ){
 458:	89a6                	mv	s3,s1
 45a:	a011                	j	45e <gets+0x56>
 45c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 45e:	99de                	add	s3,s3,s7
 460:	00098023          	sb	zero,0(s3)
  return buf;
}
 464:	855e                	mv	a0,s7
 466:	60e6                	ld	ra,88(sp)
 468:	6446                	ld	s0,80(sp)
 46a:	64a6                	ld	s1,72(sp)
 46c:	6906                	ld	s2,64(sp)
 46e:	79e2                	ld	s3,56(sp)
 470:	7a42                	ld	s4,48(sp)
 472:	7aa2                	ld	s5,40(sp)
 474:	7b02                	ld	s6,32(sp)
 476:	6be2                	ld	s7,24(sp)
 478:	6125                	addi	sp,sp,96
 47a:	8082                	ret

000000000000047c <stat>:

int
stat(const char *n, struct stat *st)
{
 47c:	1101                	addi	sp,sp,-32
 47e:	ec06                	sd	ra,24(sp)
 480:	e822                	sd	s0,16(sp)
 482:	e426                	sd	s1,8(sp)
 484:	e04a                	sd	s2,0(sp)
 486:	1000                	addi	s0,sp,32
 488:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 48a:	4581                	li	a1,0
 48c:	00000097          	auipc	ra,0x0
 490:	172080e7          	jalr	370(ra) # 5fe <open>
  if(fd < 0)
 494:	02054563          	bltz	a0,4be <stat+0x42>
 498:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 49a:	85ca                	mv	a1,s2
 49c:	00000097          	auipc	ra,0x0
 4a0:	17a080e7          	jalr	378(ra) # 616 <fstat>
 4a4:	892a                	mv	s2,a0
  close(fd);
 4a6:	8526                	mv	a0,s1
 4a8:	00000097          	auipc	ra,0x0
 4ac:	13e080e7          	jalr	318(ra) # 5e6 <close>
  return r;
}
 4b0:	854a                	mv	a0,s2
 4b2:	60e2                	ld	ra,24(sp)
 4b4:	6442                	ld	s0,16(sp)
 4b6:	64a2                	ld	s1,8(sp)
 4b8:	6902                	ld	s2,0(sp)
 4ba:	6105                	addi	sp,sp,32
 4bc:	8082                	ret
    return -1;
 4be:	597d                	li	s2,-1
 4c0:	bfc5                	j	4b0 <stat+0x34>

00000000000004c2 <atoi>:

int
atoi(const char *s)
{
 4c2:	1141                	addi	sp,sp,-16
 4c4:	e422                	sd	s0,8(sp)
 4c6:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4c8:	00054603          	lbu	a2,0(a0)
 4cc:	fd06079b          	addiw	a5,a2,-48
 4d0:	0ff7f793          	andi	a5,a5,255
 4d4:	4725                	li	a4,9
 4d6:	02f76963          	bltu	a4,a5,508 <atoi+0x46>
 4da:	86aa                	mv	a3,a0
  n = 0;
 4dc:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 4de:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 4e0:	0685                	addi	a3,a3,1
 4e2:	0025179b          	slliw	a5,a0,0x2
 4e6:	9fa9                	addw	a5,a5,a0
 4e8:	0017979b          	slliw	a5,a5,0x1
 4ec:	9fb1                	addw	a5,a5,a2
 4ee:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 4f2:	0006c603          	lbu	a2,0(a3)
 4f6:	fd06071b          	addiw	a4,a2,-48
 4fa:	0ff77713          	andi	a4,a4,255
 4fe:	fee5f1e3          	bgeu	a1,a4,4e0 <atoi+0x1e>
  return n;
}
 502:	6422                	ld	s0,8(sp)
 504:	0141                	addi	sp,sp,16
 506:	8082                	ret
  n = 0;
 508:	4501                	li	a0,0
 50a:	bfe5                	j	502 <atoi+0x40>

000000000000050c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 50c:	1141                	addi	sp,sp,-16
 50e:	e422                	sd	s0,8(sp)
 510:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 512:	02b57463          	bgeu	a0,a1,53a <memmove+0x2e>
    while(n-- > 0)
 516:	00c05f63          	blez	a2,534 <memmove+0x28>
 51a:	1602                	slli	a2,a2,0x20
 51c:	9201                	srli	a2,a2,0x20
 51e:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 522:	872a                	mv	a4,a0
      *dst++ = *src++;
 524:	0585                	addi	a1,a1,1
 526:	0705                	addi	a4,a4,1
 528:	fff5c683          	lbu	a3,-1(a1)
 52c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 530:	fee79ae3          	bne	a5,a4,524 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 534:	6422                	ld	s0,8(sp)
 536:	0141                	addi	sp,sp,16
 538:	8082                	ret
    dst += n;
 53a:	00c50733          	add	a4,a0,a2
    src += n;
 53e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 540:	fec05ae3          	blez	a2,534 <memmove+0x28>
 544:	fff6079b          	addiw	a5,a2,-1
 548:	1782                	slli	a5,a5,0x20
 54a:	9381                	srli	a5,a5,0x20
 54c:	fff7c793          	not	a5,a5
 550:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 552:	15fd                	addi	a1,a1,-1
 554:	177d                	addi	a4,a4,-1
 556:	0005c683          	lbu	a3,0(a1)
 55a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 55e:	fee79ae3          	bne	a5,a4,552 <memmove+0x46>
 562:	bfc9                	j	534 <memmove+0x28>

0000000000000564 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 564:	1141                	addi	sp,sp,-16
 566:	e422                	sd	s0,8(sp)
 568:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 56a:	ca05                	beqz	a2,59a <memcmp+0x36>
 56c:	fff6069b          	addiw	a3,a2,-1
 570:	1682                	slli	a3,a3,0x20
 572:	9281                	srli	a3,a3,0x20
 574:	0685                	addi	a3,a3,1
 576:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 578:	00054783          	lbu	a5,0(a0)
 57c:	0005c703          	lbu	a4,0(a1)
 580:	00e79863          	bne	a5,a4,590 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 584:	0505                	addi	a0,a0,1
    p2++;
 586:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 588:	fed518e3          	bne	a0,a3,578 <memcmp+0x14>
  }
  return 0;
 58c:	4501                	li	a0,0
 58e:	a019                	j	594 <memcmp+0x30>
      return *p1 - *p2;
 590:	40e7853b          	subw	a0,a5,a4
}
 594:	6422                	ld	s0,8(sp)
 596:	0141                	addi	sp,sp,16
 598:	8082                	ret
  return 0;
 59a:	4501                	li	a0,0
 59c:	bfe5                	j	594 <memcmp+0x30>

000000000000059e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 59e:	1141                	addi	sp,sp,-16
 5a0:	e406                	sd	ra,8(sp)
 5a2:	e022                	sd	s0,0(sp)
 5a4:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 5a6:	00000097          	auipc	ra,0x0
 5aa:	f66080e7          	jalr	-154(ra) # 50c <memmove>
}
 5ae:	60a2                	ld	ra,8(sp)
 5b0:	6402                	ld	s0,0(sp)
 5b2:	0141                	addi	sp,sp,16
 5b4:	8082                	ret

00000000000005b6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 5b6:	4885                	li	a7,1
 ecall
 5b8:	00000073          	ecall
 ret
 5bc:	8082                	ret

00000000000005be <exit>:
.global exit
exit:
 li a7, SYS_exit
 5be:	4889                	li	a7,2
 ecall
 5c0:	00000073          	ecall
 ret
 5c4:	8082                	ret

00000000000005c6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 5c6:	488d                	li	a7,3
 ecall
 5c8:	00000073          	ecall
 ret
 5cc:	8082                	ret

00000000000005ce <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 5ce:	4891                	li	a7,4
 ecall
 5d0:	00000073          	ecall
 ret
 5d4:	8082                	ret

00000000000005d6 <read>:
.global read
read:
 li a7, SYS_read
 5d6:	4895                	li	a7,5
 ecall
 5d8:	00000073          	ecall
 ret
 5dc:	8082                	ret

00000000000005de <write>:
.global write
write:
 li a7, SYS_write
 5de:	48c1                	li	a7,16
 ecall
 5e0:	00000073          	ecall
 ret
 5e4:	8082                	ret

00000000000005e6 <close>:
.global close
close:
 li a7, SYS_close
 5e6:	48d5                	li	a7,21
 ecall
 5e8:	00000073          	ecall
 ret
 5ec:	8082                	ret

00000000000005ee <kill>:
.global kill
kill:
 li a7, SYS_kill
 5ee:	4899                	li	a7,6
 ecall
 5f0:	00000073          	ecall
 ret
 5f4:	8082                	ret

00000000000005f6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 5f6:	489d                	li	a7,7
 ecall
 5f8:	00000073          	ecall
 ret
 5fc:	8082                	ret

00000000000005fe <open>:
.global open
open:
 li a7, SYS_open
 5fe:	48bd                	li	a7,15
 ecall
 600:	00000073          	ecall
 ret
 604:	8082                	ret

0000000000000606 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 606:	48c5                	li	a7,17
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 60e:	48c9                	li	a7,18
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 616:	48a1                	li	a7,8
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <link>:
.global link
link:
 li a7, SYS_link
 61e:	48cd                	li	a7,19
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 626:	48d1                	li	a7,20
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 62e:	48a5                	li	a7,9
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <dup>:
.global dup
dup:
 li a7, SYS_dup
 636:	48a9                	li	a7,10
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 63e:	48ad                	li	a7,11
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 646:	48b1                	li	a7,12
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 64e:	48b5                	li	a7,13
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 656:	48b9                	li	a7,14
 ecall
 658:	00000073          	ecall
 ret
 65c:	8082                	ret

000000000000065e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 65e:	1101                	addi	sp,sp,-32
 660:	ec06                	sd	ra,24(sp)
 662:	e822                	sd	s0,16(sp)
 664:	1000                	addi	s0,sp,32
 666:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 66a:	4605                	li	a2,1
 66c:	fef40593          	addi	a1,s0,-17
 670:	00000097          	auipc	ra,0x0
 674:	f6e080e7          	jalr	-146(ra) # 5de <write>
}
 678:	60e2                	ld	ra,24(sp)
 67a:	6442                	ld	s0,16(sp)
 67c:	6105                	addi	sp,sp,32
 67e:	8082                	ret

0000000000000680 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 680:	7139                	addi	sp,sp,-64
 682:	fc06                	sd	ra,56(sp)
 684:	f822                	sd	s0,48(sp)
 686:	f426                	sd	s1,40(sp)
 688:	f04a                	sd	s2,32(sp)
 68a:	ec4e                	sd	s3,24(sp)
 68c:	0080                	addi	s0,sp,64
 68e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 690:	c299                	beqz	a3,696 <printint+0x16>
 692:	0805c863          	bltz	a1,722 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 696:	2581                	sext.w	a1,a1
  neg = 0;
 698:	4881                	li	a7,0
 69a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 69e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 6a0:	2601                	sext.w	a2,a2
 6a2:	00000517          	auipc	a0,0x0
 6a6:	4be50513          	addi	a0,a0,1214 # b60 <digits>
 6aa:	883a                	mv	a6,a4
 6ac:	2705                	addiw	a4,a4,1
 6ae:	02c5f7bb          	remuw	a5,a1,a2
 6b2:	1782                	slli	a5,a5,0x20
 6b4:	9381                	srli	a5,a5,0x20
 6b6:	97aa                	add	a5,a5,a0
 6b8:	0007c783          	lbu	a5,0(a5)
 6bc:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 6c0:	0005879b          	sext.w	a5,a1
 6c4:	02c5d5bb          	divuw	a1,a1,a2
 6c8:	0685                	addi	a3,a3,1
 6ca:	fec7f0e3          	bgeu	a5,a2,6aa <printint+0x2a>
  if(neg)
 6ce:	00088b63          	beqz	a7,6e4 <printint+0x64>
    buf[i++] = '-';
 6d2:	fd040793          	addi	a5,s0,-48
 6d6:	973e                	add	a4,a4,a5
 6d8:	02d00793          	li	a5,45
 6dc:	fef70823          	sb	a5,-16(a4)
 6e0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 6e4:	02e05863          	blez	a4,714 <printint+0x94>
 6e8:	fc040793          	addi	a5,s0,-64
 6ec:	00e78933          	add	s2,a5,a4
 6f0:	fff78993          	addi	s3,a5,-1
 6f4:	99ba                	add	s3,s3,a4
 6f6:	377d                	addiw	a4,a4,-1
 6f8:	1702                	slli	a4,a4,0x20
 6fa:	9301                	srli	a4,a4,0x20
 6fc:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 700:	fff94583          	lbu	a1,-1(s2)
 704:	8526                	mv	a0,s1
 706:	00000097          	auipc	ra,0x0
 70a:	f58080e7          	jalr	-168(ra) # 65e <putc>
  while(--i >= 0)
 70e:	197d                	addi	s2,s2,-1
 710:	ff3918e3          	bne	s2,s3,700 <printint+0x80>
}
 714:	70e2                	ld	ra,56(sp)
 716:	7442                	ld	s0,48(sp)
 718:	74a2                	ld	s1,40(sp)
 71a:	7902                	ld	s2,32(sp)
 71c:	69e2                	ld	s3,24(sp)
 71e:	6121                	addi	sp,sp,64
 720:	8082                	ret
    x = -xx;
 722:	40b005bb          	negw	a1,a1
    neg = 1;
 726:	4885                	li	a7,1
    x = -xx;
 728:	bf8d                	j	69a <printint+0x1a>

000000000000072a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 72a:	7119                	addi	sp,sp,-128
 72c:	fc86                	sd	ra,120(sp)
 72e:	f8a2                	sd	s0,112(sp)
 730:	f4a6                	sd	s1,104(sp)
 732:	f0ca                	sd	s2,96(sp)
 734:	ecce                	sd	s3,88(sp)
 736:	e8d2                	sd	s4,80(sp)
 738:	e4d6                	sd	s5,72(sp)
 73a:	e0da                	sd	s6,64(sp)
 73c:	fc5e                	sd	s7,56(sp)
 73e:	f862                	sd	s8,48(sp)
 740:	f466                	sd	s9,40(sp)
 742:	f06a                	sd	s10,32(sp)
 744:	ec6e                	sd	s11,24(sp)
 746:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 748:	0005c903          	lbu	s2,0(a1)
 74c:	18090f63          	beqz	s2,8ea <vprintf+0x1c0>
 750:	8aaa                	mv	s5,a0
 752:	8b32                	mv	s6,a2
 754:	00158493          	addi	s1,a1,1
  state = 0;
 758:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 75a:	02500a13          	li	s4,37
      if(c == 'd'){
 75e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 762:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 766:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 76a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 76e:	00000b97          	auipc	s7,0x0
 772:	3f2b8b93          	addi	s7,s7,1010 # b60 <digits>
 776:	a839                	j	794 <vprintf+0x6a>
        putc(fd, c);
 778:	85ca                	mv	a1,s2
 77a:	8556                	mv	a0,s5
 77c:	00000097          	auipc	ra,0x0
 780:	ee2080e7          	jalr	-286(ra) # 65e <putc>
 784:	a019                	j	78a <vprintf+0x60>
    } else if(state == '%'){
 786:	01498f63          	beq	s3,s4,7a4 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 78a:	0485                	addi	s1,s1,1
 78c:	fff4c903          	lbu	s2,-1(s1)
 790:	14090d63          	beqz	s2,8ea <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 794:	0009079b          	sext.w	a5,s2
    if(state == 0){
 798:	fe0997e3          	bnez	s3,786 <vprintf+0x5c>
      if(c == '%'){
 79c:	fd479ee3          	bne	a5,s4,778 <vprintf+0x4e>
        state = '%';
 7a0:	89be                	mv	s3,a5
 7a2:	b7e5                	j	78a <vprintf+0x60>
      if(c == 'd'){
 7a4:	05878063          	beq	a5,s8,7e4 <vprintf+0xba>
      } else if(c == 'l') {
 7a8:	05978c63          	beq	a5,s9,800 <vprintf+0xd6>
      } else if(c == 'x') {
 7ac:	07a78863          	beq	a5,s10,81c <vprintf+0xf2>
      } else if(c == 'p') {
 7b0:	09b78463          	beq	a5,s11,838 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 7b4:	07300713          	li	a4,115
 7b8:	0ce78663          	beq	a5,a4,884 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7bc:	06300713          	li	a4,99
 7c0:	0ee78e63          	beq	a5,a4,8bc <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 7c4:	11478863          	beq	a5,s4,8d4 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7c8:	85d2                	mv	a1,s4
 7ca:	8556                	mv	a0,s5
 7cc:	00000097          	auipc	ra,0x0
 7d0:	e92080e7          	jalr	-366(ra) # 65e <putc>
        putc(fd, c);
 7d4:	85ca                	mv	a1,s2
 7d6:	8556                	mv	a0,s5
 7d8:	00000097          	auipc	ra,0x0
 7dc:	e86080e7          	jalr	-378(ra) # 65e <putc>
      }
      state = 0;
 7e0:	4981                	li	s3,0
 7e2:	b765                	j	78a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 7e4:	008b0913          	addi	s2,s6,8
 7e8:	4685                	li	a3,1
 7ea:	4629                	li	a2,10
 7ec:	000b2583          	lw	a1,0(s6)
 7f0:	8556                	mv	a0,s5
 7f2:	00000097          	auipc	ra,0x0
 7f6:	e8e080e7          	jalr	-370(ra) # 680 <printint>
 7fa:	8b4a                	mv	s6,s2
      state = 0;
 7fc:	4981                	li	s3,0
 7fe:	b771                	j	78a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 800:	008b0913          	addi	s2,s6,8
 804:	4681                	li	a3,0
 806:	4629                	li	a2,10
 808:	000b2583          	lw	a1,0(s6)
 80c:	8556                	mv	a0,s5
 80e:	00000097          	auipc	ra,0x0
 812:	e72080e7          	jalr	-398(ra) # 680 <printint>
 816:	8b4a                	mv	s6,s2
      state = 0;
 818:	4981                	li	s3,0
 81a:	bf85                	j	78a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 81c:	008b0913          	addi	s2,s6,8
 820:	4681                	li	a3,0
 822:	4641                	li	a2,16
 824:	000b2583          	lw	a1,0(s6)
 828:	8556                	mv	a0,s5
 82a:	00000097          	auipc	ra,0x0
 82e:	e56080e7          	jalr	-426(ra) # 680 <printint>
 832:	8b4a                	mv	s6,s2
      state = 0;
 834:	4981                	li	s3,0
 836:	bf91                	j	78a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 838:	008b0793          	addi	a5,s6,8
 83c:	f8f43423          	sd	a5,-120(s0)
 840:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 844:	03000593          	li	a1,48
 848:	8556                	mv	a0,s5
 84a:	00000097          	auipc	ra,0x0
 84e:	e14080e7          	jalr	-492(ra) # 65e <putc>
  putc(fd, 'x');
 852:	85ea                	mv	a1,s10
 854:	8556                	mv	a0,s5
 856:	00000097          	auipc	ra,0x0
 85a:	e08080e7          	jalr	-504(ra) # 65e <putc>
 85e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 860:	03c9d793          	srli	a5,s3,0x3c
 864:	97de                	add	a5,a5,s7
 866:	0007c583          	lbu	a1,0(a5)
 86a:	8556                	mv	a0,s5
 86c:	00000097          	auipc	ra,0x0
 870:	df2080e7          	jalr	-526(ra) # 65e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 874:	0992                	slli	s3,s3,0x4
 876:	397d                	addiw	s2,s2,-1
 878:	fe0914e3          	bnez	s2,860 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 87c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 880:	4981                	li	s3,0
 882:	b721                	j	78a <vprintf+0x60>
        s = va_arg(ap, char*);
 884:	008b0993          	addi	s3,s6,8
 888:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 88c:	02090163          	beqz	s2,8ae <vprintf+0x184>
        while(*s != 0){
 890:	00094583          	lbu	a1,0(s2)
 894:	c9a1                	beqz	a1,8e4 <vprintf+0x1ba>
          putc(fd, *s);
 896:	8556                	mv	a0,s5
 898:	00000097          	auipc	ra,0x0
 89c:	dc6080e7          	jalr	-570(ra) # 65e <putc>
          s++;
 8a0:	0905                	addi	s2,s2,1
        while(*s != 0){
 8a2:	00094583          	lbu	a1,0(s2)
 8a6:	f9e5                	bnez	a1,896 <vprintf+0x16c>
        s = va_arg(ap, char*);
 8a8:	8b4e                	mv	s6,s3
      state = 0;
 8aa:	4981                	li	s3,0
 8ac:	bdf9                	j	78a <vprintf+0x60>
          s = "(null)";
 8ae:	00000917          	auipc	s2,0x0
 8b2:	2aa90913          	addi	s2,s2,682 # b58 <malloc+0x164>
        while(*s != 0){
 8b6:	02800593          	li	a1,40
 8ba:	bff1                	j	896 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 8bc:	008b0913          	addi	s2,s6,8
 8c0:	000b4583          	lbu	a1,0(s6)
 8c4:	8556                	mv	a0,s5
 8c6:	00000097          	auipc	ra,0x0
 8ca:	d98080e7          	jalr	-616(ra) # 65e <putc>
 8ce:	8b4a                	mv	s6,s2
      state = 0;
 8d0:	4981                	li	s3,0
 8d2:	bd65                	j	78a <vprintf+0x60>
        putc(fd, c);
 8d4:	85d2                	mv	a1,s4
 8d6:	8556                	mv	a0,s5
 8d8:	00000097          	auipc	ra,0x0
 8dc:	d86080e7          	jalr	-634(ra) # 65e <putc>
      state = 0;
 8e0:	4981                	li	s3,0
 8e2:	b565                	j	78a <vprintf+0x60>
        s = va_arg(ap, char*);
 8e4:	8b4e                	mv	s6,s3
      state = 0;
 8e6:	4981                	li	s3,0
 8e8:	b54d                	j	78a <vprintf+0x60>
    }
  }
}
 8ea:	70e6                	ld	ra,120(sp)
 8ec:	7446                	ld	s0,112(sp)
 8ee:	74a6                	ld	s1,104(sp)
 8f0:	7906                	ld	s2,96(sp)
 8f2:	69e6                	ld	s3,88(sp)
 8f4:	6a46                	ld	s4,80(sp)
 8f6:	6aa6                	ld	s5,72(sp)
 8f8:	6b06                	ld	s6,64(sp)
 8fa:	7be2                	ld	s7,56(sp)
 8fc:	7c42                	ld	s8,48(sp)
 8fe:	7ca2                	ld	s9,40(sp)
 900:	7d02                	ld	s10,32(sp)
 902:	6de2                	ld	s11,24(sp)
 904:	6109                	addi	sp,sp,128
 906:	8082                	ret

0000000000000908 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 908:	715d                	addi	sp,sp,-80
 90a:	ec06                	sd	ra,24(sp)
 90c:	e822                	sd	s0,16(sp)
 90e:	1000                	addi	s0,sp,32
 910:	e010                	sd	a2,0(s0)
 912:	e414                	sd	a3,8(s0)
 914:	e818                	sd	a4,16(s0)
 916:	ec1c                	sd	a5,24(s0)
 918:	03043023          	sd	a6,32(s0)
 91c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 920:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 924:	8622                	mv	a2,s0
 926:	00000097          	auipc	ra,0x0
 92a:	e04080e7          	jalr	-508(ra) # 72a <vprintf>
}
 92e:	60e2                	ld	ra,24(sp)
 930:	6442                	ld	s0,16(sp)
 932:	6161                	addi	sp,sp,80
 934:	8082                	ret

0000000000000936 <printf>:

void
printf(const char *fmt, ...)
{
 936:	711d                	addi	sp,sp,-96
 938:	ec06                	sd	ra,24(sp)
 93a:	e822                	sd	s0,16(sp)
 93c:	1000                	addi	s0,sp,32
 93e:	e40c                	sd	a1,8(s0)
 940:	e810                	sd	a2,16(s0)
 942:	ec14                	sd	a3,24(s0)
 944:	f018                	sd	a4,32(s0)
 946:	f41c                	sd	a5,40(s0)
 948:	03043823          	sd	a6,48(s0)
 94c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 950:	00840613          	addi	a2,s0,8
 954:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 958:	85aa                	mv	a1,a0
 95a:	4505                	li	a0,1
 95c:	00000097          	auipc	ra,0x0
 960:	dce080e7          	jalr	-562(ra) # 72a <vprintf>
}
 964:	60e2                	ld	ra,24(sp)
 966:	6442                	ld	s0,16(sp)
 968:	6125                	addi	sp,sp,96
 96a:	8082                	ret

000000000000096c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 96c:	1141                	addi	sp,sp,-16
 96e:	e422                	sd	s0,8(sp)
 970:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 972:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 976:	00000797          	auipc	a5,0x0
 97a:	2027b783          	ld	a5,514(a5) # b78 <freep>
 97e:	a805                	j	9ae <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 980:	4618                	lw	a4,8(a2)
 982:	9db9                	addw	a1,a1,a4
 984:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 988:	6398                	ld	a4,0(a5)
 98a:	6318                	ld	a4,0(a4)
 98c:	fee53823          	sd	a4,-16(a0)
 990:	a091                	j	9d4 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 992:	ff852703          	lw	a4,-8(a0)
 996:	9e39                	addw	a2,a2,a4
 998:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 99a:	ff053703          	ld	a4,-16(a0)
 99e:	e398                	sd	a4,0(a5)
 9a0:	a099                	j	9e6 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a2:	6398                	ld	a4,0(a5)
 9a4:	00e7e463          	bltu	a5,a4,9ac <free+0x40>
 9a8:	00e6ea63          	bltu	a3,a4,9bc <free+0x50>
{
 9ac:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ae:	fed7fae3          	bgeu	a5,a3,9a2 <free+0x36>
 9b2:	6398                	ld	a4,0(a5)
 9b4:	00e6e463          	bltu	a3,a4,9bc <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b8:	fee7eae3          	bltu	a5,a4,9ac <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 9bc:	ff852583          	lw	a1,-8(a0)
 9c0:	6390                	ld	a2,0(a5)
 9c2:	02059713          	slli	a4,a1,0x20
 9c6:	9301                	srli	a4,a4,0x20
 9c8:	0712                	slli	a4,a4,0x4
 9ca:	9736                	add	a4,a4,a3
 9cc:	fae60ae3          	beq	a2,a4,980 <free+0x14>
    bp->s.ptr = p->s.ptr;
 9d0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 9d4:	4790                	lw	a2,8(a5)
 9d6:	02061713          	slli	a4,a2,0x20
 9da:	9301                	srli	a4,a4,0x20
 9dc:	0712                	slli	a4,a4,0x4
 9de:	973e                	add	a4,a4,a5
 9e0:	fae689e3          	beq	a3,a4,992 <free+0x26>
  } else
    p->s.ptr = bp;
 9e4:	e394                	sd	a3,0(a5)
  freep = p;
 9e6:	00000717          	auipc	a4,0x0
 9ea:	18f73923          	sd	a5,402(a4) # b78 <freep>
}
 9ee:	6422                	ld	s0,8(sp)
 9f0:	0141                	addi	sp,sp,16
 9f2:	8082                	ret

00000000000009f4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9f4:	7139                	addi	sp,sp,-64
 9f6:	fc06                	sd	ra,56(sp)
 9f8:	f822                	sd	s0,48(sp)
 9fa:	f426                	sd	s1,40(sp)
 9fc:	f04a                	sd	s2,32(sp)
 9fe:	ec4e                	sd	s3,24(sp)
 a00:	e852                	sd	s4,16(sp)
 a02:	e456                	sd	s5,8(sp)
 a04:	e05a                	sd	s6,0(sp)
 a06:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a08:	02051493          	slli	s1,a0,0x20
 a0c:	9081                	srli	s1,s1,0x20
 a0e:	04bd                	addi	s1,s1,15
 a10:	8091                	srli	s1,s1,0x4
 a12:	0014899b          	addiw	s3,s1,1
 a16:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a18:	00000517          	auipc	a0,0x0
 a1c:	16053503          	ld	a0,352(a0) # b78 <freep>
 a20:	c515                	beqz	a0,a4c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a22:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a24:	4798                	lw	a4,8(a5)
 a26:	02977f63          	bgeu	a4,s1,a64 <malloc+0x70>
 a2a:	8a4e                	mv	s4,s3
 a2c:	0009871b          	sext.w	a4,s3
 a30:	6685                	lui	a3,0x1
 a32:	00d77363          	bgeu	a4,a3,a38 <malloc+0x44>
 a36:	6a05                	lui	s4,0x1
 a38:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a3c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a40:	00000917          	auipc	s2,0x0
 a44:	13890913          	addi	s2,s2,312 # b78 <freep>
  if(p == (char*)-1)
 a48:	5afd                	li	s5,-1
 a4a:	a88d                	j	abc <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a4c:	00000797          	auipc	a5,0x0
 a50:	14478793          	addi	a5,a5,324 # b90 <base>
 a54:	00000717          	auipc	a4,0x0
 a58:	12f73223          	sd	a5,292(a4) # b78 <freep>
 a5c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a5e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a62:	b7e1                	j	a2a <malloc+0x36>
      if(p->s.size == nunits)
 a64:	02e48b63          	beq	s1,a4,a9a <malloc+0xa6>
        p->s.size -= nunits;
 a68:	4137073b          	subw	a4,a4,s3
 a6c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a6e:	1702                	slli	a4,a4,0x20
 a70:	9301                	srli	a4,a4,0x20
 a72:	0712                	slli	a4,a4,0x4
 a74:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a76:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a7a:	00000717          	auipc	a4,0x0
 a7e:	0ea73f23          	sd	a0,254(a4) # b78 <freep>
      return (void*)(p + 1);
 a82:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a86:	70e2                	ld	ra,56(sp)
 a88:	7442                	ld	s0,48(sp)
 a8a:	74a2                	ld	s1,40(sp)
 a8c:	7902                	ld	s2,32(sp)
 a8e:	69e2                	ld	s3,24(sp)
 a90:	6a42                	ld	s4,16(sp)
 a92:	6aa2                	ld	s5,8(sp)
 a94:	6b02                	ld	s6,0(sp)
 a96:	6121                	addi	sp,sp,64
 a98:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a9a:	6398                	ld	a4,0(a5)
 a9c:	e118                	sd	a4,0(a0)
 a9e:	bff1                	j	a7a <malloc+0x86>
  hp->s.size = nu;
 aa0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 aa4:	0541                	addi	a0,a0,16
 aa6:	00000097          	auipc	ra,0x0
 aaa:	ec6080e7          	jalr	-314(ra) # 96c <free>
  return freep;
 aae:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 ab2:	d971                	beqz	a0,a86 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 ab6:	4798                	lw	a4,8(a5)
 ab8:	fa9776e3          	bgeu	a4,s1,a64 <malloc+0x70>
    if(p == freep)
 abc:	00093703          	ld	a4,0(s2)
 ac0:	853e                	mv	a0,a5
 ac2:	fef719e3          	bne	a4,a5,ab4 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 ac6:	8552                	mv	a0,s4
 ac8:	00000097          	auipc	ra,0x0
 acc:	b7e080e7          	jalr	-1154(ra) # 646 <sbrk>
  if(p == (char*)-1)
 ad0:	fd5518e3          	bne	a0,s5,aa0 <malloc+0xac>
        return 0;
 ad4:	4501                	li	a0,0
 ad6:	bf45                	j	a86 <malloc+0x92>
