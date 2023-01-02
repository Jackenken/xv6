
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <plines>:
        wait(0);
    }
    exit(0);
}

void plines(int* p1){
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	0080                	addi	s0,sp,64
  10:	84aa                	mv	s1,a0
    int buf=1;
  12:	4785                	li	a5,1
  14:	fcf42623          	sw	a5,-52(s0)
    close(p1[1]);
  18:	4148                	lw	a0,4(a0)
  1a:	00000097          	auipc	ra,0x0
  1e:	42e080e7          	jalr	1070(ra) # 448 <close>
    int first = 1;
    int p2[2];
    int pp = pipe(p2);
  22:	fc040513          	addi	a0,s0,-64
  26:	00000097          	auipc	ra,0x0
  2a:	40a080e7          	jalr	1034(ra) # 430 <pipe>
    if(pp==-1){
  2e:	57fd                	li	a5,-1
  30:	02f50063          	beq	a0,a5,50 <plines+0x50>
//        printf("pipe failed!");
        exit(0);
    }
    int pid=fork();
  34:	00000097          	auipc	ra,0x0
  38:	3e4080e7          	jalr	996(ra) # 418 <fork>
    if (pid==-1){
  3c:	57fd                	li	a5,-1
  3e:	00f50e63          	beq	a0,a5,5a <plines+0x5a>
//        printf("fork failed!");
        exit(1);
    }
    if(pid==0){
  42:	e10d                	bnez	a0,64 <plines+0x64>
        plines(p2); // can return ?
  44:	fc040513          	addi	a0,s0,-64
  48:	00000097          	auipc	ra,0x0
  4c:	fb8080e7          	jalr	-72(ra) # 0 <plines>
        exit(0);
  50:	4501                	li	a0,0
  52:	00000097          	auipc	ra,0x0
  56:	3ce080e7          	jalr	974(ra) # 420 <exit>
        exit(1);
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	3c4080e7          	jalr	964(ra) # 420 <exit>
    } else {
        close(p2[0]);
  64:	fc042503          	lw	a0,-64(s0)
  68:	00000097          	auipc	ra,0x0
  6c:	3e0080e7          	jalr	992(ra) # 448 <close>
    int first = 1;
  70:	4905                	li	s2,1
        while (read(p1[0], &buf, sizeof(buf)) != 0) {
            if (first == 1) {
  72:	4985                	li	s3,1
                first = buf;
                printf("prime %d\n", buf);
  74:	00001a17          	auipc	s4,0x1
  78:	8cca0a13          	addi	s4,s4,-1844 # 940 <malloc+0xea>
        while (read(p1[0], &buf, sizeof(buf)) != 0) {
  7c:	a809                	j	8e <plines+0x8e>
                first = buf;
  7e:	fcc42903          	lw	s2,-52(s0)
                printf("prime %d\n", buf);
  82:	85ca                	mv	a1,s2
  84:	8552                	mv	a0,s4
  86:	00000097          	auipc	ra,0x0
  8a:	712080e7          	jalr	1810(ra) # 798 <printf>
        while (read(p1[0], &buf, sizeof(buf)) != 0) {
  8e:	4611                	li	a2,4
  90:	fcc40593          	addi	a1,s0,-52
  94:	4088                	lw	a0,0(s1)
  96:	00000097          	auipc	ra,0x0
  9a:	3a2080e7          	jalr	930(ra) # 438 <read>
  9e:	c115                	beqz	a0,c2 <plines+0xc2>
            if (first == 1) {
  a0:	fd390fe3          	beq	s2,s3,7e <plines+0x7e>
            } else {
                //  send
                if (buf % first != 0) {
  a4:	fcc42783          	lw	a5,-52(s0)
  a8:	0327e7bb          	remw	a5,a5,s2
  ac:	d3ed                	beqz	a5,8e <plines+0x8e>
                    write(p2[1], &buf, sizeof(buf));
  ae:	4611                	li	a2,4
  b0:	fcc40593          	addi	a1,s0,-52
  b4:	fc442503          	lw	a0,-60(s0)
  b8:	00000097          	auipc	ra,0x0
  bc:	388080e7          	jalr	904(ra) # 440 <write>
  c0:	b7f9                	j	8e <plines+0x8e>
                }
            }
        }
        close(p1[0]);
  c2:	4088                	lw	a0,0(s1)
  c4:	00000097          	auipc	ra,0x0
  c8:	384080e7          	jalr	900(ra) # 448 <close>
        close(p2[1]);
  cc:	fc442503          	lw	a0,-60(s0)
  d0:	00000097          	auipc	ra,0x0
  d4:	378080e7          	jalr	888(ra) # 448 <close>
        wait(0);
  d8:	4501                	li	a0,0
  da:	00000097          	auipc	ra,0x0
  de:	34e080e7          	jalr	846(ra) # 428 <wait>
    }
    exit(0);
  e2:	4501                	li	a0,0
  e4:	00000097          	auipc	ra,0x0
  e8:	33c080e7          	jalr	828(ra) # 420 <exit>

00000000000000ec <main>:
int main(int argc, char *argv[]) {
  ec:	7179                	addi	sp,sp,-48
  ee:	f406                	sd	ra,40(sp)
  f0:	f022                	sd	s0,32(sp)
  f2:	ec26                	sd	s1,24(sp)
  f4:	1800                	addi	s0,sp,48
    int pp = pipe(p);
  f6:	fd840513          	addi	a0,s0,-40
  fa:	00000097          	auipc	ra,0x0
  fe:	336080e7          	jalr	822(ra) # 430 <pipe>
 102:	84aa                	mv	s1,a0
    int pid =fork();
 104:	00000097          	auipc	ra,0x0
 108:	314080e7          	jalr	788(ra) # 418 <fork>
    if(pid==-1){
 10c:	57fd                	li	a5,-1
 10e:	00f50c63          	beq	a0,a5,126 <main+0x3a>
    if(pp==-1){
 112:	57fd                	li	a5,-1
 114:	02f48663          	beq	s1,a5,140 <main+0x54>
    if (pid== 0){
 118:	e129                	bnez	a0,15a <main+0x6e>
        plines(p);
 11a:	fd840513          	addi	a0,s0,-40
 11e:	00000097          	auipc	ra,0x0
 122:	ee2080e7          	jalr	-286(ra) # 0 <plines>
        printf("fork failed!");
 126:	00001517          	auipc	a0,0x1
 12a:	82a50513          	addi	a0,a0,-2006 # 950 <malloc+0xfa>
 12e:	00000097          	auipc	ra,0x0
 132:	66a080e7          	jalr	1642(ra) # 798 <printf>
        exit(1);
 136:	4505                	li	a0,1
 138:	00000097          	auipc	ra,0x0
 13c:	2e8080e7          	jalr	744(ra) # 420 <exit>
        printf("pipe failed!");
 140:	00001517          	auipc	a0,0x1
 144:	82050513          	addi	a0,a0,-2016 # 960 <malloc+0x10a>
 148:	00000097          	auipc	ra,0x0
 14c:	650080e7          	jalr	1616(ra) # 798 <printf>
        exit(0);
 150:	4501                	li	a0,0
 152:	00000097          	auipc	ra,0x0
 156:	2ce080e7          	jalr	718(ra) # 420 <exit>
        close(p[0]);
 15a:	fd842503          	lw	a0,-40(s0)
 15e:	00000097          	auipc	ra,0x0
 162:	2ea080e7          	jalr	746(ra) # 448 <close>
        while (num++<=35) {
 166:	4789                	li	a5,2
 168:	fcf42a23          	sw	a5,-44(s0)
 16c:	02300493          	li	s1,35
            write(p[1], &num, sizeof(num) );
 170:	4611                	li	a2,4
 172:	fd440593          	addi	a1,s0,-44
 176:	fdc42503          	lw	a0,-36(s0)
 17a:	00000097          	auipc	ra,0x0
 17e:	2c6080e7          	jalr	710(ra) # 440 <write>
        while (num++<=35) {
 182:	fd442783          	lw	a5,-44(s0)
 186:	0017871b          	addiw	a4,a5,1
 18a:	fce42a23          	sw	a4,-44(s0)
 18e:	fef4d1e3          	bge	s1,a5,170 <main+0x84>
        close(p[1]);
 192:	fdc42503          	lw	a0,-36(s0)
 196:	00000097          	auipc	ra,0x0
 19a:	2b2080e7          	jalr	690(ra) # 448 <close>
        wait(0);
 19e:	4501                	li	a0,0
 1a0:	00000097          	auipc	ra,0x0
 1a4:	288080e7          	jalr	648(ra) # 428 <wait>
    exit(0);
 1a8:	4501                	li	a0,0
 1aa:	00000097          	auipc	ra,0x0
 1ae:	276080e7          	jalr	630(ra) # 420 <exit>

00000000000001b2 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 1b2:	1141                	addi	sp,sp,-16
 1b4:	e422                	sd	s0,8(sp)
 1b6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b8:	87aa                	mv	a5,a0
 1ba:	0585                	addi	a1,a1,1
 1bc:	0785                	addi	a5,a5,1
 1be:	fff5c703          	lbu	a4,-1(a1)
 1c2:	fee78fa3          	sb	a4,-1(a5)
 1c6:	fb75                	bnez	a4,1ba <strcpy+0x8>
    ;
  return os;
}
 1c8:	6422                	ld	s0,8(sp)
 1ca:	0141                	addi	sp,sp,16
 1cc:	8082                	ret

00000000000001ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1ce:	1141                	addi	sp,sp,-16
 1d0:	e422                	sd	s0,8(sp)
 1d2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1d4:	00054783          	lbu	a5,0(a0)
 1d8:	cb91                	beqz	a5,1ec <strcmp+0x1e>
 1da:	0005c703          	lbu	a4,0(a1)
 1de:	00f71763          	bne	a4,a5,1ec <strcmp+0x1e>
    p++, q++;
 1e2:	0505                	addi	a0,a0,1
 1e4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1e6:	00054783          	lbu	a5,0(a0)
 1ea:	fbe5                	bnez	a5,1da <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1ec:	0005c503          	lbu	a0,0(a1)
}
 1f0:	40a7853b          	subw	a0,a5,a0
 1f4:	6422                	ld	s0,8(sp)
 1f6:	0141                	addi	sp,sp,16
 1f8:	8082                	ret

00000000000001fa <strlen>:

uint
strlen(const char *s)
{
 1fa:	1141                	addi	sp,sp,-16
 1fc:	e422                	sd	s0,8(sp)
 1fe:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 200:	00054783          	lbu	a5,0(a0)
 204:	cf91                	beqz	a5,220 <strlen+0x26>
 206:	0505                	addi	a0,a0,1
 208:	87aa                	mv	a5,a0
 20a:	4685                	li	a3,1
 20c:	9e89                	subw	a3,a3,a0
 20e:	00f6853b          	addw	a0,a3,a5
 212:	0785                	addi	a5,a5,1
 214:	fff7c703          	lbu	a4,-1(a5)
 218:	fb7d                	bnez	a4,20e <strlen+0x14>
    ;
  return n;
}
 21a:	6422                	ld	s0,8(sp)
 21c:	0141                	addi	sp,sp,16
 21e:	8082                	ret
  for(n = 0; s[n]; n++)
 220:	4501                	li	a0,0
 222:	bfe5                	j	21a <strlen+0x20>

0000000000000224 <memset>:

void*
memset(void *dst, int c, uint n)
{
 224:	1141                	addi	sp,sp,-16
 226:	e422                	sd	s0,8(sp)
 228:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 22a:	ca19                	beqz	a2,240 <memset+0x1c>
 22c:	87aa                	mv	a5,a0
 22e:	1602                	slli	a2,a2,0x20
 230:	9201                	srli	a2,a2,0x20
 232:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 236:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 23a:	0785                	addi	a5,a5,1
 23c:	fee79de3          	bne	a5,a4,236 <memset+0x12>
  }
  return dst;
}
 240:	6422                	ld	s0,8(sp)
 242:	0141                	addi	sp,sp,16
 244:	8082                	ret

0000000000000246 <strchr>:

char*
strchr(const char *s, char c)
{
 246:	1141                	addi	sp,sp,-16
 248:	e422                	sd	s0,8(sp)
 24a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 24c:	00054783          	lbu	a5,0(a0)
 250:	cb99                	beqz	a5,266 <strchr+0x20>
    if(*s == c)
 252:	00f58763          	beq	a1,a5,260 <strchr+0x1a>
  for(; *s; s++)
 256:	0505                	addi	a0,a0,1
 258:	00054783          	lbu	a5,0(a0)
 25c:	fbfd                	bnez	a5,252 <strchr+0xc>
      return (char*)s;
  return 0;
 25e:	4501                	li	a0,0
}
 260:	6422                	ld	s0,8(sp)
 262:	0141                	addi	sp,sp,16
 264:	8082                	ret
  return 0;
 266:	4501                	li	a0,0
 268:	bfe5                	j	260 <strchr+0x1a>

000000000000026a <gets>:

char*
gets(char *buf, int max)
{
 26a:	711d                	addi	sp,sp,-96
 26c:	ec86                	sd	ra,88(sp)
 26e:	e8a2                	sd	s0,80(sp)
 270:	e4a6                	sd	s1,72(sp)
 272:	e0ca                	sd	s2,64(sp)
 274:	fc4e                	sd	s3,56(sp)
 276:	f852                	sd	s4,48(sp)
 278:	f456                	sd	s5,40(sp)
 27a:	f05a                	sd	s6,32(sp)
 27c:	ec5e                	sd	s7,24(sp)
 27e:	1080                	addi	s0,sp,96
 280:	8baa                	mv	s7,a0
 282:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 284:	892a                	mv	s2,a0
 286:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 288:	4aa9                	li	s5,10
 28a:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 28c:	89a6                	mv	s3,s1
 28e:	2485                	addiw	s1,s1,1
 290:	0344d863          	bge	s1,s4,2c0 <gets+0x56>
    cc = read(0, &c, 1);
 294:	4605                	li	a2,1
 296:	faf40593          	addi	a1,s0,-81
 29a:	4501                	li	a0,0
 29c:	00000097          	auipc	ra,0x0
 2a0:	19c080e7          	jalr	412(ra) # 438 <read>
    if(cc < 1)
 2a4:	00a05e63          	blez	a0,2c0 <gets+0x56>
    buf[i++] = c;
 2a8:	faf44783          	lbu	a5,-81(s0)
 2ac:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2b0:	01578763          	beq	a5,s5,2be <gets+0x54>
 2b4:	0905                	addi	s2,s2,1
 2b6:	fd679be3          	bne	a5,s6,28c <gets+0x22>
  for(i=0; i+1 < max; ){
 2ba:	89a6                	mv	s3,s1
 2bc:	a011                	j	2c0 <gets+0x56>
 2be:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2c0:	99de                	add	s3,s3,s7
 2c2:	00098023          	sb	zero,0(s3)
  return buf;
}
 2c6:	855e                	mv	a0,s7
 2c8:	60e6                	ld	ra,88(sp)
 2ca:	6446                	ld	s0,80(sp)
 2cc:	64a6                	ld	s1,72(sp)
 2ce:	6906                	ld	s2,64(sp)
 2d0:	79e2                	ld	s3,56(sp)
 2d2:	7a42                	ld	s4,48(sp)
 2d4:	7aa2                	ld	s5,40(sp)
 2d6:	7b02                	ld	s6,32(sp)
 2d8:	6be2                	ld	s7,24(sp)
 2da:	6125                	addi	sp,sp,96
 2dc:	8082                	ret

00000000000002de <stat>:

int
stat(const char *n, struct stat *st)
{
 2de:	1101                	addi	sp,sp,-32
 2e0:	ec06                	sd	ra,24(sp)
 2e2:	e822                	sd	s0,16(sp)
 2e4:	e426                	sd	s1,8(sp)
 2e6:	e04a                	sd	s2,0(sp)
 2e8:	1000                	addi	s0,sp,32
 2ea:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ec:	4581                	li	a1,0
 2ee:	00000097          	auipc	ra,0x0
 2f2:	172080e7          	jalr	370(ra) # 460 <open>
  if(fd < 0)
 2f6:	02054563          	bltz	a0,320 <stat+0x42>
 2fa:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2fc:	85ca                	mv	a1,s2
 2fe:	00000097          	auipc	ra,0x0
 302:	17a080e7          	jalr	378(ra) # 478 <fstat>
 306:	892a                	mv	s2,a0
  close(fd);
 308:	8526                	mv	a0,s1
 30a:	00000097          	auipc	ra,0x0
 30e:	13e080e7          	jalr	318(ra) # 448 <close>
  return r;
}
 312:	854a                	mv	a0,s2
 314:	60e2                	ld	ra,24(sp)
 316:	6442                	ld	s0,16(sp)
 318:	64a2                	ld	s1,8(sp)
 31a:	6902                	ld	s2,0(sp)
 31c:	6105                	addi	sp,sp,32
 31e:	8082                	ret
    return -1;
 320:	597d                	li	s2,-1
 322:	bfc5                	j	312 <stat+0x34>

0000000000000324 <atoi>:

int
atoi(const char *s)
{
 324:	1141                	addi	sp,sp,-16
 326:	e422                	sd	s0,8(sp)
 328:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 32a:	00054603          	lbu	a2,0(a0)
 32e:	fd06079b          	addiw	a5,a2,-48
 332:	0ff7f793          	andi	a5,a5,255
 336:	4725                	li	a4,9
 338:	02f76963          	bltu	a4,a5,36a <atoi+0x46>
 33c:	86aa                	mv	a3,a0
  n = 0;
 33e:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 340:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 342:	0685                	addi	a3,a3,1
 344:	0025179b          	slliw	a5,a0,0x2
 348:	9fa9                	addw	a5,a5,a0
 34a:	0017979b          	slliw	a5,a5,0x1
 34e:	9fb1                	addw	a5,a5,a2
 350:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 354:	0006c603          	lbu	a2,0(a3)
 358:	fd06071b          	addiw	a4,a2,-48
 35c:	0ff77713          	andi	a4,a4,255
 360:	fee5f1e3          	bgeu	a1,a4,342 <atoi+0x1e>
  return n;
}
 364:	6422                	ld	s0,8(sp)
 366:	0141                	addi	sp,sp,16
 368:	8082                	ret
  n = 0;
 36a:	4501                	li	a0,0
 36c:	bfe5                	j	364 <atoi+0x40>

000000000000036e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 36e:	1141                	addi	sp,sp,-16
 370:	e422                	sd	s0,8(sp)
 372:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 374:	02b57463          	bgeu	a0,a1,39c <memmove+0x2e>
    while(n-- > 0)
 378:	00c05f63          	blez	a2,396 <memmove+0x28>
 37c:	1602                	slli	a2,a2,0x20
 37e:	9201                	srli	a2,a2,0x20
 380:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 384:	872a                	mv	a4,a0
      *dst++ = *src++;
 386:	0585                	addi	a1,a1,1
 388:	0705                	addi	a4,a4,1
 38a:	fff5c683          	lbu	a3,-1(a1)
 38e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 392:	fee79ae3          	bne	a5,a4,386 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 396:	6422                	ld	s0,8(sp)
 398:	0141                	addi	sp,sp,16
 39a:	8082                	ret
    dst += n;
 39c:	00c50733          	add	a4,a0,a2
    src += n;
 3a0:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3a2:	fec05ae3          	blez	a2,396 <memmove+0x28>
 3a6:	fff6079b          	addiw	a5,a2,-1
 3aa:	1782                	slli	a5,a5,0x20
 3ac:	9381                	srli	a5,a5,0x20
 3ae:	fff7c793          	not	a5,a5
 3b2:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3b4:	15fd                	addi	a1,a1,-1
 3b6:	177d                	addi	a4,a4,-1
 3b8:	0005c683          	lbu	a3,0(a1)
 3bc:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3c0:	fee79ae3          	bne	a5,a4,3b4 <memmove+0x46>
 3c4:	bfc9                	j	396 <memmove+0x28>

00000000000003c6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3c6:	1141                	addi	sp,sp,-16
 3c8:	e422                	sd	s0,8(sp)
 3ca:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3cc:	ca05                	beqz	a2,3fc <memcmp+0x36>
 3ce:	fff6069b          	addiw	a3,a2,-1
 3d2:	1682                	slli	a3,a3,0x20
 3d4:	9281                	srli	a3,a3,0x20
 3d6:	0685                	addi	a3,a3,1
 3d8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3da:	00054783          	lbu	a5,0(a0)
 3de:	0005c703          	lbu	a4,0(a1)
 3e2:	00e79863          	bne	a5,a4,3f2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3e6:	0505                	addi	a0,a0,1
    p2++;
 3e8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3ea:	fed518e3          	bne	a0,a3,3da <memcmp+0x14>
  }
  return 0;
 3ee:	4501                	li	a0,0
 3f0:	a019                	j	3f6 <memcmp+0x30>
      return *p1 - *p2;
 3f2:	40e7853b          	subw	a0,a5,a4
}
 3f6:	6422                	ld	s0,8(sp)
 3f8:	0141                	addi	sp,sp,16
 3fa:	8082                	ret
  return 0;
 3fc:	4501                	li	a0,0
 3fe:	bfe5                	j	3f6 <memcmp+0x30>

0000000000000400 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 400:	1141                	addi	sp,sp,-16
 402:	e406                	sd	ra,8(sp)
 404:	e022                	sd	s0,0(sp)
 406:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 408:	00000097          	auipc	ra,0x0
 40c:	f66080e7          	jalr	-154(ra) # 36e <memmove>
}
 410:	60a2                	ld	ra,8(sp)
 412:	6402                	ld	s0,0(sp)
 414:	0141                	addi	sp,sp,16
 416:	8082                	ret

0000000000000418 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 418:	4885                	li	a7,1
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <exit>:
.global exit
exit:
 li a7, SYS_exit
 420:	4889                	li	a7,2
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <wait>:
.global wait
wait:
 li a7, SYS_wait
 428:	488d                	li	a7,3
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 430:	4891                	li	a7,4
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <read>:
.global read
read:
 li a7, SYS_read
 438:	4895                	li	a7,5
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <write>:
.global write
write:
 li a7, SYS_write
 440:	48c1                	li	a7,16
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <close>:
.global close
close:
 li a7, SYS_close
 448:	48d5                	li	a7,21
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <kill>:
.global kill
kill:
 li a7, SYS_kill
 450:	4899                	li	a7,6
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <exec>:
.global exec
exec:
 li a7, SYS_exec
 458:	489d                	li	a7,7
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <open>:
.global open
open:
 li a7, SYS_open
 460:	48bd                	li	a7,15
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 468:	48c5                	li	a7,17
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 470:	48c9                	li	a7,18
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 478:	48a1                	li	a7,8
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <link>:
.global link
link:
 li a7, SYS_link
 480:	48cd                	li	a7,19
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 488:	48d1                	li	a7,20
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 490:	48a5                	li	a7,9
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <dup>:
.global dup
dup:
 li a7, SYS_dup
 498:	48a9                	li	a7,10
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4a0:	48ad                	li	a7,11
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4a8:	48b1                	li	a7,12
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4b0:	48b5                	li	a7,13
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4b8:	48b9                	li	a7,14
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4c0:	1101                	addi	sp,sp,-32
 4c2:	ec06                	sd	ra,24(sp)
 4c4:	e822                	sd	s0,16(sp)
 4c6:	1000                	addi	s0,sp,32
 4c8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4cc:	4605                	li	a2,1
 4ce:	fef40593          	addi	a1,s0,-17
 4d2:	00000097          	auipc	ra,0x0
 4d6:	f6e080e7          	jalr	-146(ra) # 440 <write>
}
 4da:	60e2                	ld	ra,24(sp)
 4dc:	6442                	ld	s0,16(sp)
 4de:	6105                	addi	sp,sp,32
 4e0:	8082                	ret

00000000000004e2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e2:	7139                	addi	sp,sp,-64
 4e4:	fc06                	sd	ra,56(sp)
 4e6:	f822                	sd	s0,48(sp)
 4e8:	f426                	sd	s1,40(sp)
 4ea:	f04a                	sd	s2,32(sp)
 4ec:	ec4e                	sd	s3,24(sp)
 4ee:	0080                	addi	s0,sp,64
 4f0:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f2:	c299                	beqz	a3,4f8 <printint+0x16>
 4f4:	0805c863          	bltz	a1,584 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4f8:	2581                	sext.w	a1,a1
  neg = 0;
 4fa:	4881                	li	a7,0
 4fc:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 500:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 502:	2601                	sext.w	a2,a2
 504:	00000517          	auipc	a0,0x0
 508:	47450513          	addi	a0,a0,1140 # 978 <digits>
 50c:	883a                	mv	a6,a4
 50e:	2705                	addiw	a4,a4,1
 510:	02c5f7bb          	remuw	a5,a1,a2
 514:	1782                	slli	a5,a5,0x20
 516:	9381                	srli	a5,a5,0x20
 518:	97aa                	add	a5,a5,a0
 51a:	0007c783          	lbu	a5,0(a5)
 51e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 522:	0005879b          	sext.w	a5,a1
 526:	02c5d5bb          	divuw	a1,a1,a2
 52a:	0685                	addi	a3,a3,1
 52c:	fec7f0e3          	bgeu	a5,a2,50c <printint+0x2a>
  if(neg)
 530:	00088b63          	beqz	a7,546 <printint+0x64>
    buf[i++] = '-';
 534:	fd040793          	addi	a5,s0,-48
 538:	973e                	add	a4,a4,a5
 53a:	02d00793          	li	a5,45
 53e:	fef70823          	sb	a5,-16(a4)
 542:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 546:	02e05863          	blez	a4,576 <printint+0x94>
 54a:	fc040793          	addi	a5,s0,-64
 54e:	00e78933          	add	s2,a5,a4
 552:	fff78993          	addi	s3,a5,-1
 556:	99ba                	add	s3,s3,a4
 558:	377d                	addiw	a4,a4,-1
 55a:	1702                	slli	a4,a4,0x20
 55c:	9301                	srli	a4,a4,0x20
 55e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 562:	fff94583          	lbu	a1,-1(s2)
 566:	8526                	mv	a0,s1
 568:	00000097          	auipc	ra,0x0
 56c:	f58080e7          	jalr	-168(ra) # 4c0 <putc>
  while(--i >= 0)
 570:	197d                	addi	s2,s2,-1
 572:	ff3918e3          	bne	s2,s3,562 <printint+0x80>
}
 576:	70e2                	ld	ra,56(sp)
 578:	7442                	ld	s0,48(sp)
 57a:	74a2                	ld	s1,40(sp)
 57c:	7902                	ld	s2,32(sp)
 57e:	69e2                	ld	s3,24(sp)
 580:	6121                	addi	sp,sp,64
 582:	8082                	ret
    x = -xx;
 584:	40b005bb          	negw	a1,a1
    neg = 1;
 588:	4885                	li	a7,1
    x = -xx;
 58a:	bf8d                	j	4fc <printint+0x1a>

000000000000058c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 58c:	7119                	addi	sp,sp,-128
 58e:	fc86                	sd	ra,120(sp)
 590:	f8a2                	sd	s0,112(sp)
 592:	f4a6                	sd	s1,104(sp)
 594:	f0ca                	sd	s2,96(sp)
 596:	ecce                	sd	s3,88(sp)
 598:	e8d2                	sd	s4,80(sp)
 59a:	e4d6                	sd	s5,72(sp)
 59c:	e0da                	sd	s6,64(sp)
 59e:	fc5e                	sd	s7,56(sp)
 5a0:	f862                	sd	s8,48(sp)
 5a2:	f466                	sd	s9,40(sp)
 5a4:	f06a                	sd	s10,32(sp)
 5a6:	ec6e                	sd	s11,24(sp)
 5a8:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5aa:	0005c903          	lbu	s2,0(a1)
 5ae:	18090f63          	beqz	s2,74c <vprintf+0x1c0>
 5b2:	8aaa                	mv	s5,a0
 5b4:	8b32                	mv	s6,a2
 5b6:	00158493          	addi	s1,a1,1
  state = 0;
 5ba:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5bc:	02500a13          	li	s4,37
      if(c == 'd'){
 5c0:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5c4:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5c8:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5cc:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5d0:	00000b97          	auipc	s7,0x0
 5d4:	3a8b8b93          	addi	s7,s7,936 # 978 <digits>
 5d8:	a839                	j	5f6 <vprintf+0x6a>
        putc(fd, c);
 5da:	85ca                	mv	a1,s2
 5dc:	8556                	mv	a0,s5
 5de:	00000097          	auipc	ra,0x0
 5e2:	ee2080e7          	jalr	-286(ra) # 4c0 <putc>
 5e6:	a019                	j	5ec <vprintf+0x60>
    } else if(state == '%'){
 5e8:	01498f63          	beq	s3,s4,606 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5ec:	0485                	addi	s1,s1,1
 5ee:	fff4c903          	lbu	s2,-1(s1)
 5f2:	14090d63          	beqz	s2,74c <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5f6:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5fa:	fe0997e3          	bnez	s3,5e8 <vprintf+0x5c>
      if(c == '%'){
 5fe:	fd479ee3          	bne	a5,s4,5da <vprintf+0x4e>
        state = '%';
 602:	89be                	mv	s3,a5
 604:	b7e5                	j	5ec <vprintf+0x60>
      if(c == 'd'){
 606:	05878063          	beq	a5,s8,646 <vprintf+0xba>
      } else if(c == 'l') {
 60a:	05978c63          	beq	a5,s9,662 <vprintf+0xd6>
      } else if(c == 'x') {
 60e:	07a78863          	beq	a5,s10,67e <vprintf+0xf2>
      } else if(c == 'p') {
 612:	09b78463          	beq	a5,s11,69a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 616:	07300713          	li	a4,115
 61a:	0ce78663          	beq	a5,a4,6e6 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 61e:	06300713          	li	a4,99
 622:	0ee78e63          	beq	a5,a4,71e <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 626:	11478863          	beq	a5,s4,736 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 62a:	85d2                	mv	a1,s4
 62c:	8556                	mv	a0,s5
 62e:	00000097          	auipc	ra,0x0
 632:	e92080e7          	jalr	-366(ra) # 4c0 <putc>
        putc(fd, c);
 636:	85ca                	mv	a1,s2
 638:	8556                	mv	a0,s5
 63a:	00000097          	auipc	ra,0x0
 63e:	e86080e7          	jalr	-378(ra) # 4c0 <putc>
      }
      state = 0;
 642:	4981                	li	s3,0
 644:	b765                	j	5ec <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 646:	008b0913          	addi	s2,s6,8
 64a:	4685                	li	a3,1
 64c:	4629                	li	a2,10
 64e:	000b2583          	lw	a1,0(s6)
 652:	8556                	mv	a0,s5
 654:	00000097          	auipc	ra,0x0
 658:	e8e080e7          	jalr	-370(ra) # 4e2 <printint>
 65c:	8b4a                	mv	s6,s2
      state = 0;
 65e:	4981                	li	s3,0
 660:	b771                	j	5ec <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 662:	008b0913          	addi	s2,s6,8
 666:	4681                	li	a3,0
 668:	4629                	li	a2,10
 66a:	000b2583          	lw	a1,0(s6)
 66e:	8556                	mv	a0,s5
 670:	00000097          	auipc	ra,0x0
 674:	e72080e7          	jalr	-398(ra) # 4e2 <printint>
 678:	8b4a                	mv	s6,s2
      state = 0;
 67a:	4981                	li	s3,0
 67c:	bf85                	j	5ec <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 67e:	008b0913          	addi	s2,s6,8
 682:	4681                	li	a3,0
 684:	4641                	li	a2,16
 686:	000b2583          	lw	a1,0(s6)
 68a:	8556                	mv	a0,s5
 68c:	00000097          	auipc	ra,0x0
 690:	e56080e7          	jalr	-426(ra) # 4e2 <printint>
 694:	8b4a                	mv	s6,s2
      state = 0;
 696:	4981                	li	s3,0
 698:	bf91                	j	5ec <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 69a:	008b0793          	addi	a5,s6,8
 69e:	f8f43423          	sd	a5,-120(s0)
 6a2:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6a6:	03000593          	li	a1,48
 6aa:	8556                	mv	a0,s5
 6ac:	00000097          	auipc	ra,0x0
 6b0:	e14080e7          	jalr	-492(ra) # 4c0 <putc>
  putc(fd, 'x');
 6b4:	85ea                	mv	a1,s10
 6b6:	8556                	mv	a0,s5
 6b8:	00000097          	auipc	ra,0x0
 6bc:	e08080e7          	jalr	-504(ra) # 4c0 <putc>
 6c0:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6c2:	03c9d793          	srli	a5,s3,0x3c
 6c6:	97de                	add	a5,a5,s7
 6c8:	0007c583          	lbu	a1,0(a5)
 6cc:	8556                	mv	a0,s5
 6ce:	00000097          	auipc	ra,0x0
 6d2:	df2080e7          	jalr	-526(ra) # 4c0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6d6:	0992                	slli	s3,s3,0x4
 6d8:	397d                	addiw	s2,s2,-1
 6da:	fe0914e3          	bnez	s2,6c2 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6de:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6e2:	4981                	li	s3,0
 6e4:	b721                	j	5ec <vprintf+0x60>
        s = va_arg(ap, char*);
 6e6:	008b0993          	addi	s3,s6,8
 6ea:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6ee:	02090163          	beqz	s2,710 <vprintf+0x184>
        while(*s != 0){
 6f2:	00094583          	lbu	a1,0(s2)
 6f6:	c9a1                	beqz	a1,746 <vprintf+0x1ba>
          putc(fd, *s);
 6f8:	8556                	mv	a0,s5
 6fa:	00000097          	auipc	ra,0x0
 6fe:	dc6080e7          	jalr	-570(ra) # 4c0 <putc>
          s++;
 702:	0905                	addi	s2,s2,1
        while(*s != 0){
 704:	00094583          	lbu	a1,0(s2)
 708:	f9e5                	bnez	a1,6f8 <vprintf+0x16c>
        s = va_arg(ap, char*);
 70a:	8b4e                	mv	s6,s3
      state = 0;
 70c:	4981                	li	s3,0
 70e:	bdf9                	j	5ec <vprintf+0x60>
          s = "(null)";
 710:	00000917          	auipc	s2,0x0
 714:	26090913          	addi	s2,s2,608 # 970 <malloc+0x11a>
        while(*s != 0){
 718:	02800593          	li	a1,40
 71c:	bff1                	j	6f8 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 71e:	008b0913          	addi	s2,s6,8
 722:	000b4583          	lbu	a1,0(s6)
 726:	8556                	mv	a0,s5
 728:	00000097          	auipc	ra,0x0
 72c:	d98080e7          	jalr	-616(ra) # 4c0 <putc>
 730:	8b4a                	mv	s6,s2
      state = 0;
 732:	4981                	li	s3,0
 734:	bd65                	j	5ec <vprintf+0x60>
        putc(fd, c);
 736:	85d2                	mv	a1,s4
 738:	8556                	mv	a0,s5
 73a:	00000097          	auipc	ra,0x0
 73e:	d86080e7          	jalr	-634(ra) # 4c0 <putc>
      state = 0;
 742:	4981                	li	s3,0
 744:	b565                	j	5ec <vprintf+0x60>
        s = va_arg(ap, char*);
 746:	8b4e                	mv	s6,s3
      state = 0;
 748:	4981                	li	s3,0
 74a:	b54d                	j	5ec <vprintf+0x60>
    }
  }
}
 74c:	70e6                	ld	ra,120(sp)
 74e:	7446                	ld	s0,112(sp)
 750:	74a6                	ld	s1,104(sp)
 752:	7906                	ld	s2,96(sp)
 754:	69e6                	ld	s3,88(sp)
 756:	6a46                	ld	s4,80(sp)
 758:	6aa6                	ld	s5,72(sp)
 75a:	6b06                	ld	s6,64(sp)
 75c:	7be2                	ld	s7,56(sp)
 75e:	7c42                	ld	s8,48(sp)
 760:	7ca2                	ld	s9,40(sp)
 762:	7d02                	ld	s10,32(sp)
 764:	6de2                	ld	s11,24(sp)
 766:	6109                	addi	sp,sp,128
 768:	8082                	ret

000000000000076a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 76a:	715d                	addi	sp,sp,-80
 76c:	ec06                	sd	ra,24(sp)
 76e:	e822                	sd	s0,16(sp)
 770:	1000                	addi	s0,sp,32
 772:	e010                	sd	a2,0(s0)
 774:	e414                	sd	a3,8(s0)
 776:	e818                	sd	a4,16(s0)
 778:	ec1c                	sd	a5,24(s0)
 77a:	03043023          	sd	a6,32(s0)
 77e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 782:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 786:	8622                	mv	a2,s0
 788:	00000097          	auipc	ra,0x0
 78c:	e04080e7          	jalr	-508(ra) # 58c <vprintf>
}
 790:	60e2                	ld	ra,24(sp)
 792:	6442                	ld	s0,16(sp)
 794:	6161                	addi	sp,sp,80
 796:	8082                	ret

0000000000000798 <printf>:

void
printf(const char *fmt, ...)
{
 798:	711d                	addi	sp,sp,-96
 79a:	ec06                	sd	ra,24(sp)
 79c:	e822                	sd	s0,16(sp)
 79e:	1000                	addi	s0,sp,32
 7a0:	e40c                	sd	a1,8(s0)
 7a2:	e810                	sd	a2,16(s0)
 7a4:	ec14                	sd	a3,24(s0)
 7a6:	f018                	sd	a4,32(s0)
 7a8:	f41c                	sd	a5,40(s0)
 7aa:	03043823          	sd	a6,48(s0)
 7ae:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7b2:	00840613          	addi	a2,s0,8
 7b6:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7ba:	85aa                	mv	a1,a0
 7bc:	4505                	li	a0,1
 7be:	00000097          	auipc	ra,0x0
 7c2:	dce080e7          	jalr	-562(ra) # 58c <vprintf>
}
 7c6:	60e2                	ld	ra,24(sp)
 7c8:	6442                	ld	s0,16(sp)
 7ca:	6125                	addi	sp,sp,96
 7cc:	8082                	ret

00000000000007ce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ce:	1141                	addi	sp,sp,-16
 7d0:	e422                	sd	s0,8(sp)
 7d2:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d4:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d8:	00000797          	auipc	a5,0x0
 7dc:	1b87b783          	ld	a5,440(a5) # 990 <freep>
 7e0:	a805                	j	810 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7e2:	4618                	lw	a4,8(a2)
 7e4:	9db9                	addw	a1,a1,a4
 7e6:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ea:	6398                	ld	a4,0(a5)
 7ec:	6318                	ld	a4,0(a4)
 7ee:	fee53823          	sd	a4,-16(a0)
 7f2:	a091                	j	836 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7f4:	ff852703          	lw	a4,-8(a0)
 7f8:	9e39                	addw	a2,a2,a4
 7fa:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7fc:	ff053703          	ld	a4,-16(a0)
 800:	e398                	sd	a4,0(a5)
 802:	a099                	j	848 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 804:	6398                	ld	a4,0(a5)
 806:	00e7e463          	bltu	a5,a4,80e <free+0x40>
 80a:	00e6ea63          	bltu	a3,a4,81e <free+0x50>
{
 80e:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 810:	fed7fae3          	bgeu	a5,a3,804 <free+0x36>
 814:	6398                	ld	a4,0(a5)
 816:	00e6e463          	bltu	a3,a4,81e <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81a:	fee7eae3          	bltu	a5,a4,80e <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 81e:	ff852583          	lw	a1,-8(a0)
 822:	6390                	ld	a2,0(a5)
 824:	02059713          	slli	a4,a1,0x20
 828:	9301                	srli	a4,a4,0x20
 82a:	0712                	slli	a4,a4,0x4
 82c:	9736                	add	a4,a4,a3
 82e:	fae60ae3          	beq	a2,a4,7e2 <free+0x14>
    bp->s.ptr = p->s.ptr;
 832:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 836:	4790                	lw	a2,8(a5)
 838:	02061713          	slli	a4,a2,0x20
 83c:	9301                	srli	a4,a4,0x20
 83e:	0712                	slli	a4,a4,0x4
 840:	973e                	add	a4,a4,a5
 842:	fae689e3          	beq	a3,a4,7f4 <free+0x26>
  } else
    p->s.ptr = bp;
 846:	e394                	sd	a3,0(a5)
  freep = p;
 848:	00000717          	auipc	a4,0x0
 84c:	14f73423          	sd	a5,328(a4) # 990 <freep>
}
 850:	6422                	ld	s0,8(sp)
 852:	0141                	addi	sp,sp,16
 854:	8082                	ret

0000000000000856 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 856:	7139                	addi	sp,sp,-64
 858:	fc06                	sd	ra,56(sp)
 85a:	f822                	sd	s0,48(sp)
 85c:	f426                	sd	s1,40(sp)
 85e:	f04a                	sd	s2,32(sp)
 860:	ec4e                	sd	s3,24(sp)
 862:	e852                	sd	s4,16(sp)
 864:	e456                	sd	s5,8(sp)
 866:	e05a                	sd	s6,0(sp)
 868:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86a:	02051493          	slli	s1,a0,0x20
 86e:	9081                	srli	s1,s1,0x20
 870:	04bd                	addi	s1,s1,15
 872:	8091                	srli	s1,s1,0x4
 874:	0014899b          	addiw	s3,s1,1
 878:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 87a:	00000517          	auipc	a0,0x0
 87e:	11653503          	ld	a0,278(a0) # 990 <freep>
 882:	c515                	beqz	a0,8ae <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 884:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 886:	4798                	lw	a4,8(a5)
 888:	02977f63          	bgeu	a4,s1,8c6 <malloc+0x70>
 88c:	8a4e                	mv	s4,s3
 88e:	0009871b          	sext.w	a4,s3
 892:	6685                	lui	a3,0x1
 894:	00d77363          	bgeu	a4,a3,89a <malloc+0x44>
 898:	6a05                	lui	s4,0x1
 89a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 89e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a2:	00000917          	auipc	s2,0x0
 8a6:	0ee90913          	addi	s2,s2,238 # 990 <freep>
  if(p == (char*)-1)
 8aa:	5afd                	li	s5,-1
 8ac:	a88d                	j	91e <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8ae:	00000797          	auipc	a5,0x0
 8b2:	0ea78793          	addi	a5,a5,234 # 998 <base>
 8b6:	00000717          	auipc	a4,0x0
 8ba:	0cf73d23          	sd	a5,218(a4) # 990 <freep>
 8be:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8c0:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8c4:	b7e1                	j	88c <malloc+0x36>
      if(p->s.size == nunits)
 8c6:	02e48b63          	beq	s1,a4,8fc <malloc+0xa6>
        p->s.size -= nunits;
 8ca:	4137073b          	subw	a4,a4,s3
 8ce:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8d0:	1702                	slli	a4,a4,0x20
 8d2:	9301                	srli	a4,a4,0x20
 8d4:	0712                	slli	a4,a4,0x4
 8d6:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8d8:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8dc:	00000717          	auipc	a4,0x0
 8e0:	0aa73a23          	sd	a0,180(a4) # 990 <freep>
      return (void*)(p + 1);
 8e4:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e8:	70e2                	ld	ra,56(sp)
 8ea:	7442                	ld	s0,48(sp)
 8ec:	74a2                	ld	s1,40(sp)
 8ee:	7902                	ld	s2,32(sp)
 8f0:	69e2                	ld	s3,24(sp)
 8f2:	6a42                	ld	s4,16(sp)
 8f4:	6aa2                	ld	s5,8(sp)
 8f6:	6b02                	ld	s6,0(sp)
 8f8:	6121                	addi	sp,sp,64
 8fa:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8fc:	6398                	ld	a4,0(a5)
 8fe:	e118                	sd	a4,0(a0)
 900:	bff1                	j	8dc <malloc+0x86>
  hp->s.size = nu;
 902:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 906:	0541                	addi	a0,a0,16
 908:	00000097          	auipc	ra,0x0
 90c:	ec6080e7          	jalr	-314(ra) # 7ce <free>
  return freep;
 910:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 914:	d971                	beqz	a0,8e8 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 916:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 918:	4798                	lw	a4,8(a5)
 91a:	fa9776e3          	bgeu	a4,s1,8c6 <malloc+0x70>
    if(p == freep)
 91e:	00093703          	ld	a4,0(s2)
 922:	853e                	mv	a0,a5
 924:	fef719e3          	bne	a4,a5,916 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 928:	8552                	mv	a0,s4
 92a:	00000097          	auipc	ra,0x0
 92e:	b7e080e7          	jalr	-1154(ra) # 4a8 <sbrk>
  if(p == (char*)-1)
 932:	fd5518e3          	bne	a0,s5,902 <malloc+0xac>
        return 0;
 936:	4501                	li	a0,0
 938:	bf45                	j	8e8 <malloc+0x92>
