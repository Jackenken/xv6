
user/_pingpong:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
//
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
   0:	7135                	addi	sp,sp,-160
   2:	ed06                	sd	ra,152(sp)
   4:	e922                	sd	s0,144(sp)
   6:	e526                	sd	s1,136(sp)
   8:	1100                	addi	s0,sp,160
    int p1[2];
    int p2[2];
    pipe(p1);
   a:	fd840513          	addi	a0,s0,-40
   e:	00000097          	auipc	ra,0x0
  12:	41e080e7          	jalr	1054(ra) # 42c <pipe>
    pipe(p2);
  16:	fd040513          	addi	a0,s0,-48
  1a:	00000097          	auipc	ra,0x0
  1e:	412080e7          	jalr	1042(ra) # 42c <pipe>
    int pid =fork();
  22:	00000097          	auipc	ra,0x0
  26:	3f2080e7          	jalr	1010(ra) # 414 <fork>
    if(pid==-1){
  2a:	57fd                	li	a5,-1
  2c:	0af50963          	beq	a0,a5,de <main+0xde>
        printf("fork failed!");
        exit(1);
    }
    if ( pid== 0) {
  30:	e561                	bnez	a0,f8 <main+0xf8>
        close(p1[0]);
  32:	fd842503          	lw	a0,-40(s0)
  36:	00000097          	auipc	ra,0x0
  3a:	40e080e7          	jalr	1038(ra) # 444 <close>
        char* s = ": received ping\n";
        char buf[100]={0};
  3e:	f6043423          	sd	zero,-152(s0)
  42:	05c00613          	li	a2,92
  46:	4581                	li	a1,0
  48:	f7040513          	addi	a0,s0,-144
  4c:	00000097          	auipc	ra,0x0
  50:	1d4080e7          	jalr	468(ra) # 220 <memset>
        write(p1[1],s,strlen(s));
  54:	fdc42483          	lw	s1,-36(s0)
  58:	00001517          	auipc	a0,0x1
  5c:	8f050513          	addi	a0,a0,-1808 # 948 <malloc+0xf6>
  60:	00000097          	auipc	ra,0x0
  64:	196080e7          	jalr	406(ra) # 1f6 <strlen>
  68:	0005061b          	sext.w	a2,a0
  6c:	00001597          	auipc	a1,0x1
  70:	8dc58593          	addi	a1,a1,-1828 # 948 <malloc+0xf6>
  74:	8526                	mv	a0,s1
  76:	00000097          	auipc	ra,0x0
  7a:	3c6080e7          	jalr	966(ra) # 43c <write>
        close(p1[1]);
  7e:	fdc42503          	lw	a0,-36(s0)
  82:	00000097          	auipc	ra,0x0
  86:	3c2080e7          	jalr	962(ra) # 444 <close>
        close(p2[1]);
  8a:	fd442503          	lw	a0,-44(s0)
  8e:	00000097          	auipc	ra,0x0
  92:	3b6080e7          	jalr	950(ra) # 444 <close>
        read(p2[0],buf,sizeof(buf));
  96:	06400613          	li	a2,100
  9a:	f6840593          	addi	a1,s0,-152
  9e:	fd042503          	lw	a0,-48(s0)
  a2:	00000097          	auipc	ra,0x0
  a6:	392080e7          	jalr	914(ra) # 434 <read>
        printf("%d%s",getpid(),buf);
  aa:	00000097          	auipc	ra,0x0
  ae:	3f2080e7          	jalr	1010(ra) # 49c <getpid>
  b2:	85aa                	mv	a1,a0
  b4:	f6840613          	addi	a2,s0,-152
  b8:	00001517          	auipc	a0,0x1
  bc:	8a850513          	addi	a0,a0,-1880 # 960 <malloc+0x10e>
  c0:	00000097          	auipc	ra,0x0
  c4:	6d4080e7          	jalr	1748(ra) # 794 <printf>
        close(p2[0]);
  c8:	fd042503          	lw	a0,-48(s0)
  cc:	00000097          	auipc	ra,0x0
  d0:	378080e7          	jalr	888(ra) # 444 <close>
        exit(0);
  d4:	4501                	li	a0,0
  d6:	00000097          	auipc	ra,0x0
  da:	346080e7          	jalr	838(ra) # 41c <exit>
        printf("fork failed!");
  de:	00001517          	auipc	a0,0x1
  e2:	85a50513          	addi	a0,a0,-1958 # 938 <malloc+0xe6>
  e6:	00000097          	auipc	ra,0x0
  ea:	6ae080e7          	jalr	1710(ra) # 794 <printf>
        exit(1);
  ee:	4505                	li	a0,1
  f0:	00000097          	auipc	ra,0x0
  f4:	32c080e7          	jalr	812(ra) # 41c <exit>
    } else {
        close(p1[1]);
  f8:	fdc42503          	lw	a0,-36(s0)
  fc:	00000097          	auipc	ra,0x0
 100:	348080e7          	jalr	840(ra) # 444 <close>
        char* s = ": received pong\n";
        char buf[100]={0};
 104:	f6043423          	sd	zero,-152(s0)
 108:	05c00613          	li	a2,92
 10c:	4581                	li	a1,0
 10e:	f7040513          	addi	a0,s0,-144
 112:	00000097          	auipc	ra,0x0
 116:	10e080e7          	jalr	270(ra) # 220 <memset>
        read(p1[0],buf,sizeof(buf));
 11a:	06400613          	li	a2,100
 11e:	f6840593          	addi	a1,s0,-152
 122:	fd842503          	lw	a0,-40(s0)
 126:	00000097          	auipc	ra,0x0
 12a:	30e080e7          	jalr	782(ra) # 434 <read>
        printf("%d%s",getpid(),buf);
 12e:	00000097          	auipc	ra,0x0
 132:	36e080e7          	jalr	878(ra) # 49c <getpid>
 136:	85aa                	mv	a1,a0
 138:	f6840613          	addi	a2,s0,-152
 13c:	00001517          	auipc	a0,0x1
 140:	82450513          	addi	a0,a0,-2012 # 960 <malloc+0x10e>
 144:	00000097          	auipc	ra,0x0
 148:	650080e7          	jalr	1616(ra) # 794 <printf>
        close(p1[0]);
 14c:	fd842503          	lw	a0,-40(s0)
 150:	00000097          	auipc	ra,0x0
 154:	2f4080e7          	jalr	756(ra) # 444 <close>
        close(p2[0]);
 158:	fd042503          	lw	a0,-48(s0)
 15c:	00000097          	auipc	ra,0x0
 160:	2e8080e7          	jalr	744(ra) # 444 <close>
        write(p2[1],s,strlen(s));
 164:	fd442483          	lw	s1,-44(s0)
 168:	00001517          	auipc	a0,0x1
 16c:	80050513          	addi	a0,a0,-2048 # 968 <malloc+0x116>
 170:	00000097          	auipc	ra,0x0
 174:	086080e7          	jalr	134(ra) # 1f6 <strlen>
 178:	0005061b          	sext.w	a2,a0
 17c:	00000597          	auipc	a1,0x0
 180:	7ec58593          	addi	a1,a1,2028 # 968 <malloc+0x116>
 184:	8526                	mv	a0,s1
 186:	00000097          	auipc	ra,0x0
 18a:	2b6080e7          	jalr	694(ra) # 43c <write>
        close(p2[1]);
 18e:	fd442503          	lw	a0,-44(s0)
 192:	00000097          	auipc	ra,0x0
 196:	2b2080e7          	jalr	690(ra) # 444 <close>
        wait(0);// this sentence is very important!!!
 19a:	4501                	li	a0,0
 19c:	00000097          	auipc	ra,0x0
 1a0:	288080e7          	jalr	648(ra) # 424 <wait>
    }
    exit(0);
 1a4:	4501                	li	a0,0
 1a6:	00000097          	auipc	ra,0x0
 1aa:	276080e7          	jalr	630(ra) # 41c <exit>

00000000000001ae <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 1ae:	1141                	addi	sp,sp,-16
 1b0:	e422                	sd	s0,8(sp)
 1b2:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b4:	87aa                	mv	a5,a0
 1b6:	0585                	addi	a1,a1,1
 1b8:	0785                	addi	a5,a5,1
 1ba:	fff5c703          	lbu	a4,-1(a1)
 1be:	fee78fa3          	sb	a4,-1(a5)
 1c2:	fb75                	bnez	a4,1b6 <strcpy+0x8>
    ;
  return os;
}
 1c4:	6422                	ld	s0,8(sp)
 1c6:	0141                	addi	sp,sp,16
 1c8:	8082                	ret

00000000000001ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1ca:	1141                	addi	sp,sp,-16
 1cc:	e422                	sd	s0,8(sp)
 1ce:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1d0:	00054783          	lbu	a5,0(a0)
 1d4:	cb91                	beqz	a5,1e8 <strcmp+0x1e>
 1d6:	0005c703          	lbu	a4,0(a1)
 1da:	00f71763          	bne	a4,a5,1e8 <strcmp+0x1e>
    p++, q++;
 1de:	0505                	addi	a0,a0,1
 1e0:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1e2:	00054783          	lbu	a5,0(a0)
 1e6:	fbe5                	bnez	a5,1d6 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1e8:	0005c503          	lbu	a0,0(a1)
}
 1ec:	40a7853b          	subw	a0,a5,a0
 1f0:	6422                	ld	s0,8(sp)
 1f2:	0141                	addi	sp,sp,16
 1f4:	8082                	ret

00000000000001f6 <strlen>:

uint
strlen(const char *s)
{
 1f6:	1141                	addi	sp,sp,-16
 1f8:	e422                	sd	s0,8(sp)
 1fa:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1fc:	00054783          	lbu	a5,0(a0)
 200:	cf91                	beqz	a5,21c <strlen+0x26>
 202:	0505                	addi	a0,a0,1
 204:	87aa                	mv	a5,a0
 206:	4685                	li	a3,1
 208:	9e89                	subw	a3,a3,a0
 20a:	00f6853b          	addw	a0,a3,a5
 20e:	0785                	addi	a5,a5,1
 210:	fff7c703          	lbu	a4,-1(a5)
 214:	fb7d                	bnez	a4,20a <strlen+0x14>
    ;
  return n;
}
 216:	6422                	ld	s0,8(sp)
 218:	0141                	addi	sp,sp,16
 21a:	8082                	ret
  for(n = 0; s[n]; n++)
 21c:	4501                	li	a0,0
 21e:	bfe5                	j	216 <strlen+0x20>

0000000000000220 <memset>:

void*
memset(void *dst, int c, uint n)
{
 220:	1141                	addi	sp,sp,-16
 222:	e422                	sd	s0,8(sp)
 224:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 226:	ca19                	beqz	a2,23c <memset+0x1c>
 228:	87aa                	mv	a5,a0
 22a:	1602                	slli	a2,a2,0x20
 22c:	9201                	srli	a2,a2,0x20
 22e:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 232:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 236:	0785                	addi	a5,a5,1
 238:	fee79de3          	bne	a5,a4,232 <memset+0x12>
  }
  return dst;
}
 23c:	6422                	ld	s0,8(sp)
 23e:	0141                	addi	sp,sp,16
 240:	8082                	ret

0000000000000242 <strchr>:

char*
strchr(const char *s, char c)
{
 242:	1141                	addi	sp,sp,-16
 244:	e422                	sd	s0,8(sp)
 246:	0800                	addi	s0,sp,16
  for(; *s; s++)
 248:	00054783          	lbu	a5,0(a0)
 24c:	cb99                	beqz	a5,262 <strchr+0x20>
    if(*s == c)
 24e:	00f58763          	beq	a1,a5,25c <strchr+0x1a>
  for(; *s; s++)
 252:	0505                	addi	a0,a0,1
 254:	00054783          	lbu	a5,0(a0)
 258:	fbfd                	bnez	a5,24e <strchr+0xc>
      return (char*)s;
  return 0;
 25a:	4501                	li	a0,0
}
 25c:	6422                	ld	s0,8(sp)
 25e:	0141                	addi	sp,sp,16
 260:	8082                	ret
  return 0;
 262:	4501                	li	a0,0
 264:	bfe5                	j	25c <strchr+0x1a>

0000000000000266 <gets>:

char*
gets(char *buf, int max)
{
 266:	711d                	addi	sp,sp,-96
 268:	ec86                	sd	ra,88(sp)
 26a:	e8a2                	sd	s0,80(sp)
 26c:	e4a6                	sd	s1,72(sp)
 26e:	e0ca                	sd	s2,64(sp)
 270:	fc4e                	sd	s3,56(sp)
 272:	f852                	sd	s4,48(sp)
 274:	f456                	sd	s5,40(sp)
 276:	f05a                	sd	s6,32(sp)
 278:	ec5e                	sd	s7,24(sp)
 27a:	1080                	addi	s0,sp,96
 27c:	8baa                	mv	s7,a0
 27e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 280:	892a                	mv	s2,a0
 282:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 284:	4aa9                	li	s5,10
 286:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 288:	89a6                	mv	s3,s1
 28a:	2485                	addiw	s1,s1,1
 28c:	0344d863          	bge	s1,s4,2bc <gets+0x56>
    cc = read(0, &c, 1);
 290:	4605                	li	a2,1
 292:	faf40593          	addi	a1,s0,-81
 296:	4501                	li	a0,0
 298:	00000097          	auipc	ra,0x0
 29c:	19c080e7          	jalr	412(ra) # 434 <read>
    if(cc < 1)
 2a0:	00a05e63          	blez	a0,2bc <gets+0x56>
    buf[i++] = c;
 2a4:	faf44783          	lbu	a5,-81(s0)
 2a8:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2ac:	01578763          	beq	a5,s5,2ba <gets+0x54>
 2b0:	0905                	addi	s2,s2,1
 2b2:	fd679be3          	bne	a5,s6,288 <gets+0x22>
  for(i=0; i+1 < max; ){
 2b6:	89a6                	mv	s3,s1
 2b8:	a011                	j	2bc <gets+0x56>
 2ba:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2bc:	99de                	add	s3,s3,s7
 2be:	00098023          	sb	zero,0(s3)
  return buf;
}
 2c2:	855e                	mv	a0,s7
 2c4:	60e6                	ld	ra,88(sp)
 2c6:	6446                	ld	s0,80(sp)
 2c8:	64a6                	ld	s1,72(sp)
 2ca:	6906                	ld	s2,64(sp)
 2cc:	79e2                	ld	s3,56(sp)
 2ce:	7a42                	ld	s4,48(sp)
 2d0:	7aa2                	ld	s5,40(sp)
 2d2:	7b02                	ld	s6,32(sp)
 2d4:	6be2                	ld	s7,24(sp)
 2d6:	6125                	addi	sp,sp,96
 2d8:	8082                	ret

00000000000002da <stat>:

int
stat(const char *n, struct stat *st)
{
 2da:	1101                	addi	sp,sp,-32
 2dc:	ec06                	sd	ra,24(sp)
 2de:	e822                	sd	s0,16(sp)
 2e0:	e426                	sd	s1,8(sp)
 2e2:	e04a                	sd	s2,0(sp)
 2e4:	1000                	addi	s0,sp,32
 2e6:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e8:	4581                	li	a1,0
 2ea:	00000097          	auipc	ra,0x0
 2ee:	172080e7          	jalr	370(ra) # 45c <open>
  if(fd < 0)
 2f2:	02054563          	bltz	a0,31c <stat+0x42>
 2f6:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2f8:	85ca                	mv	a1,s2
 2fa:	00000097          	auipc	ra,0x0
 2fe:	17a080e7          	jalr	378(ra) # 474 <fstat>
 302:	892a                	mv	s2,a0
  close(fd);
 304:	8526                	mv	a0,s1
 306:	00000097          	auipc	ra,0x0
 30a:	13e080e7          	jalr	318(ra) # 444 <close>
  return r;
}
 30e:	854a                	mv	a0,s2
 310:	60e2                	ld	ra,24(sp)
 312:	6442                	ld	s0,16(sp)
 314:	64a2                	ld	s1,8(sp)
 316:	6902                	ld	s2,0(sp)
 318:	6105                	addi	sp,sp,32
 31a:	8082                	ret
    return -1;
 31c:	597d                	li	s2,-1
 31e:	bfc5                	j	30e <stat+0x34>

0000000000000320 <atoi>:

int
atoi(const char *s)
{
 320:	1141                	addi	sp,sp,-16
 322:	e422                	sd	s0,8(sp)
 324:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 326:	00054603          	lbu	a2,0(a0)
 32a:	fd06079b          	addiw	a5,a2,-48
 32e:	0ff7f793          	andi	a5,a5,255
 332:	4725                	li	a4,9
 334:	02f76963          	bltu	a4,a5,366 <atoi+0x46>
 338:	86aa                	mv	a3,a0
  n = 0;
 33a:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 33c:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 33e:	0685                	addi	a3,a3,1
 340:	0025179b          	slliw	a5,a0,0x2
 344:	9fa9                	addw	a5,a5,a0
 346:	0017979b          	slliw	a5,a5,0x1
 34a:	9fb1                	addw	a5,a5,a2
 34c:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 350:	0006c603          	lbu	a2,0(a3)
 354:	fd06071b          	addiw	a4,a2,-48
 358:	0ff77713          	andi	a4,a4,255
 35c:	fee5f1e3          	bgeu	a1,a4,33e <atoi+0x1e>
  return n;
}
 360:	6422                	ld	s0,8(sp)
 362:	0141                	addi	sp,sp,16
 364:	8082                	ret
  n = 0;
 366:	4501                	li	a0,0
 368:	bfe5                	j	360 <atoi+0x40>

000000000000036a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 36a:	1141                	addi	sp,sp,-16
 36c:	e422                	sd	s0,8(sp)
 36e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 370:	02b57463          	bgeu	a0,a1,398 <memmove+0x2e>
    while(n-- > 0)
 374:	00c05f63          	blez	a2,392 <memmove+0x28>
 378:	1602                	slli	a2,a2,0x20
 37a:	9201                	srli	a2,a2,0x20
 37c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 380:	872a                	mv	a4,a0
      *dst++ = *src++;
 382:	0585                	addi	a1,a1,1
 384:	0705                	addi	a4,a4,1
 386:	fff5c683          	lbu	a3,-1(a1)
 38a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 38e:	fee79ae3          	bne	a5,a4,382 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 392:	6422                	ld	s0,8(sp)
 394:	0141                	addi	sp,sp,16
 396:	8082                	ret
    dst += n;
 398:	00c50733          	add	a4,a0,a2
    src += n;
 39c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 39e:	fec05ae3          	blez	a2,392 <memmove+0x28>
 3a2:	fff6079b          	addiw	a5,a2,-1
 3a6:	1782                	slli	a5,a5,0x20
 3a8:	9381                	srli	a5,a5,0x20
 3aa:	fff7c793          	not	a5,a5
 3ae:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3b0:	15fd                	addi	a1,a1,-1
 3b2:	177d                	addi	a4,a4,-1
 3b4:	0005c683          	lbu	a3,0(a1)
 3b8:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3bc:	fee79ae3          	bne	a5,a4,3b0 <memmove+0x46>
 3c0:	bfc9                	j	392 <memmove+0x28>

00000000000003c2 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3c2:	1141                	addi	sp,sp,-16
 3c4:	e422                	sd	s0,8(sp)
 3c6:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3c8:	ca05                	beqz	a2,3f8 <memcmp+0x36>
 3ca:	fff6069b          	addiw	a3,a2,-1
 3ce:	1682                	slli	a3,a3,0x20
 3d0:	9281                	srli	a3,a3,0x20
 3d2:	0685                	addi	a3,a3,1
 3d4:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3d6:	00054783          	lbu	a5,0(a0)
 3da:	0005c703          	lbu	a4,0(a1)
 3de:	00e79863          	bne	a5,a4,3ee <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3e2:	0505                	addi	a0,a0,1
    p2++;
 3e4:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3e6:	fed518e3          	bne	a0,a3,3d6 <memcmp+0x14>
  }
  return 0;
 3ea:	4501                	li	a0,0
 3ec:	a019                	j	3f2 <memcmp+0x30>
      return *p1 - *p2;
 3ee:	40e7853b          	subw	a0,a5,a4
}
 3f2:	6422                	ld	s0,8(sp)
 3f4:	0141                	addi	sp,sp,16
 3f6:	8082                	ret
  return 0;
 3f8:	4501                	li	a0,0
 3fa:	bfe5                	j	3f2 <memcmp+0x30>

00000000000003fc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3fc:	1141                	addi	sp,sp,-16
 3fe:	e406                	sd	ra,8(sp)
 400:	e022                	sd	s0,0(sp)
 402:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 404:	00000097          	auipc	ra,0x0
 408:	f66080e7          	jalr	-154(ra) # 36a <memmove>
}
 40c:	60a2                	ld	ra,8(sp)
 40e:	6402                	ld	s0,0(sp)
 410:	0141                	addi	sp,sp,16
 412:	8082                	ret

0000000000000414 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 414:	4885                	li	a7,1
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <exit>:
.global exit
exit:
 li a7, SYS_exit
 41c:	4889                	li	a7,2
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <wait>:
.global wait
wait:
 li a7, SYS_wait
 424:	488d                	li	a7,3
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 42c:	4891                	li	a7,4
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <read>:
.global read
read:
 li a7, SYS_read
 434:	4895                	li	a7,5
 ecall
 436:	00000073          	ecall
 ret
 43a:	8082                	ret

000000000000043c <write>:
.global write
write:
 li a7, SYS_write
 43c:	48c1                	li	a7,16
 ecall
 43e:	00000073          	ecall
 ret
 442:	8082                	ret

0000000000000444 <close>:
.global close
close:
 li a7, SYS_close
 444:	48d5                	li	a7,21
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <kill>:
.global kill
kill:
 li a7, SYS_kill
 44c:	4899                	li	a7,6
 ecall
 44e:	00000073          	ecall
 ret
 452:	8082                	ret

0000000000000454 <exec>:
.global exec
exec:
 li a7, SYS_exec
 454:	489d                	li	a7,7
 ecall
 456:	00000073          	ecall
 ret
 45a:	8082                	ret

000000000000045c <open>:
.global open
open:
 li a7, SYS_open
 45c:	48bd                	li	a7,15
 ecall
 45e:	00000073          	ecall
 ret
 462:	8082                	ret

0000000000000464 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 464:	48c5                	li	a7,17
 ecall
 466:	00000073          	ecall
 ret
 46a:	8082                	ret

000000000000046c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 46c:	48c9                	li	a7,18
 ecall
 46e:	00000073          	ecall
 ret
 472:	8082                	ret

0000000000000474 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 474:	48a1                	li	a7,8
 ecall
 476:	00000073          	ecall
 ret
 47a:	8082                	ret

000000000000047c <link>:
.global link
link:
 li a7, SYS_link
 47c:	48cd                	li	a7,19
 ecall
 47e:	00000073          	ecall
 ret
 482:	8082                	ret

0000000000000484 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 484:	48d1                	li	a7,20
 ecall
 486:	00000073          	ecall
 ret
 48a:	8082                	ret

000000000000048c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 48c:	48a5                	li	a7,9
 ecall
 48e:	00000073          	ecall
 ret
 492:	8082                	ret

0000000000000494 <dup>:
.global dup
dup:
 li a7, SYS_dup
 494:	48a9                	li	a7,10
 ecall
 496:	00000073          	ecall
 ret
 49a:	8082                	ret

000000000000049c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 49c:	48ad                	li	a7,11
 ecall
 49e:	00000073          	ecall
 ret
 4a2:	8082                	ret

00000000000004a4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4a4:	48b1                	li	a7,12
 ecall
 4a6:	00000073          	ecall
 ret
 4aa:	8082                	ret

00000000000004ac <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4ac:	48b5                	li	a7,13
 ecall
 4ae:	00000073          	ecall
 ret
 4b2:	8082                	ret

00000000000004b4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4b4:	48b9                	li	a7,14
 ecall
 4b6:	00000073          	ecall
 ret
 4ba:	8082                	ret

00000000000004bc <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4bc:	1101                	addi	sp,sp,-32
 4be:	ec06                	sd	ra,24(sp)
 4c0:	e822                	sd	s0,16(sp)
 4c2:	1000                	addi	s0,sp,32
 4c4:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4c8:	4605                	li	a2,1
 4ca:	fef40593          	addi	a1,s0,-17
 4ce:	00000097          	auipc	ra,0x0
 4d2:	f6e080e7          	jalr	-146(ra) # 43c <write>
}
 4d6:	60e2                	ld	ra,24(sp)
 4d8:	6442                	ld	s0,16(sp)
 4da:	6105                	addi	sp,sp,32
 4dc:	8082                	ret

00000000000004de <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4de:	7139                	addi	sp,sp,-64
 4e0:	fc06                	sd	ra,56(sp)
 4e2:	f822                	sd	s0,48(sp)
 4e4:	f426                	sd	s1,40(sp)
 4e6:	f04a                	sd	s2,32(sp)
 4e8:	ec4e                	sd	s3,24(sp)
 4ea:	0080                	addi	s0,sp,64
 4ec:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ee:	c299                	beqz	a3,4f4 <printint+0x16>
 4f0:	0805c863          	bltz	a1,580 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4f4:	2581                	sext.w	a1,a1
  neg = 0;
 4f6:	4881                	li	a7,0
 4f8:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4fc:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4fe:	2601                	sext.w	a2,a2
 500:	00000517          	auipc	a0,0x0
 504:	48850513          	addi	a0,a0,1160 # 988 <digits>
 508:	883a                	mv	a6,a4
 50a:	2705                	addiw	a4,a4,1
 50c:	02c5f7bb          	remuw	a5,a1,a2
 510:	1782                	slli	a5,a5,0x20
 512:	9381                	srli	a5,a5,0x20
 514:	97aa                	add	a5,a5,a0
 516:	0007c783          	lbu	a5,0(a5)
 51a:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 51e:	0005879b          	sext.w	a5,a1
 522:	02c5d5bb          	divuw	a1,a1,a2
 526:	0685                	addi	a3,a3,1
 528:	fec7f0e3          	bgeu	a5,a2,508 <printint+0x2a>
  if(neg)
 52c:	00088b63          	beqz	a7,542 <printint+0x64>
    buf[i++] = '-';
 530:	fd040793          	addi	a5,s0,-48
 534:	973e                	add	a4,a4,a5
 536:	02d00793          	li	a5,45
 53a:	fef70823          	sb	a5,-16(a4)
 53e:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 542:	02e05863          	blez	a4,572 <printint+0x94>
 546:	fc040793          	addi	a5,s0,-64
 54a:	00e78933          	add	s2,a5,a4
 54e:	fff78993          	addi	s3,a5,-1
 552:	99ba                	add	s3,s3,a4
 554:	377d                	addiw	a4,a4,-1
 556:	1702                	slli	a4,a4,0x20
 558:	9301                	srli	a4,a4,0x20
 55a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 55e:	fff94583          	lbu	a1,-1(s2)
 562:	8526                	mv	a0,s1
 564:	00000097          	auipc	ra,0x0
 568:	f58080e7          	jalr	-168(ra) # 4bc <putc>
  while(--i >= 0)
 56c:	197d                	addi	s2,s2,-1
 56e:	ff3918e3          	bne	s2,s3,55e <printint+0x80>
}
 572:	70e2                	ld	ra,56(sp)
 574:	7442                	ld	s0,48(sp)
 576:	74a2                	ld	s1,40(sp)
 578:	7902                	ld	s2,32(sp)
 57a:	69e2                	ld	s3,24(sp)
 57c:	6121                	addi	sp,sp,64
 57e:	8082                	ret
    x = -xx;
 580:	40b005bb          	negw	a1,a1
    neg = 1;
 584:	4885                	li	a7,1
    x = -xx;
 586:	bf8d                	j	4f8 <printint+0x1a>

0000000000000588 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 588:	7119                	addi	sp,sp,-128
 58a:	fc86                	sd	ra,120(sp)
 58c:	f8a2                	sd	s0,112(sp)
 58e:	f4a6                	sd	s1,104(sp)
 590:	f0ca                	sd	s2,96(sp)
 592:	ecce                	sd	s3,88(sp)
 594:	e8d2                	sd	s4,80(sp)
 596:	e4d6                	sd	s5,72(sp)
 598:	e0da                	sd	s6,64(sp)
 59a:	fc5e                	sd	s7,56(sp)
 59c:	f862                	sd	s8,48(sp)
 59e:	f466                	sd	s9,40(sp)
 5a0:	f06a                	sd	s10,32(sp)
 5a2:	ec6e                	sd	s11,24(sp)
 5a4:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5a6:	0005c903          	lbu	s2,0(a1)
 5aa:	18090f63          	beqz	s2,748 <vprintf+0x1c0>
 5ae:	8aaa                	mv	s5,a0
 5b0:	8b32                	mv	s6,a2
 5b2:	00158493          	addi	s1,a1,1
  state = 0;
 5b6:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5b8:	02500a13          	li	s4,37
      if(c == 'd'){
 5bc:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5c0:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5c4:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5c8:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5cc:	00000b97          	auipc	s7,0x0
 5d0:	3bcb8b93          	addi	s7,s7,956 # 988 <digits>
 5d4:	a839                	j	5f2 <vprintf+0x6a>
        putc(fd, c);
 5d6:	85ca                	mv	a1,s2
 5d8:	8556                	mv	a0,s5
 5da:	00000097          	auipc	ra,0x0
 5de:	ee2080e7          	jalr	-286(ra) # 4bc <putc>
 5e2:	a019                	j	5e8 <vprintf+0x60>
    } else if(state == '%'){
 5e4:	01498f63          	beq	s3,s4,602 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5e8:	0485                	addi	s1,s1,1
 5ea:	fff4c903          	lbu	s2,-1(s1)
 5ee:	14090d63          	beqz	s2,748 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5f2:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5f6:	fe0997e3          	bnez	s3,5e4 <vprintf+0x5c>
      if(c == '%'){
 5fa:	fd479ee3          	bne	a5,s4,5d6 <vprintf+0x4e>
        state = '%';
 5fe:	89be                	mv	s3,a5
 600:	b7e5                	j	5e8 <vprintf+0x60>
      if(c == 'd'){
 602:	05878063          	beq	a5,s8,642 <vprintf+0xba>
      } else if(c == 'l') {
 606:	05978c63          	beq	a5,s9,65e <vprintf+0xd6>
      } else if(c == 'x') {
 60a:	07a78863          	beq	a5,s10,67a <vprintf+0xf2>
      } else if(c == 'p') {
 60e:	09b78463          	beq	a5,s11,696 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 612:	07300713          	li	a4,115
 616:	0ce78663          	beq	a5,a4,6e2 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 61a:	06300713          	li	a4,99
 61e:	0ee78e63          	beq	a5,a4,71a <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 622:	11478863          	beq	a5,s4,732 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 626:	85d2                	mv	a1,s4
 628:	8556                	mv	a0,s5
 62a:	00000097          	auipc	ra,0x0
 62e:	e92080e7          	jalr	-366(ra) # 4bc <putc>
        putc(fd, c);
 632:	85ca                	mv	a1,s2
 634:	8556                	mv	a0,s5
 636:	00000097          	auipc	ra,0x0
 63a:	e86080e7          	jalr	-378(ra) # 4bc <putc>
      }
      state = 0;
 63e:	4981                	li	s3,0
 640:	b765                	j	5e8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 642:	008b0913          	addi	s2,s6,8
 646:	4685                	li	a3,1
 648:	4629                	li	a2,10
 64a:	000b2583          	lw	a1,0(s6)
 64e:	8556                	mv	a0,s5
 650:	00000097          	auipc	ra,0x0
 654:	e8e080e7          	jalr	-370(ra) # 4de <printint>
 658:	8b4a                	mv	s6,s2
      state = 0;
 65a:	4981                	li	s3,0
 65c:	b771                	j	5e8 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 65e:	008b0913          	addi	s2,s6,8
 662:	4681                	li	a3,0
 664:	4629                	li	a2,10
 666:	000b2583          	lw	a1,0(s6)
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	e72080e7          	jalr	-398(ra) # 4de <printint>
 674:	8b4a                	mv	s6,s2
      state = 0;
 676:	4981                	li	s3,0
 678:	bf85                	j	5e8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 67a:	008b0913          	addi	s2,s6,8
 67e:	4681                	li	a3,0
 680:	4641                	li	a2,16
 682:	000b2583          	lw	a1,0(s6)
 686:	8556                	mv	a0,s5
 688:	00000097          	auipc	ra,0x0
 68c:	e56080e7          	jalr	-426(ra) # 4de <printint>
 690:	8b4a                	mv	s6,s2
      state = 0;
 692:	4981                	li	s3,0
 694:	bf91                	j	5e8 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 696:	008b0793          	addi	a5,s6,8
 69a:	f8f43423          	sd	a5,-120(s0)
 69e:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6a2:	03000593          	li	a1,48
 6a6:	8556                	mv	a0,s5
 6a8:	00000097          	auipc	ra,0x0
 6ac:	e14080e7          	jalr	-492(ra) # 4bc <putc>
  putc(fd, 'x');
 6b0:	85ea                	mv	a1,s10
 6b2:	8556                	mv	a0,s5
 6b4:	00000097          	auipc	ra,0x0
 6b8:	e08080e7          	jalr	-504(ra) # 4bc <putc>
 6bc:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6be:	03c9d793          	srli	a5,s3,0x3c
 6c2:	97de                	add	a5,a5,s7
 6c4:	0007c583          	lbu	a1,0(a5)
 6c8:	8556                	mv	a0,s5
 6ca:	00000097          	auipc	ra,0x0
 6ce:	df2080e7          	jalr	-526(ra) # 4bc <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6d2:	0992                	slli	s3,s3,0x4
 6d4:	397d                	addiw	s2,s2,-1
 6d6:	fe0914e3          	bnez	s2,6be <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6da:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6de:	4981                	li	s3,0
 6e0:	b721                	j	5e8 <vprintf+0x60>
        s = va_arg(ap, char*);
 6e2:	008b0993          	addi	s3,s6,8
 6e6:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6ea:	02090163          	beqz	s2,70c <vprintf+0x184>
        while(*s != 0){
 6ee:	00094583          	lbu	a1,0(s2)
 6f2:	c9a1                	beqz	a1,742 <vprintf+0x1ba>
          putc(fd, *s);
 6f4:	8556                	mv	a0,s5
 6f6:	00000097          	auipc	ra,0x0
 6fa:	dc6080e7          	jalr	-570(ra) # 4bc <putc>
          s++;
 6fe:	0905                	addi	s2,s2,1
        while(*s != 0){
 700:	00094583          	lbu	a1,0(s2)
 704:	f9e5                	bnez	a1,6f4 <vprintf+0x16c>
        s = va_arg(ap, char*);
 706:	8b4e                	mv	s6,s3
      state = 0;
 708:	4981                	li	s3,0
 70a:	bdf9                	j	5e8 <vprintf+0x60>
          s = "(null)";
 70c:	00000917          	auipc	s2,0x0
 710:	27490913          	addi	s2,s2,628 # 980 <malloc+0x12e>
        while(*s != 0){
 714:	02800593          	li	a1,40
 718:	bff1                	j	6f4 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 71a:	008b0913          	addi	s2,s6,8
 71e:	000b4583          	lbu	a1,0(s6)
 722:	8556                	mv	a0,s5
 724:	00000097          	auipc	ra,0x0
 728:	d98080e7          	jalr	-616(ra) # 4bc <putc>
 72c:	8b4a                	mv	s6,s2
      state = 0;
 72e:	4981                	li	s3,0
 730:	bd65                	j	5e8 <vprintf+0x60>
        putc(fd, c);
 732:	85d2                	mv	a1,s4
 734:	8556                	mv	a0,s5
 736:	00000097          	auipc	ra,0x0
 73a:	d86080e7          	jalr	-634(ra) # 4bc <putc>
      state = 0;
 73e:	4981                	li	s3,0
 740:	b565                	j	5e8 <vprintf+0x60>
        s = va_arg(ap, char*);
 742:	8b4e                	mv	s6,s3
      state = 0;
 744:	4981                	li	s3,0
 746:	b54d                	j	5e8 <vprintf+0x60>
    }
  }
}
 748:	70e6                	ld	ra,120(sp)
 74a:	7446                	ld	s0,112(sp)
 74c:	74a6                	ld	s1,104(sp)
 74e:	7906                	ld	s2,96(sp)
 750:	69e6                	ld	s3,88(sp)
 752:	6a46                	ld	s4,80(sp)
 754:	6aa6                	ld	s5,72(sp)
 756:	6b06                	ld	s6,64(sp)
 758:	7be2                	ld	s7,56(sp)
 75a:	7c42                	ld	s8,48(sp)
 75c:	7ca2                	ld	s9,40(sp)
 75e:	7d02                	ld	s10,32(sp)
 760:	6de2                	ld	s11,24(sp)
 762:	6109                	addi	sp,sp,128
 764:	8082                	ret

0000000000000766 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 766:	715d                	addi	sp,sp,-80
 768:	ec06                	sd	ra,24(sp)
 76a:	e822                	sd	s0,16(sp)
 76c:	1000                	addi	s0,sp,32
 76e:	e010                	sd	a2,0(s0)
 770:	e414                	sd	a3,8(s0)
 772:	e818                	sd	a4,16(s0)
 774:	ec1c                	sd	a5,24(s0)
 776:	03043023          	sd	a6,32(s0)
 77a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 77e:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 782:	8622                	mv	a2,s0
 784:	00000097          	auipc	ra,0x0
 788:	e04080e7          	jalr	-508(ra) # 588 <vprintf>
}
 78c:	60e2                	ld	ra,24(sp)
 78e:	6442                	ld	s0,16(sp)
 790:	6161                	addi	sp,sp,80
 792:	8082                	ret

0000000000000794 <printf>:

void
printf(const char *fmt, ...)
{
 794:	711d                	addi	sp,sp,-96
 796:	ec06                	sd	ra,24(sp)
 798:	e822                	sd	s0,16(sp)
 79a:	1000                	addi	s0,sp,32
 79c:	e40c                	sd	a1,8(s0)
 79e:	e810                	sd	a2,16(s0)
 7a0:	ec14                	sd	a3,24(s0)
 7a2:	f018                	sd	a4,32(s0)
 7a4:	f41c                	sd	a5,40(s0)
 7a6:	03043823          	sd	a6,48(s0)
 7aa:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7ae:	00840613          	addi	a2,s0,8
 7b2:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7b6:	85aa                	mv	a1,a0
 7b8:	4505                	li	a0,1
 7ba:	00000097          	auipc	ra,0x0
 7be:	dce080e7          	jalr	-562(ra) # 588 <vprintf>
}
 7c2:	60e2                	ld	ra,24(sp)
 7c4:	6442                	ld	s0,16(sp)
 7c6:	6125                	addi	sp,sp,96
 7c8:	8082                	ret

00000000000007ca <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ca:	1141                	addi	sp,sp,-16
 7cc:	e422                	sd	s0,8(sp)
 7ce:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d0:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d4:	00000797          	auipc	a5,0x0
 7d8:	1cc7b783          	ld	a5,460(a5) # 9a0 <freep>
 7dc:	a805                	j	80c <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7de:	4618                	lw	a4,8(a2)
 7e0:	9db9                	addw	a1,a1,a4
 7e2:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e6:	6398                	ld	a4,0(a5)
 7e8:	6318                	ld	a4,0(a4)
 7ea:	fee53823          	sd	a4,-16(a0)
 7ee:	a091                	j	832 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7f0:	ff852703          	lw	a4,-8(a0)
 7f4:	9e39                	addw	a2,a2,a4
 7f6:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7f8:	ff053703          	ld	a4,-16(a0)
 7fc:	e398                	sd	a4,0(a5)
 7fe:	a099                	j	844 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 800:	6398                	ld	a4,0(a5)
 802:	00e7e463          	bltu	a5,a4,80a <free+0x40>
 806:	00e6ea63          	bltu	a3,a4,81a <free+0x50>
{
 80a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80c:	fed7fae3          	bgeu	a5,a3,800 <free+0x36>
 810:	6398                	ld	a4,0(a5)
 812:	00e6e463          	bltu	a3,a4,81a <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 816:	fee7eae3          	bltu	a5,a4,80a <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 81a:	ff852583          	lw	a1,-8(a0)
 81e:	6390                	ld	a2,0(a5)
 820:	02059713          	slli	a4,a1,0x20
 824:	9301                	srli	a4,a4,0x20
 826:	0712                	slli	a4,a4,0x4
 828:	9736                	add	a4,a4,a3
 82a:	fae60ae3          	beq	a2,a4,7de <free+0x14>
    bp->s.ptr = p->s.ptr;
 82e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 832:	4790                	lw	a2,8(a5)
 834:	02061713          	slli	a4,a2,0x20
 838:	9301                	srli	a4,a4,0x20
 83a:	0712                	slli	a4,a4,0x4
 83c:	973e                	add	a4,a4,a5
 83e:	fae689e3          	beq	a3,a4,7f0 <free+0x26>
  } else
    p->s.ptr = bp;
 842:	e394                	sd	a3,0(a5)
  freep = p;
 844:	00000717          	auipc	a4,0x0
 848:	14f73e23          	sd	a5,348(a4) # 9a0 <freep>
}
 84c:	6422                	ld	s0,8(sp)
 84e:	0141                	addi	sp,sp,16
 850:	8082                	ret

0000000000000852 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 852:	7139                	addi	sp,sp,-64
 854:	fc06                	sd	ra,56(sp)
 856:	f822                	sd	s0,48(sp)
 858:	f426                	sd	s1,40(sp)
 85a:	f04a                	sd	s2,32(sp)
 85c:	ec4e                	sd	s3,24(sp)
 85e:	e852                	sd	s4,16(sp)
 860:	e456                	sd	s5,8(sp)
 862:	e05a                	sd	s6,0(sp)
 864:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 866:	02051493          	slli	s1,a0,0x20
 86a:	9081                	srli	s1,s1,0x20
 86c:	04bd                	addi	s1,s1,15
 86e:	8091                	srli	s1,s1,0x4
 870:	0014899b          	addiw	s3,s1,1
 874:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 876:	00000517          	auipc	a0,0x0
 87a:	12a53503          	ld	a0,298(a0) # 9a0 <freep>
 87e:	c515                	beqz	a0,8aa <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 880:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 882:	4798                	lw	a4,8(a5)
 884:	02977f63          	bgeu	a4,s1,8c2 <malloc+0x70>
 888:	8a4e                	mv	s4,s3
 88a:	0009871b          	sext.w	a4,s3
 88e:	6685                	lui	a3,0x1
 890:	00d77363          	bgeu	a4,a3,896 <malloc+0x44>
 894:	6a05                	lui	s4,0x1
 896:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 89a:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 89e:	00000917          	auipc	s2,0x0
 8a2:	10290913          	addi	s2,s2,258 # 9a0 <freep>
  if(p == (char*)-1)
 8a6:	5afd                	li	s5,-1
 8a8:	a88d                	j	91a <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8aa:	00000797          	auipc	a5,0x0
 8ae:	0fe78793          	addi	a5,a5,254 # 9a8 <base>
 8b2:	00000717          	auipc	a4,0x0
 8b6:	0ef73723          	sd	a5,238(a4) # 9a0 <freep>
 8ba:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8bc:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8c0:	b7e1                	j	888 <malloc+0x36>
      if(p->s.size == nunits)
 8c2:	02e48b63          	beq	s1,a4,8f8 <malloc+0xa6>
        p->s.size -= nunits;
 8c6:	4137073b          	subw	a4,a4,s3
 8ca:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8cc:	1702                	slli	a4,a4,0x20
 8ce:	9301                	srli	a4,a4,0x20
 8d0:	0712                	slli	a4,a4,0x4
 8d2:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8d4:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8d8:	00000717          	auipc	a4,0x0
 8dc:	0ca73423          	sd	a0,200(a4) # 9a0 <freep>
      return (void*)(p + 1);
 8e0:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e4:	70e2                	ld	ra,56(sp)
 8e6:	7442                	ld	s0,48(sp)
 8e8:	74a2                	ld	s1,40(sp)
 8ea:	7902                	ld	s2,32(sp)
 8ec:	69e2                	ld	s3,24(sp)
 8ee:	6a42                	ld	s4,16(sp)
 8f0:	6aa2                	ld	s5,8(sp)
 8f2:	6b02                	ld	s6,0(sp)
 8f4:	6121                	addi	sp,sp,64
 8f6:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8f8:	6398                	ld	a4,0(a5)
 8fa:	e118                	sd	a4,0(a0)
 8fc:	bff1                	j	8d8 <malloc+0x86>
  hp->s.size = nu;
 8fe:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 902:	0541                	addi	a0,a0,16
 904:	00000097          	auipc	ra,0x0
 908:	ec6080e7          	jalr	-314(ra) # 7ca <free>
  return freep;
 90c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 910:	d971                	beqz	a0,8e4 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 912:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 914:	4798                	lw	a4,8(a5)
 916:	fa9776e3          	bgeu	a4,s1,8c2 <malloc+0x70>
    if(p == freep)
 91a:	00093703          	ld	a4,0(s2)
 91e:	853e                	mv	a0,a5
 920:	fef719e3          	bne	a4,a5,912 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 924:	8552                	mv	a0,s4
 926:	00000097          	auipc	ra,0x0
 92a:	b7e080e7          	jalr	-1154(ra) # 4a4 <sbrk>
  if(p == (char*)-1)
 92e:	fd5518e3          	bne	a0,s5,8fe <malloc+0xac>
        return 0;
 932:	4501                	li	a0,0
 934:	bf45                	j	8e4 <malloc+0x92>
