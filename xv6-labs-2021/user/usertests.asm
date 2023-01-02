
user/_usertests:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <copyinstr1>:
}

// what if you pass ridiculous string pointers to system calls?
void
copyinstr1(char *s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };

  for(int ai = 0; ai < 2; ai++){
    uint64 addr = addrs[ai];

    int fd = open((char *)addr, O_CREATE|O_WRONLY);
       8:	20100593          	li	a1,513
       c:	4505                	li	a0,1
       e:	057e                	slli	a0,a0,0x1f
      10:	00006097          	auipc	ra,0x6
      14:	878080e7          	jalr	-1928(ra) # 5888 <open>
    if(fd >= 0){
      18:	02055063          	bgez	a0,38 <copyinstr1+0x38>
    int fd = open((char *)addr, O_CREATE|O_WRONLY);
      1c:	20100593          	li	a1,513
      20:	557d                	li	a0,-1
      22:	00006097          	auipc	ra,0x6
      26:	866080e7          	jalr	-1946(ra) # 5888 <open>
    uint64 addr = addrs[ai];
      2a:	55fd                	li	a1,-1
    if(fd >= 0){
      2c:	00055863          	bgez	a0,3c <copyinstr1+0x3c>
      printf("open(%p) returned %d, not -1\n", addr, fd);
      exit(1);
    }
  }
}
      30:	60a2                	ld	ra,8(sp)
      32:	6402                	ld	s0,0(sp)
      34:	0141                	addi	sp,sp,16
      36:	8082                	ret
    uint64 addr = addrs[ai];
      38:	4585                	li	a1,1
      3a:	05fe                	slli	a1,a1,0x1f
      printf("open(%p) returned %d, not -1\n", addr, fd);
      3c:	862a                	mv	a2,a0
      3e:	00006517          	auipc	a0,0x6
      42:	08a50513          	addi	a0,a0,138 # 60c8 <malloc+0x44a>
      46:	00006097          	auipc	ra,0x6
      4a:	b7a080e7          	jalr	-1158(ra) # 5bc0 <printf>
      exit(1);
      4e:	4505                	li	a0,1
      50:	00005097          	auipc	ra,0x5
      54:	7f8080e7          	jalr	2040(ra) # 5848 <exit>

0000000000000058 <bsstest>:
void
bsstest(char *s)
{
  int i;

  for(i = 0; i < sizeof(uninit); i++){
      58:	00009797          	auipc	a5,0x9
      5c:	62078793          	addi	a5,a5,1568 # 9678 <uninit>
      60:	0000c697          	auipc	a3,0xc
      64:	d2868693          	addi	a3,a3,-728 # bd88 <buf>
    if(uninit[i] != '\0'){
      68:	0007c703          	lbu	a4,0(a5)
      6c:	e709                	bnez	a4,76 <bsstest+0x1e>
  for(i = 0; i < sizeof(uninit); i++){
      6e:	0785                	addi	a5,a5,1
      70:	fed79ce3          	bne	a5,a3,68 <bsstest+0x10>
      74:	8082                	ret
{
      76:	1141                	addi	sp,sp,-16
      78:	e406                	sd	ra,8(sp)
      7a:	e022                	sd	s0,0(sp)
      7c:	0800                	addi	s0,sp,16
      printf("%s: bss test failed\n", s);
      7e:	85aa                	mv	a1,a0
      80:	00006517          	auipc	a0,0x6
      84:	06850513          	addi	a0,a0,104 # 60e8 <malloc+0x46a>
      88:	00006097          	auipc	ra,0x6
      8c:	b38080e7          	jalr	-1224(ra) # 5bc0 <printf>
      exit(1);
      90:	4505                	li	a0,1
      92:	00005097          	auipc	ra,0x5
      96:	7b6080e7          	jalr	1974(ra) # 5848 <exit>

000000000000009a <opentest>:
{
      9a:	1101                	addi	sp,sp,-32
      9c:	ec06                	sd	ra,24(sp)
      9e:	e822                	sd	s0,16(sp)
      a0:	e426                	sd	s1,8(sp)
      a2:	1000                	addi	s0,sp,32
      a4:	84aa                	mv	s1,a0
  fd = open("echo", 0);
      a6:	4581                	li	a1,0
      a8:	00006517          	auipc	a0,0x6
      ac:	05850513          	addi	a0,a0,88 # 6100 <malloc+0x482>
      b0:	00005097          	auipc	ra,0x5
      b4:	7d8080e7          	jalr	2008(ra) # 5888 <open>
  if(fd < 0){
      b8:	02054663          	bltz	a0,e4 <opentest+0x4a>
  close(fd);
      bc:	00005097          	auipc	ra,0x5
      c0:	7b4080e7          	jalr	1972(ra) # 5870 <close>
  fd = open("doesnotexist", 0);
      c4:	4581                	li	a1,0
      c6:	00006517          	auipc	a0,0x6
      ca:	05a50513          	addi	a0,a0,90 # 6120 <malloc+0x4a2>
      ce:	00005097          	auipc	ra,0x5
      d2:	7ba080e7          	jalr	1978(ra) # 5888 <open>
  if(fd >= 0){
      d6:	02055563          	bgez	a0,100 <opentest+0x66>
}
      da:	60e2                	ld	ra,24(sp)
      dc:	6442                	ld	s0,16(sp)
      de:	64a2                	ld	s1,8(sp)
      e0:	6105                	addi	sp,sp,32
      e2:	8082                	ret
    printf("%s: open echo failed!\n", s);
      e4:	85a6                	mv	a1,s1
      e6:	00006517          	auipc	a0,0x6
      ea:	02250513          	addi	a0,a0,34 # 6108 <malloc+0x48a>
      ee:	00006097          	auipc	ra,0x6
      f2:	ad2080e7          	jalr	-1326(ra) # 5bc0 <printf>
    exit(1);
      f6:	4505                	li	a0,1
      f8:	00005097          	auipc	ra,0x5
      fc:	750080e7          	jalr	1872(ra) # 5848 <exit>
    printf("%s: open doesnotexist succeeded!\n", s);
     100:	85a6                	mv	a1,s1
     102:	00006517          	auipc	a0,0x6
     106:	02e50513          	addi	a0,a0,46 # 6130 <malloc+0x4b2>
     10a:	00006097          	auipc	ra,0x6
     10e:	ab6080e7          	jalr	-1354(ra) # 5bc0 <printf>
    exit(1);
     112:	4505                	li	a0,1
     114:	00005097          	auipc	ra,0x5
     118:	734080e7          	jalr	1844(ra) # 5848 <exit>

000000000000011c <truncate2>:
{
     11c:	7179                	addi	sp,sp,-48
     11e:	f406                	sd	ra,40(sp)
     120:	f022                	sd	s0,32(sp)
     122:	ec26                	sd	s1,24(sp)
     124:	e84a                	sd	s2,16(sp)
     126:	e44e                	sd	s3,8(sp)
     128:	1800                	addi	s0,sp,48
     12a:	89aa                	mv	s3,a0
  unlink("truncfile");
     12c:	00006517          	auipc	a0,0x6
     130:	02c50513          	addi	a0,a0,44 # 6158 <malloc+0x4da>
     134:	00005097          	auipc	ra,0x5
     138:	764080e7          	jalr	1892(ra) # 5898 <unlink>
  int fd1 = open("truncfile", O_CREATE|O_TRUNC|O_WRONLY);
     13c:	60100593          	li	a1,1537
     140:	00006517          	auipc	a0,0x6
     144:	01850513          	addi	a0,a0,24 # 6158 <malloc+0x4da>
     148:	00005097          	auipc	ra,0x5
     14c:	740080e7          	jalr	1856(ra) # 5888 <open>
     150:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     152:	4611                	li	a2,4
     154:	00006597          	auipc	a1,0x6
     158:	01458593          	addi	a1,a1,20 # 6168 <malloc+0x4ea>
     15c:	00005097          	auipc	ra,0x5
     160:	70c080e7          	jalr	1804(ra) # 5868 <write>
  int fd2 = open("truncfile", O_TRUNC|O_WRONLY);
     164:	40100593          	li	a1,1025
     168:	00006517          	auipc	a0,0x6
     16c:	ff050513          	addi	a0,a0,-16 # 6158 <malloc+0x4da>
     170:	00005097          	auipc	ra,0x5
     174:	718080e7          	jalr	1816(ra) # 5888 <open>
     178:	892a                	mv	s2,a0
  int n = write(fd1, "x", 1);
     17a:	4605                	li	a2,1
     17c:	00006597          	auipc	a1,0x6
     180:	ff458593          	addi	a1,a1,-12 # 6170 <malloc+0x4f2>
     184:	8526                	mv	a0,s1
     186:	00005097          	auipc	ra,0x5
     18a:	6e2080e7          	jalr	1762(ra) # 5868 <write>
  if(n != -1){
     18e:	57fd                	li	a5,-1
     190:	02f51b63          	bne	a0,a5,1c6 <truncate2+0xaa>
  unlink("truncfile");
     194:	00006517          	auipc	a0,0x6
     198:	fc450513          	addi	a0,a0,-60 # 6158 <malloc+0x4da>
     19c:	00005097          	auipc	ra,0x5
     1a0:	6fc080e7          	jalr	1788(ra) # 5898 <unlink>
  close(fd1);
     1a4:	8526                	mv	a0,s1
     1a6:	00005097          	auipc	ra,0x5
     1aa:	6ca080e7          	jalr	1738(ra) # 5870 <close>
  close(fd2);
     1ae:	854a                	mv	a0,s2
     1b0:	00005097          	auipc	ra,0x5
     1b4:	6c0080e7          	jalr	1728(ra) # 5870 <close>
}
     1b8:	70a2                	ld	ra,40(sp)
     1ba:	7402                	ld	s0,32(sp)
     1bc:	64e2                	ld	s1,24(sp)
     1be:	6942                	ld	s2,16(sp)
     1c0:	69a2                	ld	s3,8(sp)
     1c2:	6145                	addi	sp,sp,48
     1c4:	8082                	ret
    printf("%s: write returned %d, expected -1\n", s, n);
     1c6:	862a                	mv	a2,a0
     1c8:	85ce                	mv	a1,s3
     1ca:	00006517          	auipc	a0,0x6
     1ce:	fae50513          	addi	a0,a0,-82 # 6178 <malloc+0x4fa>
     1d2:	00006097          	auipc	ra,0x6
     1d6:	9ee080e7          	jalr	-1554(ra) # 5bc0 <printf>
    exit(1);
     1da:	4505                	li	a0,1
     1dc:	00005097          	auipc	ra,0x5
     1e0:	66c080e7          	jalr	1644(ra) # 5848 <exit>

00000000000001e4 <createtest>:
{
     1e4:	7179                	addi	sp,sp,-48
     1e6:	f406                	sd	ra,40(sp)
     1e8:	f022                	sd	s0,32(sp)
     1ea:	ec26                	sd	s1,24(sp)
     1ec:	e84a                	sd	s2,16(sp)
     1ee:	1800                	addi	s0,sp,48
  name[0] = 'a';
     1f0:	06100793          	li	a5,97
     1f4:	fcf40c23          	sb	a5,-40(s0)
  name[2] = '\0';
     1f8:	fc040d23          	sb	zero,-38(s0)
     1fc:	03000493          	li	s1,48
  for(i = 0; i < N; i++){
     200:	06400913          	li	s2,100
    name[1] = '0' + i;
     204:	fc940ca3          	sb	s1,-39(s0)
    fd = open(name, O_CREATE|O_RDWR);
     208:	20200593          	li	a1,514
     20c:	fd840513          	addi	a0,s0,-40
     210:	00005097          	auipc	ra,0x5
     214:	678080e7          	jalr	1656(ra) # 5888 <open>
    close(fd);
     218:	00005097          	auipc	ra,0x5
     21c:	658080e7          	jalr	1624(ra) # 5870 <close>
  for(i = 0; i < N; i++){
     220:	2485                	addiw	s1,s1,1
     222:	0ff4f493          	andi	s1,s1,255
     226:	fd249fe3          	bne	s1,s2,204 <createtest+0x20>
  name[0] = 'a';
     22a:	06100793          	li	a5,97
     22e:	fcf40c23          	sb	a5,-40(s0)
  name[2] = '\0';
     232:	fc040d23          	sb	zero,-38(s0)
     236:	03000493          	li	s1,48
  for(i = 0; i < N; i++){
     23a:	06400913          	li	s2,100
    name[1] = '0' + i;
     23e:	fc940ca3          	sb	s1,-39(s0)
    unlink(name);
     242:	fd840513          	addi	a0,s0,-40
     246:	00005097          	auipc	ra,0x5
     24a:	652080e7          	jalr	1618(ra) # 5898 <unlink>
  for(i = 0; i < N; i++){
     24e:	2485                	addiw	s1,s1,1
     250:	0ff4f493          	andi	s1,s1,255
     254:	ff2495e3          	bne	s1,s2,23e <createtest+0x5a>
}
     258:	70a2                	ld	ra,40(sp)
     25a:	7402                	ld	s0,32(sp)
     25c:	64e2                	ld	s1,24(sp)
     25e:	6942                	ld	s2,16(sp)
     260:	6145                	addi	sp,sp,48
     262:	8082                	ret

0000000000000264 <bigwrite>:
{
     264:	715d                	addi	sp,sp,-80
     266:	e486                	sd	ra,72(sp)
     268:	e0a2                	sd	s0,64(sp)
     26a:	fc26                	sd	s1,56(sp)
     26c:	f84a                	sd	s2,48(sp)
     26e:	f44e                	sd	s3,40(sp)
     270:	f052                	sd	s4,32(sp)
     272:	ec56                	sd	s5,24(sp)
     274:	e85a                	sd	s6,16(sp)
     276:	e45e                	sd	s7,8(sp)
     278:	0880                	addi	s0,sp,80
     27a:	8baa                	mv	s7,a0
  unlink("bigwrite");
     27c:	00006517          	auipc	a0,0x6
     280:	ccc50513          	addi	a0,a0,-820 # 5f48 <malloc+0x2ca>
     284:	00005097          	auipc	ra,0x5
     288:	614080e7          	jalr	1556(ra) # 5898 <unlink>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     28c:	1f300493          	li	s1,499
    fd = open("bigwrite", O_CREATE | O_RDWR);
     290:	00006a97          	auipc	s5,0x6
     294:	cb8a8a93          	addi	s5,s5,-840 # 5f48 <malloc+0x2ca>
      int cc = write(fd, buf, sz);
     298:	0000ca17          	auipc	s4,0xc
     29c:	af0a0a13          	addi	s4,s4,-1296 # bd88 <buf>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     2a0:	6b0d                	lui	s6,0x3
     2a2:	1c9b0b13          	addi	s6,s6,457 # 31c9 <dirtest+0x91>
    fd = open("bigwrite", O_CREATE | O_RDWR);
     2a6:	20200593          	li	a1,514
     2aa:	8556                	mv	a0,s5
     2ac:	00005097          	auipc	ra,0x5
     2b0:	5dc080e7          	jalr	1500(ra) # 5888 <open>
     2b4:	892a                	mv	s2,a0
    if(fd < 0){
     2b6:	04054d63          	bltz	a0,310 <bigwrite+0xac>
      int cc = write(fd, buf, sz);
     2ba:	8626                	mv	a2,s1
     2bc:	85d2                	mv	a1,s4
     2be:	00005097          	auipc	ra,0x5
     2c2:	5aa080e7          	jalr	1450(ra) # 5868 <write>
     2c6:	89aa                	mv	s3,a0
      if(cc != sz){
     2c8:	06a49463          	bne	s1,a0,330 <bigwrite+0xcc>
      int cc = write(fd, buf, sz);
     2cc:	8626                	mv	a2,s1
     2ce:	85d2                	mv	a1,s4
     2d0:	854a                	mv	a0,s2
     2d2:	00005097          	auipc	ra,0x5
     2d6:	596080e7          	jalr	1430(ra) # 5868 <write>
      if(cc != sz){
     2da:	04951963          	bne	a0,s1,32c <bigwrite+0xc8>
    close(fd);
     2de:	854a                	mv	a0,s2
     2e0:	00005097          	auipc	ra,0x5
     2e4:	590080e7          	jalr	1424(ra) # 5870 <close>
    unlink("bigwrite");
     2e8:	8556                	mv	a0,s5
     2ea:	00005097          	auipc	ra,0x5
     2ee:	5ae080e7          	jalr	1454(ra) # 5898 <unlink>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     2f2:	1d74849b          	addiw	s1,s1,471
     2f6:	fb6498e3          	bne	s1,s6,2a6 <bigwrite+0x42>
}
     2fa:	60a6                	ld	ra,72(sp)
     2fc:	6406                	ld	s0,64(sp)
     2fe:	74e2                	ld	s1,56(sp)
     300:	7942                	ld	s2,48(sp)
     302:	79a2                	ld	s3,40(sp)
     304:	7a02                	ld	s4,32(sp)
     306:	6ae2                	ld	s5,24(sp)
     308:	6b42                	ld	s6,16(sp)
     30a:	6ba2                	ld	s7,8(sp)
     30c:	6161                	addi	sp,sp,80
     30e:	8082                	ret
      printf("%s: cannot create bigwrite\n", s);
     310:	85de                	mv	a1,s7
     312:	00006517          	auipc	a0,0x6
     316:	e8e50513          	addi	a0,a0,-370 # 61a0 <malloc+0x522>
     31a:	00006097          	auipc	ra,0x6
     31e:	8a6080e7          	jalr	-1882(ra) # 5bc0 <printf>
      exit(1);
     322:	4505                	li	a0,1
     324:	00005097          	auipc	ra,0x5
     328:	524080e7          	jalr	1316(ra) # 5848 <exit>
     32c:	84ce                	mv	s1,s3
      int cc = write(fd, buf, sz);
     32e:	89aa                	mv	s3,a0
        printf("%s: write(%d) ret %d\n", s, sz, cc);
     330:	86ce                	mv	a3,s3
     332:	8626                	mv	a2,s1
     334:	85de                	mv	a1,s7
     336:	00006517          	auipc	a0,0x6
     33a:	e8a50513          	addi	a0,a0,-374 # 61c0 <malloc+0x542>
     33e:	00006097          	auipc	ra,0x6
     342:	882080e7          	jalr	-1918(ra) # 5bc0 <printf>
        exit(1);
     346:	4505                	li	a0,1
     348:	00005097          	auipc	ra,0x5
     34c:	500080e7          	jalr	1280(ra) # 5848 <exit>

0000000000000350 <copyin>:
{
     350:	715d                	addi	sp,sp,-80
     352:	e486                	sd	ra,72(sp)
     354:	e0a2                	sd	s0,64(sp)
     356:	fc26                	sd	s1,56(sp)
     358:	f84a                	sd	s2,48(sp)
     35a:	f44e                	sd	s3,40(sp)
     35c:	f052                	sd	s4,32(sp)
     35e:	0880                	addi	s0,sp,80
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     360:	4785                	li	a5,1
     362:	07fe                	slli	a5,a5,0x1f
     364:	fcf43023          	sd	a5,-64(s0)
     368:	57fd                	li	a5,-1
     36a:	fcf43423          	sd	a5,-56(s0)
  for(int ai = 0; ai < 2; ai++){
     36e:	fc040913          	addi	s2,s0,-64
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     372:	00006a17          	auipc	s4,0x6
     376:	e66a0a13          	addi	s4,s4,-410 # 61d8 <malloc+0x55a>
    uint64 addr = addrs[ai];
     37a:	00093983          	ld	s3,0(s2)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     37e:	20100593          	li	a1,513
     382:	8552                	mv	a0,s4
     384:	00005097          	auipc	ra,0x5
     388:	504080e7          	jalr	1284(ra) # 5888 <open>
     38c:	84aa                	mv	s1,a0
    if(fd < 0){
     38e:	08054863          	bltz	a0,41e <copyin+0xce>
    int n = write(fd, (void*)addr, 8192);
     392:	6609                	lui	a2,0x2
     394:	85ce                	mv	a1,s3
     396:	00005097          	auipc	ra,0x5
     39a:	4d2080e7          	jalr	1234(ra) # 5868 <write>
    if(n >= 0){
     39e:	08055d63          	bgez	a0,438 <copyin+0xe8>
    close(fd);
     3a2:	8526                	mv	a0,s1
     3a4:	00005097          	auipc	ra,0x5
     3a8:	4cc080e7          	jalr	1228(ra) # 5870 <close>
    unlink("copyin1");
     3ac:	8552                	mv	a0,s4
     3ae:	00005097          	auipc	ra,0x5
     3b2:	4ea080e7          	jalr	1258(ra) # 5898 <unlink>
    n = write(1, (char*)addr, 8192);
     3b6:	6609                	lui	a2,0x2
     3b8:	85ce                	mv	a1,s3
     3ba:	4505                	li	a0,1
     3bc:	00005097          	auipc	ra,0x5
     3c0:	4ac080e7          	jalr	1196(ra) # 5868 <write>
    if(n > 0){
     3c4:	08a04963          	bgtz	a0,456 <copyin+0x106>
    if(pipe(fds) < 0){
     3c8:	fb840513          	addi	a0,s0,-72
     3cc:	00005097          	auipc	ra,0x5
     3d0:	48c080e7          	jalr	1164(ra) # 5858 <pipe>
     3d4:	0a054063          	bltz	a0,474 <copyin+0x124>
    n = write(fds[1], (char*)addr, 8192);
     3d8:	6609                	lui	a2,0x2
     3da:	85ce                	mv	a1,s3
     3dc:	fbc42503          	lw	a0,-68(s0)
     3e0:	00005097          	auipc	ra,0x5
     3e4:	488080e7          	jalr	1160(ra) # 5868 <write>
    if(n > 0){
     3e8:	0aa04363          	bgtz	a0,48e <copyin+0x13e>
    close(fds[0]);
     3ec:	fb842503          	lw	a0,-72(s0)
     3f0:	00005097          	auipc	ra,0x5
     3f4:	480080e7          	jalr	1152(ra) # 5870 <close>
    close(fds[1]);
     3f8:	fbc42503          	lw	a0,-68(s0)
     3fc:	00005097          	auipc	ra,0x5
     400:	474080e7          	jalr	1140(ra) # 5870 <close>
  for(int ai = 0; ai < 2; ai++){
     404:	0921                	addi	s2,s2,8
     406:	fd040793          	addi	a5,s0,-48
     40a:	f6f918e3          	bne	s2,a5,37a <copyin+0x2a>
}
     40e:	60a6                	ld	ra,72(sp)
     410:	6406                	ld	s0,64(sp)
     412:	74e2                	ld	s1,56(sp)
     414:	7942                	ld	s2,48(sp)
     416:	79a2                	ld	s3,40(sp)
     418:	7a02                	ld	s4,32(sp)
     41a:	6161                	addi	sp,sp,80
     41c:	8082                	ret
      printf("open(copyin1) failed\n");
     41e:	00006517          	auipc	a0,0x6
     422:	dc250513          	addi	a0,a0,-574 # 61e0 <malloc+0x562>
     426:	00005097          	auipc	ra,0x5
     42a:	79a080e7          	jalr	1946(ra) # 5bc0 <printf>
      exit(1);
     42e:	4505                	li	a0,1
     430:	00005097          	auipc	ra,0x5
     434:	418080e7          	jalr	1048(ra) # 5848 <exit>
      printf("write(fd, %p, 8192) returned %d, not -1\n", addr, n);
     438:	862a                	mv	a2,a0
     43a:	85ce                	mv	a1,s3
     43c:	00006517          	auipc	a0,0x6
     440:	dbc50513          	addi	a0,a0,-580 # 61f8 <malloc+0x57a>
     444:	00005097          	auipc	ra,0x5
     448:	77c080e7          	jalr	1916(ra) # 5bc0 <printf>
      exit(1);
     44c:	4505                	li	a0,1
     44e:	00005097          	auipc	ra,0x5
     452:	3fa080e7          	jalr	1018(ra) # 5848 <exit>
      printf("write(1, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     456:	862a                	mv	a2,a0
     458:	85ce                	mv	a1,s3
     45a:	00006517          	auipc	a0,0x6
     45e:	dce50513          	addi	a0,a0,-562 # 6228 <malloc+0x5aa>
     462:	00005097          	auipc	ra,0x5
     466:	75e080e7          	jalr	1886(ra) # 5bc0 <printf>
      exit(1);
     46a:	4505                	li	a0,1
     46c:	00005097          	auipc	ra,0x5
     470:	3dc080e7          	jalr	988(ra) # 5848 <exit>
      printf("pipe() failed\n");
     474:	00006517          	auipc	a0,0x6
     478:	de450513          	addi	a0,a0,-540 # 6258 <malloc+0x5da>
     47c:	00005097          	auipc	ra,0x5
     480:	744080e7          	jalr	1860(ra) # 5bc0 <printf>
      exit(1);
     484:	4505                	li	a0,1
     486:	00005097          	auipc	ra,0x5
     48a:	3c2080e7          	jalr	962(ra) # 5848 <exit>
      printf("write(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     48e:	862a                	mv	a2,a0
     490:	85ce                	mv	a1,s3
     492:	00006517          	auipc	a0,0x6
     496:	dd650513          	addi	a0,a0,-554 # 6268 <malloc+0x5ea>
     49a:	00005097          	auipc	ra,0x5
     49e:	726080e7          	jalr	1830(ra) # 5bc0 <printf>
      exit(1);
     4a2:	4505                	li	a0,1
     4a4:	00005097          	auipc	ra,0x5
     4a8:	3a4080e7          	jalr	932(ra) # 5848 <exit>

00000000000004ac <copyout>:
{
     4ac:	711d                	addi	sp,sp,-96
     4ae:	ec86                	sd	ra,88(sp)
     4b0:	e8a2                	sd	s0,80(sp)
     4b2:	e4a6                	sd	s1,72(sp)
     4b4:	e0ca                	sd	s2,64(sp)
     4b6:	fc4e                	sd	s3,56(sp)
     4b8:	f852                	sd	s4,48(sp)
     4ba:	f456                	sd	s5,40(sp)
     4bc:	1080                	addi	s0,sp,96
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     4be:	4785                	li	a5,1
     4c0:	07fe                	slli	a5,a5,0x1f
     4c2:	faf43823          	sd	a5,-80(s0)
     4c6:	57fd                	li	a5,-1
     4c8:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     4cc:	fb040913          	addi	s2,s0,-80
    int fd = open("README", 0);
     4d0:	00006a17          	auipc	s4,0x6
     4d4:	dc8a0a13          	addi	s4,s4,-568 # 6298 <malloc+0x61a>
    n = write(fds[1], "x", 1);
     4d8:	00006a97          	auipc	s5,0x6
     4dc:	c98a8a93          	addi	s5,s5,-872 # 6170 <malloc+0x4f2>
    uint64 addr = addrs[ai];
     4e0:	00093983          	ld	s3,0(s2)
    int fd = open("README", 0);
     4e4:	4581                	li	a1,0
     4e6:	8552                	mv	a0,s4
     4e8:	00005097          	auipc	ra,0x5
     4ec:	3a0080e7          	jalr	928(ra) # 5888 <open>
     4f0:	84aa                	mv	s1,a0
    if(fd < 0){
     4f2:	08054663          	bltz	a0,57e <copyout+0xd2>
    int n = read(fd, (void*)addr, 8192);
     4f6:	6609                	lui	a2,0x2
     4f8:	85ce                	mv	a1,s3
     4fa:	00005097          	auipc	ra,0x5
     4fe:	366080e7          	jalr	870(ra) # 5860 <read>
    if(n > 0){
     502:	08a04b63          	bgtz	a0,598 <copyout+0xec>
    close(fd);
     506:	8526                	mv	a0,s1
     508:	00005097          	auipc	ra,0x5
     50c:	368080e7          	jalr	872(ra) # 5870 <close>
    if(pipe(fds) < 0){
     510:	fa840513          	addi	a0,s0,-88
     514:	00005097          	auipc	ra,0x5
     518:	344080e7          	jalr	836(ra) # 5858 <pipe>
     51c:	08054d63          	bltz	a0,5b6 <copyout+0x10a>
    n = write(fds[1], "x", 1);
     520:	4605                	li	a2,1
     522:	85d6                	mv	a1,s5
     524:	fac42503          	lw	a0,-84(s0)
     528:	00005097          	auipc	ra,0x5
     52c:	340080e7          	jalr	832(ra) # 5868 <write>
    if(n != 1){
     530:	4785                	li	a5,1
     532:	08f51f63          	bne	a0,a5,5d0 <copyout+0x124>
    n = read(fds[0], (void*)addr, 8192);
     536:	6609                	lui	a2,0x2
     538:	85ce                	mv	a1,s3
     53a:	fa842503          	lw	a0,-88(s0)
     53e:	00005097          	auipc	ra,0x5
     542:	322080e7          	jalr	802(ra) # 5860 <read>
    if(n > 0){
     546:	0aa04263          	bgtz	a0,5ea <copyout+0x13e>
    close(fds[0]);
     54a:	fa842503          	lw	a0,-88(s0)
     54e:	00005097          	auipc	ra,0x5
     552:	322080e7          	jalr	802(ra) # 5870 <close>
    close(fds[1]);
     556:	fac42503          	lw	a0,-84(s0)
     55a:	00005097          	auipc	ra,0x5
     55e:	316080e7          	jalr	790(ra) # 5870 <close>
  for(int ai = 0; ai < 2; ai++){
     562:	0921                	addi	s2,s2,8
     564:	fc040793          	addi	a5,s0,-64
     568:	f6f91ce3          	bne	s2,a5,4e0 <copyout+0x34>
}
     56c:	60e6                	ld	ra,88(sp)
     56e:	6446                	ld	s0,80(sp)
     570:	64a6                	ld	s1,72(sp)
     572:	6906                	ld	s2,64(sp)
     574:	79e2                	ld	s3,56(sp)
     576:	7a42                	ld	s4,48(sp)
     578:	7aa2                	ld	s5,40(sp)
     57a:	6125                	addi	sp,sp,96
     57c:	8082                	ret
      printf("open(README) failed\n");
     57e:	00006517          	auipc	a0,0x6
     582:	d2250513          	addi	a0,a0,-734 # 62a0 <malloc+0x622>
     586:	00005097          	auipc	ra,0x5
     58a:	63a080e7          	jalr	1594(ra) # 5bc0 <printf>
      exit(1);
     58e:	4505                	li	a0,1
     590:	00005097          	auipc	ra,0x5
     594:	2b8080e7          	jalr	696(ra) # 5848 <exit>
      printf("read(fd, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     598:	862a                	mv	a2,a0
     59a:	85ce                	mv	a1,s3
     59c:	00006517          	auipc	a0,0x6
     5a0:	d1c50513          	addi	a0,a0,-740 # 62b8 <malloc+0x63a>
     5a4:	00005097          	auipc	ra,0x5
     5a8:	61c080e7          	jalr	1564(ra) # 5bc0 <printf>
      exit(1);
     5ac:	4505                	li	a0,1
     5ae:	00005097          	auipc	ra,0x5
     5b2:	29a080e7          	jalr	666(ra) # 5848 <exit>
      printf("pipe() failed\n");
     5b6:	00006517          	auipc	a0,0x6
     5ba:	ca250513          	addi	a0,a0,-862 # 6258 <malloc+0x5da>
     5be:	00005097          	auipc	ra,0x5
     5c2:	602080e7          	jalr	1538(ra) # 5bc0 <printf>
      exit(1);
     5c6:	4505                	li	a0,1
     5c8:	00005097          	auipc	ra,0x5
     5cc:	280080e7          	jalr	640(ra) # 5848 <exit>
      printf("pipe write failed\n");
     5d0:	00006517          	auipc	a0,0x6
     5d4:	d1850513          	addi	a0,a0,-744 # 62e8 <malloc+0x66a>
     5d8:	00005097          	auipc	ra,0x5
     5dc:	5e8080e7          	jalr	1512(ra) # 5bc0 <printf>
      exit(1);
     5e0:	4505                	li	a0,1
     5e2:	00005097          	auipc	ra,0x5
     5e6:	266080e7          	jalr	614(ra) # 5848 <exit>
      printf("read(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     5ea:	862a                	mv	a2,a0
     5ec:	85ce                	mv	a1,s3
     5ee:	00006517          	auipc	a0,0x6
     5f2:	d1250513          	addi	a0,a0,-750 # 6300 <malloc+0x682>
     5f6:	00005097          	auipc	ra,0x5
     5fa:	5ca080e7          	jalr	1482(ra) # 5bc0 <printf>
      exit(1);
     5fe:	4505                	li	a0,1
     600:	00005097          	auipc	ra,0x5
     604:	248080e7          	jalr	584(ra) # 5848 <exit>

0000000000000608 <truncate1>:
{
     608:	711d                	addi	sp,sp,-96
     60a:	ec86                	sd	ra,88(sp)
     60c:	e8a2                	sd	s0,80(sp)
     60e:	e4a6                	sd	s1,72(sp)
     610:	e0ca                	sd	s2,64(sp)
     612:	fc4e                	sd	s3,56(sp)
     614:	f852                	sd	s4,48(sp)
     616:	f456                	sd	s5,40(sp)
     618:	1080                	addi	s0,sp,96
     61a:	8aaa                	mv	s5,a0
  unlink("truncfile");
     61c:	00006517          	auipc	a0,0x6
     620:	b3c50513          	addi	a0,a0,-1220 # 6158 <malloc+0x4da>
     624:	00005097          	auipc	ra,0x5
     628:	274080e7          	jalr	628(ra) # 5898 <unlink>
  int fd1 = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     62c:	60100593          	li	a1,1537
     630:	00006517          	auipc	a0,0x6
     634:	b2850513          	addi	a0,a0,-1240 # 6158 <malloc+0x4da>
     638:	00005097          	auipc	ra,0x5
     63c:	250080e7          	jalr	592(ra) # 5888 <open>
     640:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     642:	4611                	li	a2,4
     644:	00006597          	auipc	a1,0x6
     648:	b2458593          	addi	a1,a1,-1244 # 6168 <malloc+0x4ea>
     64c:	00005097          	auipc	ra,0x5
     650:	21c080e7          	jalr	540(ra) # 5868 <write>
  close(fd1);
     654:	8526                	mv	a0,s1
     656:	00005097          	auipc	ra,0x5
     65a:	21a080e7          	jalr	538(ra) # 5870 <close>
  int fd2 = open("truncfile", O_RDONLY);
     65e:	4581                	li	a1,0
     660:	00006517          	auipc	a0,0x6
     664:	af850513          	addi	a0,a0,-1288 # 6158 <malloc+0x4da>
     668:	00005097          	auipc	ra,0x5
     66c:	220080e7          	jalr	544(ra) # 5888 <open>
     670:	84aa                	mv	s1,a0
  int n = read(fd2, buf, sizeof(buf));
     672:	02000613          	li	a2,32
     676:	fa040593          	addi	a1,s0,-96
     67a:	00005097          	auipc	ra,0x5
     67e:	1e6080e7          	jalr	486(ra) # 5860 <read>
  if(n != 4){
     682:	4791                	li	a5,4
     684:	0cf51e63          	bne	a0,a5,760 <truncate1+0x158>
  fd1 = open("truncfile", O_WRONLY|O_TRUNC);
     688:	40100593          	li	a1,1025
     68c:	00006517          	auipc	a0,0x6
     690:	acc50513          	addi	a0,a0,-1332 # 6158 <malloc+0x4da>
     694:	00005097          	auipc	ra,0x5
     698:	1f4080e7          	jalr	500(ra) # 5888 <open>
     69c:	89aa                	mv	s3,a0
  int fd3 = open("truncfile", O_RDONLY);
     69e:	4581                	li	a1,0
     6a0:	00006517          	auipc	a0,0x6
     6a4:	ab850513          	addi	a0,a0,-1352 # 6158 <malloc+0x4da>
     6a8:	00005097          	auipc	ra,0x5
     6ac:	1e0080e7          	jalr	480(ra) # 5888 <open>
     6b0:	892a                	mv	s2,a0
  n = read(fd3, buf, sizeof(buf));
     6b2:	02000613          	li	a2,32
     6b6:	fa040593          	addi	a1,s0,-96
     6ba:	00005097          	auipc	ra,0x5
     6be:	1a6080e7          	jalr	422(ra) # 5860 <read>
     6c2:	8a2a                	mv	s4,a0
  if(n != 0){
     6c4:	ed4d                	bnez	a0,77e <truncate1+0x176>
  n = read(fd2, buf, sizeof(buf));
     6c6:	02000613          	li	a2,32
     6ca:	fa040593          	addi	a1,s0,-96
     6ce:	8526                	mv	a0,s1
     6d0:	00005097          	auipc	ra,0x5
     6d4:	190080e7          	jalr	400(ra) # 5860 <read>
     6d8:	8a2a                	mv	s4,a0
  if(n != 0){
     6da:	e971                	bnez	a0,7ae <truncate1+0x1a6>
  write(fd1, "abcdef", 6);
     6dc:	4619                	li	a2,6
     6de:	00006597          	auipc	a1,0x6
     6e2:	cb258593          	addi	a1,a1,-846 # 6390 <malloc+0x712>
     6e6:	854e                	mv	a0,s3
     6e8:	00005097          	auipc	ra,0x5
     6ec:	180080e7          	jalr	384(ra) # 5868 <write>
  n = read(fd3, buf, sizeof(buf));
     6f0:	02000613          	li	a2,32
     6f4:	fa040593          	addi	a1,s0,-96
     6f8:	854a                	mv	a0,s2
     6fa:	00005097          	auipc	ra,0x5
     6fe:	166080e7          	jalr	358(ra) # 5860 <read>
  if(n != 6){
     702:	4799                	li	a5,6
     704:	0cf51d63          	bne	a0,a5,7de <truncate1+0x1d6>
  n = read(fd2, buf, sizeof(buf));
     708:	02000613          	li	a2,32
     70c:	fa040593          	addi	a1,s0,-96
     710:	8526                	mv	a0,s1
     712:	00005097          	auipc	ra,0x5
     716:	14e080e7          	jalr	334(ra) # 5860 <read>
  if(n != 2){
     71a:	4789                	li	a5,2
     71c:	0ef51063          	bne	a0,a5,7fc <truncate1+0x1f4>
  unlink("truncfile");
     720:	00006517          	auipc	a0,0x6
     724:	a3850513          	addi	a0,a0,-1480 # 6158 <malloc+0x4da>
     728:	00005097          	auipc	ra,0x5
     72c:	170080e7          	jalr	368(ra) # 5898 <unlink>
  close(fd1);
     730:	854e                	mv	a0,s3
     732:	00005097          	auipc	ra,0x5
     736:	13e080e7          	jalr	318(ra) # 5870 <close>
  close(fd2);
     73a:	8526                	mv	a0,s1
     73c:	00005097          	auipc	ra,0x5
     740:	134080e7          	jalr	308(ra) # 5870 <close>
  close(fd3);
     744:	854a                	mv	a0,s2
     746:	00005097          	auipc	ra,0x5
     74a:	12a080e7          	jalr	298(ra) # 5870 <close>
}
     74e:	60e6                	ld	ra,88(sp)
     750:	6446                	ld	s0,80(sp)
     752:	64a6                	ld	s1,72(sp)
     754:	6906                	ld	s2,64(sp)
     756:	79e2                	ld	s3,56(sp)
     758:	7a42                	ld	s4,48(sp)
     75a:	7aa2                	ld	s5,40(sp)
     75c:	6125                	addi	sp,sp,96
     75e:	8082                	ret
    printf("%s: read %d bytes, wanted 4\n", s, n);
     760:	862a                	mv	a2,a0
     762:	85d6                	mv	a1,s5
     764:	00006517          	auipc	a0,0x6
     768:	bcc50513          	addi	a0,a0,-1076 # 6330 <malloc+0x6b2>
     76c:	00005097          	auipc	ra,0x5
     770:	454080e7          	jalr	1108(ra) # 5bc0 <printf>
    exit(1);
     774:	4505                	li	a0,1
     776:	00005097          	auipc	ra,0x5
     77a:	0d2080e7          	jalr	210(ra) # 5848 <exit>
    printf("aaa fd3=%d\n", fd3);
     77e:	85ca                	mv	a1,s2
     780:	00006517          	auipc	a0,0x6
     784:	bd050513          	addi	a0,a0,-1072 # 6350 <malloc+0x6d2>
     788:	00005097          	auipc	ra,0x5
     78c:	438080e7          	jalr	1080(ra) # 5bc0 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     790:	8652                	mv	a2,s4
     792:	85d6                	mv	a1,s5
     794:	00006517          	auipc	a0,0x6
     798:	bcc50513          	addi	a0,a0,-1076 # 6360 <malloc+0x6e2>
     79c:	00005097          	auipc	ra,0x5
     7a0:	424080e7          	jalr	1060(ra) # 5bc0 <printf>
    exit(1);
     7a4:	4505                	li	a0,1
     7a6:	00005097          	auipc	ra,0x5
     7aa:	0a2080e7          	jalr	162(ra) # 5848 <exit>
    printf("bbb fd2=%d\n", fd2);
     7ae:	85a6                	mv	a1,s1
     7b0:	00006517          	auipc	a0,0x6
     7b4:	bd050513          	addi	a0,a0,-1072 # 6380 <malloc+0x702>
     7b8:	00005097          	auipc	ra,0x5
     7bc:	408080e7          	jalr	1032(ra) # 5bc0 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     7c0:	8652                	mv	a2,s4
     7c2:	85d6                	mv	a1,s5
     7c4:	00006517          	auipc	a0,0x6
     7c8:	b9c50513          	addi	a0,a0,-1124 # 6360 <malloc+0x6e2>
     7cc:	00005097          	auipc	ra,0x5
     7d0:	3f4080e7          	jalr	1012(ra) # 5bc0 <printf>
    exit(1);
     7d4:	4505                	li	a0,1
     7d6:	00005097          	auipc	ra,0x5
     7da:	072080e7          	jalr	114(ra) # 5848 <exit>
    printf("%s: read %d bytes, wanted 6\n", s, n);
     7de:	862a                	mv	a2,a0
     7e0:	85d6                	mv	a1,s5
     7e2:	00006517          	auipc	a0,0x6
     7e6:	bb650513          	addi	a0,a0,-1098 # 6398 <malloc+0x71a>
     7ea:	00005097          	auipc	ra,0x5
     7ee:	3d6080e7          	jalr	982(ra) # 5bc0 <printf>
    exit(1);
     7f2:	4505                	li	a0,1
     7f4:	00005097          	auipc	ra,0x5
     7f8:	054080e7          	jalr	84(ra) # 5848 <exit>
    printf("%s: read %d bytes, wanted 2\n", s, n);
     7fc:	862a                	mv	a2,a0
     7fe:	85d6                	mv	a1,s5
     800:	00006517          	auipc	a0,0x6
     804:	bb850513          	addi	a0,a0,-1096 # 63b8 <malloc+0x73a>
     808:	00005097          	auipc	ra,0x5
     80c:	3b8080e7          	jalr	952(ra) # 5bc0 <printf>
    exit(1);
     810:	4505                	li	a0,1
     812:	00005097          	auipc	ra,0x5
     816:	036080e7          	jalr	54(ra) # 5848 <exit>

000000000000081a <writetest>:
{
     81a:	7139                	addi	sp,sp,-64
     81c:	fc06                	sd	ra,56(sp)
     81e:	f822                	sd	s0,48(sp)
     820:	f426                	sd	s1,40(sp)
     822:	f04a                	sd	s2,32(sp)
     824:	ec4e                	sd	s3,24(sp)
     826:	e852                	sd	s4,16(sp)
     828:	e456                	sd	s5,8(sp)
     82a:	e05a                	sd	s6,0(sp)
     82c:	0080                	addi	s0,sp,64
     82e:	8b2a                	mv	s6,a0
  fd = open("small", O_CREATE|O_RDWR);
     830:	20200593          	li	a1,514
     834:	00006517          	auipc	a0,0x6
     838:	ba450513          	addi	a0,a0,-1116 # 63d8 <malloc+0x75a>
     83c:	00005097          	auipc	ra,0x5
     840:	04c080e7          	jalr	76(ra) # 5888 <open>
  if(fd < 0){
     844:	0a054d63          	bltz	a0,8fe <writetest+0xe4>
     848:	892a                	mv	s2,a0
     84a:	4481                	li	s1,0
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     84c:	00006997          	auipc	s3,0x6
     850:	bb498993          	addi	s3,s3,-1100 # 6400 <malloc+0x782>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     854:	00006a97          	auipc	s5,0x6
     858:	be4a8a93          	addi	s5,s5,-1052 # 6438 <malloc+0x7ba>
  for(i = 0; i < N; i++){
     85c:	06400a13          	li	s4,100
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     860:	4629                	li	a2,10
     862:	85ce                	mv	a1,s3
     864:	854a                	mv	a0,s2
     866:	00005097          	auipc	ra,0x5
     86a:	002080e7          	jalr	2(ra) # 5868 <write>
     86e:	47a9                	li	a5,10
     870:	0af51563          	bne	a0,a5,91a <writetest+0x100>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     874:	4629                	li	a2,10
     876:	85d6                	mv	a1,s5
     878:	854a                	mv	a0,s2
     87a:	00005097          	auipc	ra,0x5
     87e:	fee080e7          	jalr	-18(ra) # 5868 <write>
     882:	47a9                	li	a5,10
     884:	0af51a63          	bne	a0,a5,938 <writetest+0x11e>
  for(i = 0; i < N; i++){
     888:	2485                	addiw	s1,s1,1
     88a:	fd449be3          	bne	s1,s4,860 <writetest+0x46>
  close(fd);
     88e:	854a                	mv	a0,s2
     890:	00005097          	auipc	ra,0x5
     894:	fe0080e7          	jalr	-32(ra) # 5870 <close>
  fd = open("small", O_RDONLY);
     898:	4581                	li	a1,0
     89a:	00006517          	auipc	a0,0x6
     89e:	b3e50513          	addi	a0,a0,-1218 # 63d8 <malloc+0x75a>
     8a2:	00005097          	auipc	ra,0x5
     8a6:	fe6080e7          	jalr	-26(ra) # 5888 <open>
     8aa:	84aa                	mv	s1,a0
  if(fd < 0){
     8ac:	0a054563          	bltz	a0,956 <writetest+0x13c>
  i = read(fd, buf, N*SZ*2);
     8b0:	7d000613          	li	a2,2000
     8b4:	0000b597          	auipc	a1,0xb
     8b8:	4d458593          	addi	a1,a1,1236 # bd88 <buf>
     8bc:	00005097          	auipc	ra,0x5
     8c0:	fa4080e7          	jalr	-92(ra) # 5860 <read>
  if(i != N*SZ*2){
     8c4:	7d000793          	li	a5,2000
     8c8:	0af51563          	bne	a0,a5,972 <writetest+0x158>
  close(fd);
     8cc:	8526                	mv	a0,s1
     8ce:	00005097          	auipc	ra,0x5
     8d2:	fa2080e7          	jalr	-94(ra) # 5870 <close>
  if(unlink("small") < 0){
     8d6:	00006517          	auipc	a0,0x6
     8da:	b0250513          	addi	a0,a0,-1278 # 63d8 <malloc+0x75a>
     8de:	00005097          	auipc	ra,0x5
     8e2:	fba080e7          	jalr	-70(ra) # 5898 <unlink>
     8e6:	0a054463          	bltz	a0,98e <writetest+0x174>
}
     8ea:	70e2                	ld	ra,56(sp)
     8ec:	7442                	ld	s0,48(sp)
     8ee:	74a2                	ld	s1,40(sp)
     8f0:	7902                	ld	s2,32(sp)
     8f2:	69e2                	ld	s3,24(sp)
     8f4:	6a42                	ld	s4,16(sp)
     8f6:	6aa2                	ld	s5,8(sp)
     8f8:	6b02                	ld	s6,0(sp)
     8fa:	6121                	addi	sp,sp,64
     8fc:	8082                	ret
    printf("%s: error: creat small failed!\n", s);
     8fe:	85da                	mv	a1,s6
     900:	00006517          	auipc	a0,0x6
     904:	ae050513          	addi	a0,a0,-1312 # 63e0 <malloc+0x762>
     908:	00005097          	auipc	ra,0x5
     90c:	2b8080e7          	jalr	696(ra) # 5bc0 <printf>
    exit(1);
     910:	4505                	li	a0,1
     912:	00005097          	auipc	ra,0x5
     916:	f36080e7          	jalr	-202(ra) # 5848 <exit>
      printf("%s: error: write aa %d new file failed\n", s, i);
     91a:	8626                	mv	a2,s1
     91c:	85da                	mv	a1,s6
     91e:	00006517          	auipc	a0,0x6
     922:	af250513          	addi	a0,a0,-1294 # 6410 <malloc+0x792>
     926:	00005097          	auipc	ra,0x5
     92a:	29a080e7          	jalr	666(ra) # 5bc0 <printf>
      exit(1);
     92e:	4505                	li	a0,1
     930:	00005097          	auipc	ra,0x5
     934:	f18080e7          	jalr	-232(ra) # 5848 <exit>
      printf("%s: error: write bb %d new file failed\n", s, i);
     938:	8626                	mv	a2,s1
     93a:	85da                	mv	a1,s6
     93c:	00006517          	auipc	a0,0x6
     940:	b0c50513          	addi	a0,a0,-1268 # 6448 <malloc+0x7ca>
     944:	00005097          	auipc	ra,0x5
     948:	27c080e7          	jalr	636(ra) # 5bc0 <printf>
      exit(1);
     94c:	4505                	li	a0,1
     94e:	00005097          	auipc	ra,0x5
     952:	efa080e7          	jalr	-262(ra) # 5848 <exit>
    printf("%s: error: open small failed!\n", s);
     956:	85da                	mv	a1,s6
     958:	00006517          	auipc	a0,0x6
     95c:	b1850513          	addi	a0,a0,-1256 # 6470 <malloc+0x7f2>
     960:	00005097          	auipc	ra,0x5
     964:	260080e7          	jalr	608(ra) # 5bc0 <printf>
    exit(1);
     968:	4505                	li	a0,1
     96a:	00005097          	auipc	ra,0x5
     96e:	ede080e7          	jalr	-290(ra) # 5848 <exit>
    printf("%s: read failed\n", s);
     972:	85da                	mv	a1,s6
     974:	00006517          	auipc	a0,0x6
     978:	b1c50513          	addi	a0,a0,-1252 # 6490 <malloc+0x812>
     97c:	00005097          	auipc	ra,0x5
     980:	244080e7          	jalr	580(ra) # 5bc0 <printf>
    exit(1);
     984:	4505                	li	a0,1
     986:	00005097          	auipc	ra,0x5
     98a:	ec2080e7          	jalr	-318(ra) # 5848 <exit>
    printf("%s: unlink small failed\n", s);
     98e:	85da                	mv	a1,s6
     990:	00006517          	auipc	a0,0x6
     994:	b1850513          	addi	a0,a0,-1256 # 64a8 <malloc+0x82a>
     998:	00005097          	auipc	ra,0x5
     99c:	228080e7          	jalr	552(ra) # 5bc0 <printf>
    exit(1);
     9a0:	4505                	li	a0,1
     9a2:	00005097          	auipc	ra,0x5
     9a6:	ea6080e7          	jalr	-346(ra) # 5848 <exit>

00000000000009aa <writebig>:
{
     9aa:	7139                	addi	sp,sp,-64
     9ac:	fc06                	sd	ra,56(sp)
     9ae:	f822                	sd	s0,48(sp)
     9b0:	f426                	sd	s1,40(sp)
     9b2:	f04a                	sd	s2,32(sp)
     9b4:	ec4e                	sd	s3,24(sp)
     9b6:	e852                	sd	s4,16(sp)
     9b8:	e456                	sd	s5,8(sp)
     9ba:	0080                	addi	s0,sp,64
     9bc:	8aaa                	mv	s5,a0
  fd = open("big", O_CREATE|O_RDWR);
     9be:	20200593          	li	a1,514
     9c2:	00006517          	auipc	a0,0x6
     9c6:	b0650513          	addi	a0,a0,-1274 # 64c8 <malloc+0x84a>
     9ca:	00005097          	auipc	ra,0x5
     9ce:	ebe080e7          	jalr	-322(ra) # 5888 <open>
     9d2:	89aa                	mv	s3,a0
  for(i = 0; i < MAXFILE; i++){
     9d4:	4481                	li	s1,0
    ((int*)buf)[0] = i;
     9d6:	0000b917          	auipc	s2,0xb
     9da:	3b290913          	addi	s2,s2,946 # bd88 <buf>
  for(i = 0; i < MAXFILE; i++){
     9de:	10c00a13          	li	s4,268
  if(fd < 0){
     9e2:	06054c63          	bltz	a0,a5a <writebig+0xb0>
    ((int*)buf)[0] = i;
     9e6:	00992023          	sw	s1,0(s2)
    if(write(fd, buf, BSIZE) != BSIZE){
     9ea:	40000613          	li	a2,1024
     9ee:	85ca                	mv	a1,s2
     9f0:	854e                	mv	a0,s3
     9f2:	00005097          	auipc	ra,0x5
     9f6:	e76080e7          	jalr	-394(ra) # 5868 <write>
     9fa:	40000793          	li	a5,1024
     9fe:	06f51c63          	bne	a0,a5,a76 <writebig+0xcc>
  for(i = 0; i < MAXFILE; i++){
     a02:	2485                	addiw	s1,s1,1
     a04:	ff4491e3          	bne	s1,s4,9e6 <writebig+0x3c>
  close(fd);
     a08:	854e                	mv	a0,s3
     a0a:	00005097          	auipc	ra,0x5
     a0e:	e66080e7          	jalr	-410(ra) # 5870 <close>
  fd = open("big", O_RDONLY);
     a12:	4581                	li	a1,0
     a14:	00006517          	auipc	a0,0x6
     a18:	ab450513          	addi	a0,a0,-1356 # 64c8 <malloc+0x84a>
     a1c:	00005097          	auipc	ra,0x5
     a20:	e6c080e7          	jalr	-404(ra) # 5888 <open>
     a24:	89aa                	mv	s3,a0
  n = 0;
     a26:	4481                	li	s1,0
    i = read(fd, buf, BSIZE);
     a28:	0000b917          	auipc	s2,0xb
     a2c:	36090913          	addi	s2,s2,864 # bd88 <buf>
  if(fd < 0){
     a30:	06054263          	bltz	a0,a94 <writebig+0xea>
    i = read(fd, buf, BSIZE);
     a34:	40000613          	li	a2,1024
     a38:	85ca                	mv	a1,s2
     a3a:	854e                	mv	a0,s3
     a3c:	00005097          	auipc	ra,0x5
     a40:	e24080e7          	jalr	-476(ra) # 5860 <read>
    if(i == 0){
     a44:	c535                	beqz	a0,ab0 <writebig+0x106>
    } else if(i != BSIZE){
     a46:	40000793          	li	a5,1024
     a4a:	0af51f63          	bne	a0,a5,b08 <writebig+0x15e>
    if(((int*)buf)[0] != n){
     a4e:	00092683          	lw	a3,0(s2)
     a52:	0c969a63          	bne	a3,s1,b26 <writebig+0x17c>
    n++;
     a56:	2485                	addiw	s1,s1,1
    i = read(fd, buf, BSIZE);
     a58:	bff1                	j	a34 <writebig+0x8a>
    printf("%s: error: creat big failed!\n", s);
     a5a:	85d6                	mv	a1,s5
     a5c:	00006517          	auipc	a0,0x6
     a60:	a7450513          	addi	a0,a0,-1420 # 64d0 <malloc+0x852>
     a64:	00005097          	auipc	ra,0x5
     a68:	15c080e7          	jalr	348(ra) # 5bc0 <printf>
    exit(1);
     a6c:	4505                	li	a0,1
     a6e:	00005097          	auipc	ra,0x5
     a72:	dda080e7          	jalr	-550(ra) # 5848 <exit>
      printf("%s: error: write big file failed\n", s, i);
     a76:	8626                	mv	a2,s1
     a78:	85d6                	mv	a1,s5
     a7a:	00006517          	auipc	a0,0x6
     a7e:	a7650513          	addi	a0,a0,-1418 # 64f0 <malloc+0x872>
     a82:	00005097          	auipc	ra,0x5
     a86:	13e080e7          	jalr	318(ra) # 5bc0 <printf>
      exit(1);
     a8a:	4505                	li	a0,1
     a8c:	00005097          	auipc	ra,0x5
     a90:	dbc080e7          	jalr	-580(ra) # 5848 <exit>
    printf("%s: error: open big failed!\n", s);
     a94:	85d6                	mv	a1,s5
     a96:	00006517          	auipc	a0,0x6
     a9a:	a8250513          	addi	a0,a0,-1406 # 6518 <malloc+0x89a>
     a9e:	00005097          	auipc	ra,0x5
     aa2:	122080e7          	jalr	290(ra) # 5bc0 <printf>
    exit(1);
     aa6:	4505                	li	a0,1
     aa8:	00005097          	auipc	ra,0x5
     aac:	da0080e7          	jalr	-608(ra) # 5848 <exit>
      if(n == MAXFILE - 1){
     ab0:	10b00793          	li	a5,267
     ab4:	02f48a63          	beq	s1,a5,ae8 <writebig+0x13e>
  close(fd);
     ab8:	854e                	mv	a0,s3
     aba:	00005097          	auipc	ra,0x5
     abe:	db6080e7          	jalr	-586(ra) # 5870 <close>
  if(unlink("big") < 0){
     ac2:	00006517          	auipc	a0,0x6
     ac6:	a0650513          	addi	a0,a0,-1530 # 64c8 <malloc+0x84a>
     aca:	00005097          	auipc	ra,0x5
     ace:	dce080e7          	jalr	-562(ra) # 5898 <unlink>
     ad2:	06054963          	bltz	a0,b44 <writebig+0x19a>
}
     ad6:	70e2                	ld	ra,56(sp)
     ad8:	7442                	ld	s0,48(sp)
     ada:	74a2                	ld	s1,40(sp)
     adc:	7902                	ld	s2,32(sp)
     ade:	69e2                	ld	s3,24(sp)
     ae0:	6a42                	ld	s4,16(sp)
     ae2:	6aa2                	ld	s5,8(sp)
     ae4:	6121                	addi	sp,sp,64
     ae6:	8082                	ret
        printf("%s: read only %d blocks from big", s, n);
     ae8:	10b00613          	li	a2,267
     aec:	85d6                	mv	a1,s5
     aee:	00006517          	auipc	a0,0x6
     af2:	a4a50513          	addi	a0,a0,-1462 # 6538 <malloc+0x8ba>
     af6:	00005097          	auipc	ra,0x5
     afa:	0ca080e7          	jalr	202(ra) # 5bc0 <printf>
        exit(1);
     afe:	4505                	li	a0,1
     b00:	00005097          	auipc	ra,0x5
     b04:	d48080e7          	jalr	-696(ra) # 5848 <exit>
      printf("%s: read failed %d\n", s, i);
     b08:	862a                	mv	a2,a0
     b0a:	85d6                	mv	a1,s5
     b0c:	00006517          	auipc	a0,0x6
     b10:	a5450513          	addi	a0,a0,-1452 # 6560 <malloc+0x8e2>
     b14:	00005097          	auipc	ra,0x5
     b18:	0ac080e7          	jalr	172(ra) # 5bc0 <printf>
      exit(1);
     b1c:	4505                	li	a0,1
     b1e:	00005097          	auipc	ra,0x5
     b22:	d2a080e7          	jalr	-726(ra) # 5848 <exit>
      printf("%s: read content of block %d is %d\n", s,
     b26:	8626                	mv	a2,s1
     b28:	85d6                	mv	a1,s5
     b2a:	00006517          	auipc	a0,0x6
     b2e:	a4e50513          	addi	a0,a0,-1458 # 6578 <malloc+0x8fa>
     b32:	00005097          	auipc	ra,0x5
     b36:	08e080e7          	jalr	142(ra) # 5bc0 <printf>
      exit(1);
     b3a:	4505                	li	a0,1
     b3c:	00005097          	auipc	ra,0x5
     b40:	d0c080e7          	jalr	-756(ra) # 5848 <exit>
    printf("%s: unlink big failed\n", s);
     b44:	85d6                	mv	a1,s5
     b46:	00006517          	auipc	a0,0x6
     b4a:	a5a50513          	addi	a0,a0,-1446 # 65a0 <malloc+0x922>
     b4e:	00005097          	auipc	ra,0x5
     b52:	072080e7          	jalr	114(ra) # 5bc0 <printf>
    exit(1);
     b56:	4505                	li	a0,1
     b58:	00005097          	auipc	ra,0x5
     b5c:	cf0080e7          	jalr	-784(ra) # 5848 <exit>

0000000000000b60 <unlinkread>:
{
     b60:	7179                	addi	sp,sp,-48
     b62:	f406                	sd	ra,40(sp)
     b64:	f022                	sd	s0,32(sp)
     b66:	ec26                	sd	s1,24(sp)
     b68:	e84a                	sd	s2,16(sp)
     b6a:	e44e                	sd	s3,8(sp)
     b6c:	1800                	addi	s0,sp,48
     b6e:	89aa                	mv	s3,a0
  fd = open("unlinkread", O_CREATE | O_RDWR);
     b70:	20200593          	li	a1,514
     b74:	00005517          	auipc	a0,0x5
     b78:	36450513          	addi	a0,a0,868 # 5ed8 <malloc+0x25a>
     b7c:	00005097          	auipc	ra,0x5
     b80:	d0c080e7          	jalr	-756(ra) # 5888 <open>
  if(fd < 0){
     b84:	0e054563          	bltz	a0,c6e <unlinkread+0x10e>
     b88:	84aa                	mv	s1,a0
  write(fd, "hello", SZ);
     b8a:	4615                	li	a2,5
     b8c:	00006597          	auipc	a1,0x6
     b90:	a4c58593          	addi	a1,a1,-1460 # 65d8 <malloc+0x95a>
     b94:	00005097          	auipc	ra,0x5
     b98:	cd4080e7          	jalr	-812(ra) # 5868 <write>
  close(fd);
     b9c:	8526                	mv	a0,s1
     b9e:	00005097          	auipc	ra,0x5
     ba2:	cd2080e7          	jalr	-814(ra) # 5870 <close>
  fd = open("unlinkread", O_RDWR);
     ba6:	4589                	li	a1,2
     ba8:	00005517          	auipc	a0,0x5
     bac:	33050513          	addi	a0,a0,816 # 5ed8 <malloc+0x25a>
     bb0:	00005097          	auipc	ra,0x5
     bb4:	cd8080e7          	jalr	-808(ra) # 5888 <open>
     bb8:	84aa                	mv	s1,a0
  if(fd < 0){
     bba:	0c054863          	bltz	a0,c8a <unlinkread+0x12a>
  if(unlink("unlinkread") != 0){
     bbe:	00005517          	auipc	a0,0x5
     bc2:	31a50513          	addi	a0,a0,794 # 5ed8 <malloc+0x25a>
     bc6:	00005097          	auipc	ra,0x5
     bca:	cd2080e7          	jalr	-814(ra) # 5898 <unlink>
     bce:	ed61                	bnez	a0,ca6 <unlinkread+0x146>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
     bd0:	20200593          	li	a1,514
     bd4:	00005517          	auipc	a0,0x5
     bd8:	30450513          	addi	a0,a0,772 # 5ed8 <malloc+0x25a>
     bdc:	00005097          	auipc	ra,0x5
     be0:	cac080e7          	jalr	-852(ra) # 5888 <open>
     be4:	892a                	mv	s2,a0
  write(fd1, "yyy", 3);
     be6:	460d                	li	a2,3
     be8:	00006597          	auipc	a1,0x6
     bec:	a3858593          	addi	a1,a1,-1480 # 6620 <malloc+0x9a2>
     bf0:	00005097          	auipc	ra,0x5
     bf4:	c78080e7          	jalr	-904(ra) # 5868 <write>
  close(fd1);
     bf8:	854a                	mv	a0,s2
     bfa:	00005097          	auipc	ra,0x5
     bfe:	c76080e7          	jalr	-906(ra) # 5870 <close>
  if(read(fd, buf, sizeof(buf)) != SZ){
     c02:	660d                	lui	a2,0x3
     c04:	0000b597          	auipc	a1,0xb
     c08:	18458593          	addi	a1,a1,388 # bd88 <buf>
     c0c:	8526                	mv	a0,s1
     c0e:	00005097          	auipc	ra,0x5
     c12:	c52080e7          	jalr	-942(ra) # 5860 <read>
     c16:	4795                	li	a5,5
     c18:	0af51563          	bne	a0,a5,cc2 <unlinkread+0x162>
  if(buf[0] != 'h'){
     c1c:	0000b717          	auipc	a4,0xb
     c20:	16c74703          	lbu	a4,364(a4) # bd88 <buf>
     c24:	06800793          	li	a5,104
     c28:	0af71b63          	bne	a4,a5,cde <unlinkread+0x17e>
  if(write(fd, buf, 10) != 10){
     c2c:	4629                	li	a2,10
     c2e:	0000b597          	auipc	a1,0xb
     c32:	15a58593          	addi	a1,a1,346 # bd88 <buf>
     c36:	8526                	mv	a0,s1
     c38:	00005097          	auipc	ra,0x5
     c3c:	c30080e7          	jalr	-976(ra) # 5868 <write>
     c40:	47a9                	li	a5,10
     c42:	0af51c63          	bne	a0,a5,cfa <unlinkread+0x19a>
  close(fd);
     c46:	8526                	mv	a0,s1
     c48:	00005097          	auipc	ra,0x5
     c4c:	c28080e7          	jalr	-984(ra) # 5870 <close>
  unlink("unlinkread");
     c50:	00005517          	auipc	a0,0x5
     c54:	28850513          	addi	a0,a0,648 # 5ed8 <malloc+0x25a>
     c58:	00005097          	auipc	ra,0x5
     c5c:	c40080e7          	jalr	-960(ra) # 5898 <unlink>
}
     c60:	70a2                	ld	ra,40(sp)
     c62:	7402                	ld	s0,32(sp)
     c64:	64e2                	ld	s1,24(sp)
     c66:	6942                	ld	s2,16(sp)
     c68:	69a2                	ld	s3,8(sp)
     c6a:	6145                	addi	sp,sp,48
     c6c:	8082                	ret
    printf("%s: create unlinkread failed\n", s);
     c6e:	85ce                	mv	a1,s3
     c70:	00006517          	auipc	a0,0x6
     c74:	94850513          	addi	a0,a0,-1720 # 65b8 <malloc+0x93a>
     c78:	00005097          	auipc	ra,0x5
     c7c:	f48080e7          	jalr	-184(ra) # 5bc0 <printf>
    exit(1);
     c80:	4505                	li	a0,1
     c82:	00005097          	auipc	ra,0x5
     c86:	bc6080e7          	jalr	-1082(ra) # 5848 <exit>
    printf("%s: open unlinkread failed\n", s);
     c8a:	85ce                	mv	a1,s3
     c8c:	00006517          	auipc	a0,0x6
     c90:	95450513          	addi	a0,a0,-1708 # 65e0 <malloc+0x962>
     c94:	00005097          	auipc	ra,0x5
     c98:	f2c080e7          	jalr	-212(ra) # 5bc0 <printf>
    exit(1);
     c9c:	4505                	li	a0,1
     c9e:	00005097          	auipc	ra,0x5
     ca2:	baa080e7          	jalr	-1110(ra) # 5848 <exit>
    printf("%s: unlink unlinkread failed\n", s);
     ca6:	85ce                	mv	a1,s3
     ca8:	00006517          	auipc	a0,0x6
     cac:	95850513          	addi	a0,a0,-1704 # 6600 <malloc+0x982>
     cb0:	00005097          	auipc	ra,0x5
     cb4:	f10080e7          	jalr	-240(ra) # 5bc0 <printf>
    exit(1);
     cb8:	4505                	li	a0,1
     cba:	00005097          	auipc	ra,0x5
     cbe:	b8e080e7          	jalr	-1138(ra) # 5848 <exit>
    printf("%s: unlinkread read failed", s);
     cc2:	85ce                	mv	a1,s3
     cc4:	00006517          	auipc	a0,0x6
     cc8:	96450513          	addi	a0,a0,-1692 # 6628 <malloc+0x9aa>
     ccc:	00005097          	auipc	ra,0x5
     cd0:	ef4080e7          	jalr	-268(ra) # 5bc0 <printf>
    exit(1);
     cd4:	4505                	li	a0,1
     cd6:	00005097          	auipc	ra,0x5
     cda:	b72080e7          	jalr	-1166(ra) # 5848 <exit>
    printf("%s: unlinkread wrong data\n", s);
     cde:	85ce                	mv	a1,s3
     ce0:	00006517          	auipc	a0,0x6
     ce4:	96850513          	addi	a0,a0,-1688 # 6648 <malloc+0x9ca>
     ce8:	00005097          	auipc	ra,0x5
     cec:	ed8080e7          	jalr	-296(ra) # 5bc0 <printf>
    exit(1);
     cf0:	4505                	li	a0,1
     cf2:	00005097          	auipc	ra,0x5
     cf6:	b56080e7          	jalr	-1194(ra) # 5848 <exit>
    printf("%s: unlinkread write failed\n", s);
     cfa:	85ce                	mv	a1,s3
     cfc:	00006517          	auipc	a0,0x6
     d00:	96c50513          	addi	a0,a0,-1684 # 6668 <malloc+0x9ea>
     d04:	00005097          	auipc	ra,0x5
     d08:	ebc080e7          	jalr	-324(ra) # 5bc0 <printf>
    exit(1);
     d0c:	4505                	li	a0,1
     d0e:	00005097          	auipc	ra,0x5
     d12:	b3a080e7          	jalr	-1222(ra) # 5848 <exit>

0000000000000d16 <linktest>:
{
     d16:	1101                	addi	sp,sp,-32
     d18:	ec06                	sd	ra,24(sp)
     d1a:	e822                	sd	s0,16(sp)
     d1c:	e426                	sd	s1,8(sp)
     d1e:	e04a                	sd	s2,0(sp)
     d20:	1000                	addi	s0,sp,32
     d22:	892a                	mv	s2,a0
  unlink("lf1");
     d24:	00006517          	auipc	a0,0x6
     d28:	96450513          	addi	a0,a0,-1692 # 6688 <malloc+0xa0a>
     d2c:	00005097          	auipc	ra,0x5
     d30:	b6c080e7          	jalr	-1172(ra) # 5898 <unlink>
  unlink("lf2");
     d34:	00006517          	auipc	a0,0x6
     d38:	95c50513          	addi	a0,a0,-1700 # 6690 <malloc+0xa12>
     d3c:	00005097          	auipc	ra,0x5
     d40:	b5c080e7          	jalr	-1188(ra) # 5898 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
     d44:	20200593          	li	a1,514
     d48:	00006517          	auipc	a0,0x6
     d4c:	94050513          	addi	a0,a0,-1728 # 6688 <malloc+0xa0a>
     d50:	00005097          	auipc	ra,0x5
     d54:	b38080e7          	jalr	-1224(ra) # 5888 <open>
  if(fd < 0){
     d58:	10054763          	bltz	a0,e66 <linktest+0x150>
     d5c:	84aa                	mv	s1,a0
  if(write(fd, "hello", SZ) != SZ){
     d5e:	4615                	li	a2,5
     d60:	00006597          	auipc	a1,0x6
     d64:	87858593          	addi	a1,a1,-1928 # 65d8 <malloc+0x95a>
     d68:	00005097          	auipc	ra,0x5
     d6c:	b00080e7          	jalr	-1280(ra) # 5868 <write>
     d70:	4795                	li	a5,5
     d72:	10f51863          	bne	a0,a5,e82 <linktest+0x16c>
  close(fd);
     d76:	8526                	mv	a0,s1
     d78:	00005097          	auipc	ra,0x5
     d7c:	af8080e7          	jalr	-1288(ra) # 5870 <close>
  if(link("lf1", "lf2") < 0){
     d80:	00006597          	auipc	a1,0x6
     d84:	91058593          	addi	a1,a1,-1776 # 6690 <malloc+0xa12>
     d88:	00006517          	auipc	a0,0x6
     d8c:	90050513          	addi	a0,a0,-1792 # 6688 <malloc+0xa0a>
     d90:	00005097          	auipc	ra,0x5
     d94:	b18080e7          	jalr	-1256(ra) # 58a8 <link>
     d98:	10054363          	bltz	a0,e9e <linktest+0x188>
  unlink("lf1");
     d9c:	00006517          	auipc	a0,0x6
     da0:	8ec50513          	addi	a0,a0,-1812 # 6688 <malloc+0xa0a>
     da4:	00005097          	auipc	ra,0x5
     da8:	af4080e7          	jalr	-1292(ra) # 5898 <unlink>
  if(open("lf1", 0) >= 0){
     dac:	4581                	li	a1,0
     dae:	00006517          	auipc	a0,0x6
     db2:	8da50513          	addi	a0,a0,-1830 # 6688 <malloc+0xa0a>
     db6:	00005097          	auipc	ra,0x5
     dba:	ad2080e7          	jalr	-1326(ra) # 5888 <open>
     dbe:	0e055e63          	bgez	a0,eba <linktest+0x1a4>
  fd = open("lf2", 0);
     dc2:	4581                	li	a1,0
     dc4:	00006517          	auipc	a0,0x6
     dc8:	8cc50513          	addi	a0,a0,-1844 # 6690 <malloc+0xa12>
     dcc:	00005097          	auipc	ra,0x5
     dd0:	abc080e7          	jalr	-1348(ra) # 5888 <open>
     dd4:	84aa                	mv	s1,a0
  if(fd < 0){
     dd6:	10054063          	bltz	a0,ed6 <linktest+0x1c0>
  if(read(fd, buf, sizeof(buf)) != SZ){
     dda:	660d                	lui	a2,0x3
     ddc:	0000b597          	auipc	a1,0xb
     de0:	fac58593          	addi	a1,a1,-84 # bd88 <buf>
     de4:	00005097          	auipc	ra,0x5
     de8:	a7c080e7          	jalr	-1412(ra) # 5860 <read>
     dec:	4795                	li	a5,5
     dee:	10f51263          	bne	a0,a5,ef2 <linktest+0x1dc>
  close(fd);
     df2:	8526                	mv	a0,s1
     df4:	00005097          	auipc	ra,0x5
     df8:	a7c080e7          	jalr	-1412(ra) # 5870 <close>
  if(link("lf2", "lf2") >= 0){
     dfc:	00006597          	auipc	a1,0x6
     e00:	89458593          	addi	a1,a1,-1900 # 6690 <malloc+0xa12>
     e04:	852e                	mv	a0,a1
     e06:	00005097          	auipc	ra,0x5
     e0a:	aa2080e7          	jalr	-1374(ra) # 58a8 <link>
     e0e:	10055063          	bgez	a0,f0e <linktest+0x1f8>
  unlink("lf2");
     e12:	00006517          	auipc	a0,0x6
     e16:	87e50513          	addi	a0,a0,-1922 # 6690 <malloc+0xa12>
     e1a:	00005097          	auipc	ra,0x5
     e1e:	a7e080e7          	jalr	-1410(ra) # 5898 <unlink>
  if(link("lf2", "lf1") >= 0){
     e22:	00006597          	auipc	a1,0x6
     e26:	86658593          	addi	a1,a1,-1946 # 6688 <malloc+0xa0a>
     e2a:	00006517          	auipc	a0,0x6
     e2e:	86650513          	addi	a0,a0,-1946 # 6690 <malloc+0xa12>
     e32:	00005097          	auipc	ra,0x5
     e36:	a76080e7          	jalr	-1418(ra) # 58a8 <link>
     e3a:	0e055863          	bgez	a0,f2a <linktest+0x214>
  if(link(".", "lf1") >= 0){
     e3e:	00006597          	auipc	a1,0x6
     e42:	84a58593          	addi	a1,a1,-1974 # 6688 <malloc+0xa0a>
     e46:	00006517          	auipc	a0,0x6
     e4a:	95250513          	addi	a0,a0,-1710 # 6798 <malloc+0xb1a>
     e4e:	00005097          	auipc	ra,0x5
     e52:	a5a080e7          	jalr	-1446(ra) # 58a8 <link>
     e56:	0e055863          	bgez	a0,f46 <linktest+0x230>
}
     e5a:	60e2                	ld	ra,24(sp)
     e5c:	6442                	ld	s0,16(sp)
     e5e:	64a2                	ld	s1,8(sp)
     e60:	6902                	ld	s2,0(sp)
     e62:	6105                	addi	sp,sp,32
     e64:	8082                	ret
    printf("%s: create lf1 failed\n", s);
     e66:	85ca                	mv	a1,s2
     e68:	00006517          	auipc	a0,0x6
     e6c:	83050513          	addi	a0,a0,-2000 # 6698 <malloc+0xa1a>
     e70:	00005097          	auipc	ra,0x5
     e74:	d50080e7          	jalr	-688(ra) # 5bc0 <printf>
    exit(1);
     e78:	4505                	li	a0,1
     e7a:	00005097          	auipc	ra,0x5
     e7e:	9ce080e7          	jalr	-1586(ra) # 5848 <exit>
    printf("%s: write lf1 failed\n", s);
     e82:	85ca                	mv	a1,s2
     e84:	00006517          	auipc	a0,0x6
     e88:	82c50513          	addi	a0,a0,-2004 # 66b0 <malloc+0xa32>
     e8c:	00005097          	auipc	ra,0x5
     e90:	d34080e7          	jalr	-716(ra) # 5bc0 <printf>
    exit(1);
     e94:	4505                	li	a0,1
     e96:	00005097          	auipc	ra,0x5
     e9a:	9b2080e7          	jalr	-1614(ra) # 5848 <exit>
    printf("%s: link lf1 lf2 failed\n", s);
     e9e:	85ca                	mv	a1,s2
     ea0:	00006517          	auipc	a0,0x6
     ea4:	82850513          	addi	a0,a0,-2008 # 66c8 <malloc+0xa4a>
     ea8:	00005097          	auipc	ra,0x5
     eac:	d18080e7          	jalr	-744(ra) # 5bc0 <printf>
    exit(1);
     eb0:	4505                	li	a0,1
     eb2:	00005097          	auipc	ra,0x5
     eb6:	996080e7          	jalr	-1642(ra) # 5848 <exit>
    printf("%s: unlinked lf1 but it is still there!\n", s);
     eba:	85ca                	mv	a1,s2
     ebc:	00006517          	auipc	a0,0x6
     ec0:	82c50513          	addi	a0,a0,-2004 # 66e8 <malloc+0xa6a>
     ec4:	00005097          	auipc	ra,0x5
     ec8:	cfc080e7          	jalr	-772(ra) # 5bc0 <printf>
    exit(1);
     ecc:	4505                	li	a0,1
     ece:	00005097          	auipc	ra,0x5
     ed2:	97a080e7          	jalr	-1670(ra) # 5848 <exit>
    printf("%s: open lf2 failed\n", s);
     ed6:	85ca                	mv	a1,s2
     ed8:	00006517          	auipc	a0,0x6
     edc:	84050513          	addi	a0,a0,-1984 # 6718 <malloc+0xa9a>
     ee0:	00005097          	auipc	ra,0x5
     ee4:	ce0080e7          	jalr	-800(ra) # 5bc0 <printf>
    exit(1);
     ee8:	4505                	li	a0,1
     eea:	00005097          	auipc	ra,0x5
     eee:	95e080e7          	jalr	-1698(ra) # 5848 <exit>
    printf("%s: read lf2 failed\n", s);
     ef2:	85ca                	mv	a1,s2
     ef4:	00006517          	auipc	a0,0x6
     ef8:	83c50513          	addi	a0,a0,-1988 # 6730 <malloc+0xab2>
     efc:	00005097          	auipc	ra,0x5
     f00:	cc4080e7          	jalr	-828(ra) # 5bc0 <printf>
    exit(1);
     f04:	4505                	li	a0,1
     f06:	00005097          	auipc	ra,0x5
     f0a:	942080e7          	jalr	-1726(ra) # 5848 <exit>
    printf("%s: link lf2 lf2 succeeded! oops\n", s);
     f0e:	85ca                	mv	a1,s2
     f10:	00006517          	auipc	a0,0x6
     f14:	83850513          	addi	a0,a0,-1992 # 6748 <malloc+0xaca>
     f18:	00005097          	auipc	ra,0x5
     f1c:	ca8080e7          	jalr	-856(ra) # 5bc0 <printf>
    exit(1);
     f20:	4505                	li	a0,1
     f22:	00005097          	auipc	ra,0x5
     f26:	926080e7          	jalr	-1754(ra) # 5848 <exit>
    printf("%s: link non-existent succeeded! oops\n", s);
     f2a:	85ca                	mv	a1,s2
     f2c:	00006517          	auipc	a0,0x6
     f30:	84450513          	addi	a0,a0,-1980 # 6770 <malloc+0xaf2>
     f34:	00005097          	auipc	ra,0x5
     f38:	c8c080e7          	jalr	-884(ra) # 5bc0 <printf>
    exit(1);
     f3c:	4505                	li	a0,1
     f3e:	00005097          	auipc	ra,0x5
     f42:	90a080e7          	jalr	-1782(ra) # 5848 <exit>
    printf("%s: link . lf1 succeeded! oops\n", s);
     f46:	85ca                	mv	a1,s2
     f48:	00006517          	auipc	a0,0x6
     f4c:	85850513          	addi	a0,a0,-1960 # 67a0 <malloc+0xb22>
     f50:	00005097          	auipc	ra,0x5
     f54:	c70080e7          	jalr	-912(ra) # 5bc0 <printf>
    exit(1);
     f58:	4505                	li	a0,1
     f5a:	00005097          	auipc	ra,0x5
     f5e:	8ee080e7          	jalr	-1810(ra) # 5848 <exit>

0000000000000f62 <bigdir>:
{
     f62:	715d                	addi	sp,sp,-80
     f64:	e486                	sd	ra,72(sp)
     f66:	e0a2                	sd	s0,64(sp)
     f68:	fc26                	sd	s1,56(sp)
     f6a:	f84a                	sd	s2,48(sp)
     f6c:	f44e                	sd	s3,40(sp)
     f6e:	f052                	sd	s4,32(sp)
     f70:	ec56                	sd	s5,24(sp)
     f72:	e85a                	sd	s6,16(sp)
     f74:	0880                	addi	s0,sp,80
     f76:	89aa                	mv	s3,a0
  unlink("bd");
     f78:	00006517          	auipc	a0,0x6
     f7c:	84850513          	addi	a0,a0,-1976 # 67c0 <malloc+0xb42>
     f80:	00005097          	auipc	ra,0x5
     f84:	918080e7          	jalr	-1768(ra) # 5898 <unlink>
  fd = open("bd", O_CREATE);
     f88:	20000593          	li	a1,512
     f8c:	00006517          	auipc	a0,0x6
     f90:	83450513          	addi	a0,a0,-1996 # 67c0 <malloc+0xb42>
     f94:	00005097          	auipc	ra,0x5
     f98:	8f4080e7          	jalr	-1804(ra) # 5888 <open>
  if(fd < 0){
     f9c:	0c054963          	bltz	a0,106e <bigdir+0x10c>
  close(fd);
     fa0:	00005097          	auipc	ra,0x5
     fa4:	8d0080e7          	jalr	-1840(ra) # 5870 <close>
  for(i = 0; i < N; i++){
     fa8:	4901                	li	s2,0
    name[0] = 'x';
     faa:	07800a93          	li	s5,120
    if(link("bd", name) != 0){
     fae:	00006a17          	auipc	s4,0x6
     fb2:	812a0a13          	addi	s4,s4,-2030 # 67c0 <malloc+0xb42>
  for(i = 0; i < N; i++){
     fb6:	1f400b13          	li	s6,500
    name[0] = 'x';
     fba:	fb540823          	sb	s5,-80(s0)
    name[1] = '0' + (i / 64);
     fbe:	41f9579b          	sraiw	a5,s2,0x1f
     fc2:	01a7d71b          	srliw	a4,a5,0x1a
     fc6:	012707bb          	addw	a5,a4,s2
     fca:	4067d69b          	sraiw	a3,a5,0x6
     fce:	0306869b          	addiw	a3,a3,48
     fd2:	fad408a3          	sb	a3,-79(s0)
    name[2] = '0' + (i % 64);
     fd6:	03f7f793          	andi	a5,a5,63
     fda:	9f99                	subw	a5,a5,a4
     fdc:	0307879b          	addiw	a5,a5,48
     fe0:	faf40923          	sb	a5,-78(s0)
    name[3] = '\0';
     fe4:	fa0409a3          	sb	zero,-77(s0)
    if(link("bd", name) != 0){
     fe8:	fb040593          	addi	a1,s0,-80
     fec:	8552                	mv	a0,s4
     fee:	00005097          	auipc	ra,0x5
     ff2:	8ba080e7          	jalr	-1862(ra) # 58a8 <link>
     ff6:	84aa                	mv	s1,a0
     ff8:	e949                	bnez	a0,108a <bigdir+0x128>
  for(i = 0; i < N; i++){
     ffa:	2905                	addiw	s2,s2,1
     ffc:	fb691fe3          	bne	s2,s6,fba <bigdir+0x58>
  unlink("bd");
    1000:	00005517          	auipc	a0,0x5
    1004:	7c050513          	addi	a0,a0,1984 # 67c0 <malloc+0xb42>
    1008:	00005097          	auipc	ra,0x5
    100c:	890080e7          	jalr	-1904(ra) # 5898 <unlink>
    name[0] = 'x';
    1010:	07800913          	li	s2,120
  for(i = 0; i < N; i++){
    1014:	1f400a13          	li	s4,500
    name[0] = 'x';
    1018:	fb240823          	sb	s2,-80(s0)
    name[1] = '0' + (i / 64);
    101c:	41f4d79b          	sraiw	a5,s1,0x1f
    1020:	01a7d71b          	srliw	a4,a5,0x1a
    1024:	009707bb          	addw	a5,a4,s1
    1028:	4067d69b          	sraiw	a3,a5,0x6
    102c:	0306869b          	addiw	a3,a3,48
    1030:	fad408a3          	sb	a3,-79(s0)
    name[2] = '0' + (i % 64);
    1034:	03f7f793          	andi	a5,a5,63
    1038:	9f99                	subw	a5,a5,a4
    103a:	0307879b          	addiw	a5,a5,48
    103e:	faf40923          	sb	a5,-78(s0)
    name[3] = '\0';
    1042:	fa0409a3          	sb	zero,-77(s0)
    if(unlink(name) != 0){
    1046:	fb040513          	addi	a0,s0,-80
    104a:	00005097          	auipc	ra,0x5
    104e:	84e080e7          	jalr	-1970(ra) # 5898 <unlink>
    1052:	ed21                	bnez	a0,10aa <bigdir+0x148>
  for(i = 0; i < N; i++){
    1054:	2485                	addiw	s1,s1,1
    1056:	fd4491e3          	bne	s1,s4,1018 <bigdir+0xb6>
}
    105a:	60a6                	ld	ra,72(sp)
    105c:	6406                	ld	s0,64(sp)
    105e:	74e2                	ld	s1,56(sp)
    1060:	7942                	ld	s2,48(sp)
    1062:	79a2                	ld	s3,40(sp)
    1064:	7a02                	ld	s4,32(sp)
    1066:	6ae2                	ld	s5,24(sp)
    1068:	6b42                	ld	s6,16(sp)
    106a:	6161                	addi	sp,sp,80
    106c:	8082                	ret
    printf("%s: bigdir create failed\n", s);
    106e:	85ce                	mv	a1,s3
    1070:	00005517          	auipc	a0,0x5
    1074:	75850513          	addi	a0,a0,1880 # 67c8 <malloc+0xb4a>
    1078:	00005097          	auipc	ra,0x5
    107c:	b48080e7          	jalr	-1208(ra) # 5bc0 <printf>
    exit(1);
    1080:	4505                	li	a0,1
    1082:	00004097          	auipc	ra,0x4
    1086:	7c6080e7          	jalr	1990(ra) # 5848 <exit>
      printf("%s: bigdir link(bd, %s) failed\n", s, name);
    108a:	fb040613          	addi	a2,s0,-80
    108e:	85ce                	mv	a1,s3
    1090:	00005517          	auipc	a0,0x5
    1094:	75850513          	addi	a0,a0,1880 # 67e8 <malloc+0xb6a>
    1098:	00005097          	auipc	ra,0x5
    109c:	b28080e7          	jalr	-1240(ra) # 5bc0 <printf>
      exit(1);
    10a0:	4505                	li	a0,1
    10a2:	00004097          	auipc	ra,0x4
    10a6:	7a6080e7          	jalr	1958(ra) # 5848 <exit>
      printf("%s: bigdir unlink failed", s);
    10aa:	85ce                	mv	a1,s3
    10ac:	00005517          	auipc	a0,0x5
    10b0:	75c50513          	addi	a0,a0,1884 # 6808 <malloc+0xb8a>
    10b4:	00005097          	auipc	ra,0x5
    10b8:	b0c080e7          	jalr	-1268(ra) # 5bc0 <printf>
      exit(1);
    10bc:	4505                	li	a0,1
    10be:	00004097          	auipc	ra,0x4
    10c2:	78a080e7          	jalr	1930(ra) # 5848 <exit>

00000000000010c6 <validatetest>:
{
    10c6:	7139                	addi	sp,sp,-64
    10c8:	fc06                	sd	ra,56(sp)
    10ca:	f822                	sd	s0,48(sp)
    10cc:	f426                	sd	s1,40(sp)
    10ce:	f04a                	sd	s2,32(sp)
    10d0:	ec4e                	sd	s3,24(sp)
    10d2:	e852                	sd	s4,16(sp)
    10d4:	e456                	sd	s5,8(sp)
    10d6:	e05a                	sd	s6,0(sp)
    10d8:	0080                	addi	s0,sp,64
    10da:	8b2a                	mv	s6,a0
  for(p = 0; p <= (uint)hi; p += PGSIZE){
    10dc:	4481                	li	s1,0
    if(link("nosuchfile", (char*)p) != -1){
    10de:	00005997          	auipc	s3,0x5
    10e2:	74a98993          	addi	s3,s3,1866 # 6828 <malloc+0xbaa>
    10e6:	597d                	li	s2,-1
  for(p = 0; p <= (uint)hi; p += PGSIZE){
    10e8:	6a85                	lui	s5,0x1
    10ea:	00114a37          	lui	s4,0x114
    if(link("nosuchfile", (char*)p) != -1){
    10ee:	85a6                	mv	a1,s1
    10f0:	854e                	mv	a0,s3
    10f2:	00004097          	auipc	ra,0x4
    10f6:	7b6080e7          	jalr	1974(ra) # 58a8 <link>
    10fa:	01251f63          	bne	a0,s2,1118 <validatetest+0x52>
  for(p = 0; p <= (uint)hi; p += PGSIZE){
    10fe:	94d6                	add	s1,s1,s5
    1100:	ff4497e3          	bne	s1,s4,10ee <validatetest+0x28>
}
    1104:	70e2                	ld	ra,56(sp)
    1106:	7442                	ld	s0,48(sp)
    1108:	74a2                	ld	s1,40(sp)
    110a:	7902                	ld	s2,32(sp)
    110c:	69e2                	ld	s3,24(sp)
    110e:	6a42                	ld	s4,16(sp)
    1110:	6aa2                	ld	s5,8(sp)
    1112:	6b02                	ld	s6,0(sp)
    1114:	6121                	addi	sp,sp,64
    1116:	8082                	ret
      printf("%s: link should not succeed\n", s);
    1118:	85da                	mv	a1,s6
    111a:	00005517          	auipc	a0,0x5
    111e:	71e50513          	addi	a0,a0,1822 # 6838 <malloc+0xbba>
    1122:	00005097          	auipc	ra,0x5
    1126:	a9e080e7          	jalr	-1378(ra) # 5bc0 <printf>
      exit(1);
    112a:	4505                	li	a0,1
    112c:	00004097          	auipc	ra,0x4
    1130:	71c080e7          	jalr	1820(ra) # 5848 <exit>

0000000000001134 <pgbug>:
// regression test. copyin(), copyout(), and copyinstr() used to cast
// the virtual page address to uint, which (with certain wild system
// call arguments) resulted in a kernel page faults.
void
pgbug(char *s)
{
    1134:	7179                	addi	sp,sp,-48
    1136:	f406                	sd	ra,40(sp)
    1138:	f022                	sd	s0,32(sp)
    113a:	ec26                	sd	s1,24(sp)
    113c:	1800                	addi	s0,sp,48
  char *argv[1];
  argv[0] = 0;
    113e:	fc043c23          	sd	zero,-40(s0)
  exec((char*)0xeaeb0b5b00002f5e, argv);
    1142:	00007497          	auipc	s1,0x7
    1146:	41e4b483          	ld	s1,1054(s1) # 8560 <__SDATA_BEGIN__>
    114a:	fd840593          	addi	a1,s0,-40
    114e:	8526                	mv	a0,s1
    1150:	00004097          	auipc	ra,0x4
    1154:	730080e7          	jalr	1840(ra) # 5880 <exec>

  pipe((int*)0xeaeb0b5b00002f5e);
    1158:	8526                	mv	a0,s1
    115a:	00004097          	auipc	ra,0x4
    115e:	6fe080e7          	jalr	1790(ra) # 5858 <pipe>

  exit(0);
    1162:	4501                	li	a0,0
    1164:	00004097          	auipc	ra,0x4
    1168:	6e4080e7          	jalr	1764(ra) # 5848 <exit>

000000000000116c <badarg>:

// regression test. test whether exec() leaks memory if one of the
// arguments is invalid. the test passes if the kernel doesn't panic.
void
badarg(char *s)
{
    116c:	7139                	addi	sp,sp,-64
    116e:	fc06                	sd	ra,56(sp)
    1170:	f822                	sd	s0,48(sp)
    1172:	f426                	sd	s1,40(sp)
    1174:	f04a                	sd	s2,32(sp)
    1176:	ec4e                	sd	s3,24(sp)
    1178:	0080                	addi	s0,sp,64
    117a:	64b1                	lui	s1,0xc
    117c:	35048493          	addi	s1,s1,848 # c350 <buf+0x5c8>
  for(int i = 0; i < 50000; i++){
    char *argv[2];
    argv[0] = (char*)0xffffffff;
    1180:	597d                	li	s2,-1
    1182:	02095913          	srli	s2,s2,0x20
    argv[1] = 0;
    exec("echo", argv);
    1186:	00005997          	auipc	s3,0x5
    118a:	f7a98993          	addi	s3,s3,-134 # 6100 <malloc+0x482>
    argv[0] = (char*)0xffffffff;
    118e:	fd243023          	sd	s2,-64(s0)
    argv[1] = 0;
    1192:	fc043423          	sd	zero,-56(s0)
    exec("echo", argv);
    1196:	fc040593          	addi	a1,s0,-64
    119a:	854e                	mv	a0,s3
    119c:	00004097          	auipc	ra,0x4
    11a0:	6e4080e7          	jalr	1764(ra) # 5880 <exec>
  for(int i = 0; i < 50000; i++){
    11a4:	34fd                	addiw	s1,s1,-1
    11a6:	f4e5                	bnez	s1,118e <badarg+0x22>
  }
  
  exit(0);
    11a8:	4501                	li	a0,0
    11aa:	00004097          	auipc	ra,0x4
    11ae:	69e080e7          	jalr	1694(ra) # 5848 <exit>

00000000000011b2 <copyinstr2>:
{
    11b2:	7155                	addi	sp,sp,-208
    11b4:	e586                	sd	ra,200(sp)
    11b6:	e1a2                	sd	s0,192(sp)
    11b8:	0980                	addi	s0,sp,208
  for(int i = 0; i < MAXPATH; i++)
    11ba:	f6840793          	addi	a5,s0,-152
    11be:	fe840693          	addi	a3,s0,-24
    b[i] = 'x';
    11c2:	07800713          	li	a4,120
    11c6:	00e78023          	sb	a4,0(a5)
  for(int i = 0; i < MAXPATH; i++)
    11ca:	0785                	addi	a5,a5,1
    11cc:	fed79de3          	bne	a5,a3,11c6 <copyinstr2+0x14>
  b[MAXPATH] = '\0';
    11d0:	fe040423          	sb	zero,-24(s0)
  int ret = unlink(b);
    11d4:	f6840513          	addi	a0,s0,-152
    11d8:	00004097          	auipc	ra,0x4
    11dc:	6c0080e7          	jalr	1728(ra) # 5898 <unlink>
  if(ret != -1){
    11e0:	57fd                	li	a5,-1
    11e2:	0ef51063          	bne	a0,a5,12c2 <copyinstr2+0x110>
  int fd = open(b, O_CREATE | O_WRONLY);
    11e6:	20100593          	li	a1,513
    11ea:	f6840513          	addi	a0,s0,-152
    11ee:	00004097          	auipc	ra,0x4
    11f2:	69a080e7          	jalr	1690(ra) # 5888 <open>
  if(fd != -1){
    11f6:	57fd                	li	a5,-1
    11f8:	0ef51563          	bne	a0,a5,12e2 <copyinstr2+0x130>
  ret = link(b, b);
    11fc:	f6840593          	addi	a1,s0,-152
    1200:	852e                	mv	a0,a1
    1202:	00004097          	auipc	ra,0x4
    1206:	6a6080e7          	jalr	1702(ra) # 58a8 <link>
  if(ret != -1){
    120a:	57fd                	li	a5,-1
    120c:	0ef51b63          	bne	a0,a5,1302 <copyinstr2+0x150>
  char *args[] = { "xx", 0 };
    1210:	00007797          	auipc	a5,0x7
    1214:	81078793          	addi	a5,a5,-2032 # 7a20 <malloc+0x1da2>
    1218:	f4f43c23          	sd	a5,-168(s0)
    121c:	f6043023          	sd	zero,-160(s0)
  ret = exec(b, args);
    1220:	f5840593          	addi	a1,s0,-168
    1224:	f6840513          	addi	a0,s0,-152
    1228:	00004097          	auipc	ra,0x4
    122c:	658080e7          	jalr	1624(ra) # 5880 <exec>
  if(ret != -1){
    1230:	57fd                	li	a5,-1
    1232:	0ef51963          	bne	a0,a5,1324 <copyinstr2+0x172>
  int pid = fork();
    1236:	00004097          	auipc	ra,0x4
    123a:	60a080e7          	jalr	1546(ra) # 5840 <fork>
  if(pid < 0){
    123e:	10054363          	bltz	a0,1344 <copyinstr2+0x192>
  if(pid == 0){
    1242:	12051463          	bnez	a0,136a <copyinstr2+0x1b8>
    1246:	00007797          	auipc	a5,0x7
    124a:	42a78793          	addi	a5,a5,1066 # 8670 <big.0>
    124e:	00008697          	auipc	a3,0x8
    1252:	42268693          	addi	a3,a3,1058 # 9670 <__global_pointer$+0x910>
      big[i] = 'x';
    1256:	07800713          	li	a4,120
    125a:	00e78023          	sb	a4,0(a5)
    for(int i = 0; i < PGSIZE; i++)
    125e:	0785                	addi	a5,a5,1
    1260:	fed79de3          	bne	a5,a3,125a <copyinstr2+0xa8>
    big[PGSIZE] = '\0';
    1264:	00008797          	auipc	a5,0x8
    1268:	40078623          	sb	zero,1036(a5) # 9670 <__global_pointer$+0x910>
    char *args2[] = { big, big, big, 0 };
    126c:	00007797          	auipc	a5,0x7
    1270:	ec478793          	addi	a5,a5,-316 # 8130 <malloc+0x24b2>
    1274:	6390                	ld	a2,0(a5)
    1276:	6794                	ld	a3,8(a5)
    1278:	6b98                	ld	a4,16(a5)
    127a:	6f9c                	ld	a5,24(a5)
    127c:	f2c43823          	sd	a2,-208(s0)
    1280:	f2d43c23          	sd	a3,-200(s0)
    1284:	f4e43023          	sd	a4,-192(s0)
    1288:	f4f43423          	sd	a5,-184(s0)
    ret = exec("echo", args2);
    128c:	f3040593          	addi	a1,s0,-208
    1290:	00005517          	auipc	a0,0x5
    1294:	e7050513          	addi	a0,a0,-400 # 6100 <malloc+0x482>
    1298:	00004097          	auipc	ra,0x4
    129c:	5e8080e7          	jalr	1512(ra) # 5880 <exec>
    if(ret != -1){
    12a0:	57fd                	li	a5,-1
    12a2:	0af50e63          	beq	a0,a5,135e <copyinstr2+0x1ac>
      printf("exec(echo, BIG) returned %d, not -1\n", fd);
    12a6:	55fd                	li	a1,-1
    12a8:	00005517          	auipc	a0,0x5
    12ac:	63850513          	addi	a0,a0,1592 # 68e0 <malloc+0xc62>
    12b0:	00005097          	auipc	ra,0x5
    12b4:	910080e7          	jalr	-1776(ra) # 5bc0 <printf>
      exit(1);
    12b8:	4505                	li	a0,1
    12ba:	00004097          	auipc	ra,0x4
    12be:	58e080e7          	jalr	1422(ra) # 5848 <exit>
    printf("unlink(%s) returned %d, not -1\n", b, ret);
    12c2:	862a                	mv	a2,a0
    12c4:	f6840593          	addi	a1,s0,-152
    12c8:	00005517          	auipc	a0,0x5
    12cc:	59050513          	addi	a0,a0,1424 # 6858 <malloc+0xbda>
    12d0:	00005097          	auipc	ra,0x5
    12d4:	8f0080e7          	jalr	-1808(ra) # 5bc0 <printf>
    exit(1);
    12d8:	4505                	li	a0,1
    12da:	00004097          	auipc	ra,0x4
    12de:	56e080e7          	jalr	1390(ra) # 5848 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    12e2:	862a                	mv	a2,a0
    12e4:	f6840593          	addi	a1,s0,-152
    12e8:	00005517          	auipc	a0,0x5
    12ec:	59050513          	addi	a0,a0,1424 # 6878 <malloc+0xbfa>
    12f0:	00005097          	auipc	ra,0x5
    12f4:	8d0080e7          	jalr	-1840(ra) # 5bc0 <printf>
    exit(1);
    12f8:	4505                	li	a0,1
    12fa:	00004097          	auipc	ra,0x4
    12fe:	54e080e7          	jalr	1358(ra) # 5848 <exit>
    printf("link(%s, %s) returned %d, not -1\n", b, b, ret);
    1302:	86aa                	mv	a3,a0
    1304:	f6840613          	addi	a2,s0,-152
    1308:	85b2                	mv	a1,a2
    130a:	00005517          	auipc	a0,0x5
    130e:	58e50513          	addi	a0,a0,1422 # 6898 <malloc+0xc1a>
    1312:	00005097          	auipc	ra,0x5
    1316:	8ae080e7          	jalr	-1874(ra) # 5bc0 <printf>
    exit(1);
    131a:	4505                	li	a0,1
    131c:	00004097          	auipc	ra,0x4
    1320:	52c080e7          	jalr	1324(ra) # 5848 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1324:	567d                	li	a2,-1
    1326:	f6840593          	addi	a1,s0,-152
    132a:	00005517          	auipc	a0,0x5
    132e:	59650513          	addi	a0,a0,1430 # 68c0 <malloc+0xc42>
    1332:	00005097          	auipc	ra,0x5
    1336:	88e080e7          	jalr	-1906(ra) # 5bc0 <printf>
    exit(1);
    133a:	4505                	li	a0,1
    133c:	00004097          	auipc	ra,0x4
    1340:	50c080e7          	jalr	1292(ra) # 5848 <exit>
    printf("fork failed\n");
    1344:	00006517          	auipc	a0,0x6
    1348:	a1450513          	addi	a0,a0,-1516 # 6d58 <malloc+0x10da>
    134c:	00005097          	auipc	ra,0x5
    1350:	874080e7          	jalr	-1932(ra) # 5bc0 <printf>
    exit(1);
    1354:	4505                	li	a0,1
    1356:	00004097          	auipc	ra,0x4
    135a:	4f2080e7          	jalr	1266(ra) # 5848 <exit>
    exit(747); // OK
    135e:	2eb00513          	li	a0,747
    1362:	00004097          	auipc	ra,0x4
    1366:	4e6080e7          	jalr	1254(ra) # 5848 <exit>
  int st = 0;
    136a:	f4042a23          	sw	zero,-172(s0)
  wait(&st);
    136e:	f5440513          	addi	a0,s0,-172
    1372:	00004097          	auipc	ra,0x4
    1376:	4de080e7          	jalr	1246(ra) # 5850 <wait>
  if(st != 747){
    137a:	f5442703          	lw	a4,-172(s0)
    137e:	2eb00793          	li	a5,747
    1382:	00f71663          	bne	a4,a5,138e <copyinstr2+0x1dc>
}
    1386:	60ae                	ld	ra,200(sp)
    1388:	640e                	ld	s0,192(sp)
    138a:	6169                	addi	sp,sp,208
    138c:	8082                	ret
    printf("exec(echo, BIG) succeeded, should have failed\n");
    138e:	00005517          	auipc	a0,0x5
    1392:	57a50513          	addi	a0,a0,1402 # 6908 <malloc+0xc8a>
    1396:	00005097          	auipc	ra,0x5
    139a:	82a080e7          	jalr	-2006(ra) # 5bc0 <printf>
    exit(1);
    139e:	4505                	li	a0,1
    13a0:	00004097          	auipc	ra,0x4
    13a4:	4a8080e7          	jalr	1192(ra) # 5848 <exit>

00000000000013a8 <truncate3>:
{
    13a8:	7159                	addi	sp,sp,-112
    13aa:	f486                	sd	ra,104(sp)
    13ac:	f0a2                	sd	s0,96(sp)
    13ae:	eca6                	sd	s1,88(sp)
    13b0:	e8ca                	sd	s2,80(sp)
    13b2:	e4ce                	sd	s3,72(sp)
    13b4:	e0d2                	sd	s4,64(sp)
    13b6:	fc56                	sd	s5,56(sp)
    13b8:	1880                	addi	s0,sp,112
    13ba:	892a                	mv	s2,a0
  close(open("truncfile", O_CREATE|O_TRUNC|O_WRONLY));
    13bc:	60100593          	li	a1,1537
    13c0:	00005517          	auipc	a0,0x5
    13c4:	d9850513          	addi	a0,a0,-616 # 6158 <malloc+0x4da>
    13c8:	00004097          	auipc	ra,0x4
    13cc:	4c0080e7          	jalr	1216(ra) # 5888 <open>
    13d0:	00004097          	auipc	ra,0x4
    13d4:	4a0080e7          	jalr	1184(ra) # 5870 <close>
  pid = fork();
    13d8:	00004097          	auipc	ra,0x4
    13dc:	468080e7          	jalr	1128(ra) # 5840 <fork>
  if(pid < 0){
    13e0:	08054063          	bltz	a0,1460 <truncate3+0xb8>
  if(pid == 0){
    13e4:	e969                	bnez	a0,14b6 <truncate3+0x10e>
    13e6:	06400993          	li	s3,100
      int fd = open("truncfile", O_WRONLY);
    13ea:	00005a17          	auipc	s4,0x5
    13ee:	d6ea0a13          	addi	s4,s4,-658 # 6158 <malloc+0x4da>
      int n = write(fd, "1234567890", 10);
    13f2:	00005a97          	auipc	s5,0x5
    13f6:	576a8a93          	addi	s5,s5,1398 # 6968 <malloc+0xcea>
      int fd = open("truncfile", O_WRONLY);
    13fa:	4585                	li	a1,1
    13fc:	8552                	mv	a0,s4
    13fe:	00004097          	auipc	ra,0x4
    1402:	48a080e7          	jalr	1162(ra) # 5888 <open>
    1406:	84aa                	mv	s1,a0
      if(fd < 0){
    1408:	06054a63          	bltz	a0,147c <truncate3+0xd4>
      int n = write(fd, "1234567890", 10);
    140c:	4629                	li	a2,10
    140e:	85d6                	mv	a1,s5
    1410:	00004097          	auipc	ra,0x4
    1414:	458080e7          	jalr	1112(ra) # 5868 <write>
      if(n != 10){
    1418:	47a9                	li	a5,10
    141a:	06f51f63          	bne	a0,a5,1498 <truncate3+0xf0>
      close(fd);
    141e:	8526                	mv	a0,s1
    1420:	00004097          	auipc	ra,0x4
    1424:	450080e7          	jalr	1104(ra) # 5870 <close>
      fd = open("truncfile", O_RDONLY);
    1428:	4581                	li	a1,0
    142a:	8552                	mv	a0,s4
    142c:	00004097          	auipc	ra,0x4
    1430:	45c080e7          	jalr	1116(ra) # 5888 <open>
    1434:	84aa                	mv	s1,a0
      read(fd, buf, sizeof(buf));
    1436:	02000613          	li	a2,32
    143a:	f9840593          	addi	a1,s0,-104
    143e:	00004097          	auipc	ra,0x4
    1442:	422080e7          	jalr	1058(ra) # 5860 <read>
      close(fd);
    1446:	8526                	mv	a0,s1
    1448:	00004097          	auipc	ra,0x4
    144c:	428080e7          	jalr	1064(ra) # 5870 <close>
    for(int i = 0; i < 100; i++){
    1450:	39fd                	addiw	s3,s3,-1
    1452:	fa0994e3          	bnez	s3,13fa <truncate3+0x52>
    exit(0);
    1456:	4501                	li	a0,0
    1458:	00004097          	auipc	ra,0x4
    145c:	3f0080e7          	jalr	1008(ra) # 5848 <exit>
    printf("%s: fork failed\n", s);
    1460:	85ca                	mv	a1,s2
    1462:	00005517          	auipc	a0,0x5
    1466:	4d650513          	addi	a0,a0,1238 # 6938 <malloc+0xcba>
    146a:	00004097          	auipc	ra,0x4
    146e:	756080e7          	jalr	1878(ra) # 5bc0 <printf>
    exit(1);
    1472:	4505                	li	a0,1
    1474:	00004097          	auipc	ra,0x4
    1478:	3d4080e7          	jalr	980(ra) # 5848 <exit>
        printf("%s: open failed\n", s);
    147c:	85ca                	mv	a1,s2
    147e:	00005517          	auipc	a0,0x5
    1482:	4d250513          	addi	a0,a0,1234 # 6950 <malloc+0xcd2>
    1486:	00004097          	auipc	ra,0x4
    148a:	73a080e7          	jalr	1850(ra) # 5bc0 <printf>
        exit(1);
    148e:	4505                	li	a0,1
    1490:	00004097          	auipc	ra,0x4
    1494:	3b8080e7          	jalr	952(ra) # 5848 <exit>
        printf("%s: write got %d, expected 10\n", s, n);
    1498:	862a                	mv	a2,a0
    149a:	85ca                	mv	a1,s2
    149c:	00005517          	auipc	a0,0x5
    14a0:	4dc50513          	addi	a0,a0,1244 # 6978 <malloc+0xcfa>
    14a4:	00004097          	auipc	ra,0x4
    14a8:	71c080e7          	jalr	1820(ra) # 5bc0 <printf>
        exit(1);
    14ac:	4505                	li	a0,1
    14ae:	00004097          	auipc	ra,0x4
    14b2:	39a080e7          	jalr	922(ra) # 5848 <exit>
    14b6:	09600993          	li	s3,150
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    14ba:	00005a17          	auipc	s4,0x5
    14be:	c9ea0a13          	addi	s4,s4,-866 # 6158 <malloc+0x4da>
    int n = write(fd, "xxx", 3);
    14c2:	00005a97          	auipc	s5,0x5
    14c6:	4d6a8a93          	addi	s5,s5,1238 # 6998 <malloc+0xd1a>
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    14ca:	60100593          	li	a1,1537
    14ce:	8552                	mv	a0,s4
    14d0:	00004097          	auipc	ra,0x4
    14d4:	3b8080e7          	jalr	952(ra) # 5888 <open>
    14d8:	84aa                	mv	s1,a0
    if(fd < 0){
    14da:	04054763          	bltz	a0,1528 <truncate3+0x180>
    int n = write(fd, "xxx", 3);
    14de:	460d                	li	a2,3
    14e0:	85d6                	mv	a1,s5
    14e2:	00004097          	auipc	ra,0x4
    14e6:	386080e7          	jalr	902(ra) # 5868 <write>
    if(n != 3){
    14ea:	478d                	li	a5,3
    14ec:	04f51c63          	bne	a0,a5,1544 <truncate3+0x19c>
    close(fd);
    14f0:	8526                	mv	a0,s1
    14f2:	00004097          	auipc	ra,0x4
    14f6:	37e080e7          	jalr	894(ra) # 5870 <close>
  for(int i = 0; i < 150; i++){
    14fa:	39fd                	addiw	s3,s3,-1
    14fc:	fc0997e3          	bnez	s3,14ca <truncate3+0x122>
  wait(&xstatus);
    1500:	fbc40513          	addi	a0,s0,-68
    1504:	00004097          	auipc	ra,0x4
    1508:	34c080e7          	jalr	844(ra) # 5850 <wait>
  unlink("truncfile");
    150c:	00005517          	auipc	a0,0x5
    1510:	c4c50513          	addi	a0,a0,-948 # 6158 <malloc+0x4da>
    1514:	00004097          	auipc	ra,0x4
    1518:	384080e7          	jalr	900(ra) # 5898 <unlink>
  exit(xstatus);
    151c:	fbc42503          	lw	a0,-68(s0)
    1520:	00004097          	auipc	ra,0x4
    1524:	328080e7          	jalr	808(ra) # 5848 <exit>
      printf("%s: open failed\n", s);
    1528:	85ca                	mv	a1,s2
    152a:	00005517          	auipc	a0,0x5
    152e:	42650513          	addi	a0,a0,1062 # 6950 <malloc+0xcd2>
    1532:	00004097          	auipc	ra,0x4
    1536:	68e080e7          	jalr	1678(ra) # 5bc0 <printf>
      exit(1);
    153a:	4505                	li	a0,1
    153c:	00004097          	auipc	ra,0x4
    1540:	30c080e7          	jalr	780(ra) # 5848 <exit>
      printf("%s: write got %d, expected 3\n", s, n);
    1544:	862a                	mv	a2,a0
    1546:	85ca                	mv	a1,s2
    1548:	00005517          	auipc	a0,0x5
    154c:	45850513          	addi	a0,a0,1112 # 69a0 <malloc+0xd22>
    1550:	00004097          	auipc	ra,0x4
    1554:	670080e7          	jalr	1648(ra) # 5bc0 <printf>
      exit(1);
    1558:	4505                	li	a0,1
    155a:	00004097          	auipc	ra,0x4
    155e:	2ee080e7          	jalr	750(ra) # 5848 <exit>

0000000000001562 <exectest>:
{
    1562:	715d                	addi	sp,sp,-80
    1564:	e486                	sd	ra,72(sp)
    1566:	e0a2                	sd	s0,64(sp)
    1568:	fc26                	sd	s1,56(sp)
    156a:	f84a                	sd	s2,48(sp)
    156c:	0880                	addi	s0,sp,80
    156e:	892a                	mv	s2,a0
  char *echoargv[] = { "echo", "OK", 0 };
    1570:	00005797          	auipc	a5,0x5
    1574:	b9078793          	addi	a5,a5,-1136 # 6100 <malloc+0x482>
    1578:	fcf43023          	sd	a5,-64(s0)
    157c:	00005797          	auipc	a5,0x5
    1580:	44478793          	addi	a5,a5,1092 # 69c0 <malloc+0xd42>
    1584:	fcf43423          	sd	a5,-56(s0)
    1588:	fc043823          	sd	zero,-48(s0)
  unlink("echo-ok");
    158c:	00005517          	auipc	a0,0x5
    1590:	43c50513          	addi	a0,a0,1084 # 69c8 <malloc+0xd4a>
    1594:	00004097          	auipc	ra,0x4
    1598:	304080e7          	jalr	772(ra) # 5898 <unlink>
  pid = fork();
    159c:	00004097          	auipc	ra,0x4
    15a0:	2a4080e7          	jalr	676(ra) # 5840 <fork>
  if(pid < 0) {
    15a4:	04054663          	bltz	a0,15f0 <exectest+0x8e>
    15a8:	84aa                	mv	s1,a0
  if(pid == 0) {
    15aa:	e959                	bnez	a0,1640 <exectest+0xde>
    close(1);
    15ac:	4505                	li	a0,1
    15ae:	00004097          	auipc	ra,0x4
    15b2:	2c2080e7          	jalr	706(ra) # 5870 <close>
    fd = open("echo-ok", O_CREATE|O_WRONLY);
    15b6:	20100593          	li	a1,513
    15ba:	00005517          	auipc	a0,0x5
    15be:	40e50513          	addi	a0,a0,1038 # 69c8 <malloc+0xd4a>
    15c2:	00004097          	auipc	ra,0x4
    15c6:	2c6080e7          	jalr	710(ra) # 5888 <open>
    if(fd < 0) {
    15ca:	04054163          	bltz	a0,160c <exectest+0xaa>
    if(fd != 1) {
    15ce:	4785                	li	a5,1
    15d0:	04f50c63          	beq	a0,a5,1628 <exectest+0xc6>
      printf("%s: wrong fd\n", s);
    15d4:	85ca                	mv	a1,s2
    15d6:	00005517          	auipc	a0,0x5
    15da:	41250513          	addi	a0,a0,1042 # 69e8 <malloc+0xd6a>
    15de:	00004097          	auipc	ra,0x4
    15e2:	5e2080e7          	jalr	1506(ra) # 5bc0 <printf>
      exit(1);
    15e6:	4505                	li	a0,1
    15e8:	00004097          	auipc	ra,0x4
    15ec:	260080e7          	jalr	608(ra) # 5848 <exit>
     printf("%s: fork failed\n", s);
    15f0:	85ca                	mv	a1,s2
    15f2:	00005517          	auipc	a0,0x5
    15f6:	34650513          	addi	a0,a0,838 # 6938 <malloc+0xcba>
    15fa:	00004097          	auipc	ra,0x4
    15fe:	5c6080e7          	jalr	1478(ra) # 5bc0 <printf>
     exit(1);
    1602:	4505                	li	a0,1
    1604:	00004097          	auipc	ra,0x4
    1608:	244080e7          	jalr	580(ra) # 5848 <exit>
      printf("%s: create failed\n", s);
    160c:	85ca                	mv	a1,s2
    160e:	00005517          	auipc	a0,0x5
    1612:	3c250513          	addi	a0,a0,962 # 69d0 <malloc+0xd52>
    1616:	00004097          	auipc	ra,0x4
    161a:	5aa080e7          	jalr	1450(ra) # 5bc0 <printf>
      exit(1);
    161e:	4505                	li	a0,1
    1620:	00004097          	auipc	ra,0x4
    1624:	228080e7          	jalr	552(ra) # 5848 <exit>
    if(exec("echo", echoargv) < 0){
    1628:	fc040593          	addi	a1,s0,-64
    162c:	00005517          	auipc	a0,0x5
    1630:	ad450513          	addi	a0,a0,-1324 # 6100 <malloc+0x482>
    1634:	00004097          	auipc	ra,0x4
    1638:	24c080e7          	jalr	588(ra) # 5880 <exec>
    163c:	02054163          	bltz	a0,165e <exectest+0xfc>
  if (wait(&xstatus) != pid) {
    1640:	fdc40513          	addi	a0,s0,-36
    1644:	00004097          	auipc	ra,0x4
    1648:	20c080e7          	jalr	524(ra) # 5850 <wait>
    164c:	02951763          	bne	a0,s1,167a <exectest+0x118>
  if(xstatus != 0)
    1650:	fdc42503          	lw	a0,-36(s0)
    1654:	cd0d                	beqz	a0,168e <exectest+0x12c>
    exit(xstatus);
    1656:	00004097          	auipc	ra,0x4
    165a:	1f2080e7          	jalr	498(ra) # 5848 <exit>
      printf("%s: exec echo failed\n", s);
    165e:	85ca                	mv	a1,s2
    1660:	00005517          	auipc	a0,0x5
    1664:	39850513          	addi	a0,a0,920 # 69f8 <malloc+0xd7a>
    1668:	00004097          	auipc	ra,0x4
    166c:	558080e7          	jalr	1368(ra) # 5bc0 <printf>
      exit(1);
    1670:	4505                	li	a0,1
    1672:	00004097          	auipc	ra,0x4
    1676:	1d6080e7          	jalr	470(ra) # 5848 <exit>
    printf("%s: wait failed!\n", s);
    167a:	85ca                	mv	a1,s2
    167c:	00005517          	auipc	a0,0x5
    1680:	39450513          	addi	a0,a0,916 # 6a10 <malloc+0xd92>
    1684:	00004097          	auipc	ra,0x4
    1688:	53c080e7          	jalr	1340(ra) # 5bc0 <printf>
    168c:	b7d1                	j	1650 <exectest+0xee>
  fd = open("echo-ok", O_RDONLY);
    168e:	4581                	li	a1,0
    1690:	00005517          	auipc	a0,0x5
    1694:	33850513          	addi	a0,a0,824 # 69c8 <malloc+0xd4a>
    1698:	00004097          	auipc	ra,0x4
    169c:	1f0080e7          	jalr	496(ra) # 5888 <open>
  if(fd < 0) {
    16a0:	02054a63          	bltz	a0,16d4 <exectest+0x172>
  if (read(fd, buf, 2) != 2) {
    16a4:	4609                	li	a2,2
    16a6:	fb840593          	addi	a1,s0,-72
    16aa:	00004097          	auipc	ra,0x4
    16ae:	1b6080e7          	jalr	438(ra) # 5860 <read>
    16b2:	4789                	li	a5,2
    16b4:	02f50e63          	beq	a0,a5,16f0 <exectest+0x18e>
    printf("%s: read failed\n", s);
    16b8:	85ca                	mv	a1,s2
    16ba:	00005517          	auipc	a0,0x5
    16be:	dd650513          	addi	a0,a0,-554 # 6490 <malloc+0x812>
    16c2:	00004097          	auipc	ra,0x4
    16c6:	4fe080e7          	jalr	1278(ra) # 5bc0 <printf>
    exit(1);
    16ca:	4505                	li	a0,1
    16cc:	00004097          	auipc	ra,0x4
    16d0:	17c080e7          	jalr	380(ra) # 5848 <exit>
    printf("%s: open failed\n", s);
    16d4:	85ca                	mv	a1,s2
    16d6:	00005517          	auipc	a0,0x5
    16da:	27a50513          	addi	a0,a0,634 # 6950 <malloc+0xcd2>
    16de:	00004097          	auipc	ra,0x4
    16e2:	4e2080e7          	jalr	1250(ra) # 5bc0 <printf>
    exit(1);
    16e6:	4505                	li	a0,1
    16e8:	00004097          	auipc	ra,0x4
    16ec:	160080e7          	jalr	352(ra) # 5848 <exit>
  unlink("echo-ok");
    16f0:	00005517          	auipc	a0,0x5
    16f4:	2d850513          	addi	a0,a0,728 # 69c8 <malloc+0xd4a>
    16f8:	00004097          	auipc	ra,0x4
    16fc:	1a0080e7          	jalr	416(ra) # 5898 <unlink>
  if(buf[0] == 'O' && buf[1] == 'K')
    1700:	fb844703          	lbu	a4,-72(s0)
    1704:	04f00793          	li	a5,79
    1708:	00f71863          	bne	a4,a5,1718 <exectest+0x1b6>
    170c:	fb944703          	lbu	a4,-71(s0)
    1710:	04b00793          	li	a5,75
    1714:	02f70063          	beq	a4,a5,1734 <exectest+0x1d2>
    printf("%s: wrong output\n", s);
    1718:	85ca                	mv	a1,s2
    171a:	00005517          	auipc	a0,0x5
    171e:	30e50513          	addi	a0,a0,782 # 6a28 <malloc+0xdaa>
    1722:	00004097          	auipc	ra,0x4
    1726:	49e080e7          	jalr	1182(ra) # 5bc0 <printf>
    exit(1);
    172a:	4505                	li	a0,1
    172c:	00004097          	auipc	ra,0x4
    1730:	11c080e7          	jalr	284(ra) # 5848 <exit>
    exit(0);
    1734:	4501                	li	a0,0
    1736:	00004097          	auipc	ra,0x4
    173a:	112080e7          	jalr	274(ra) # 5848 <exit>

000000000000173e <pipe1>:
{
    173e:	711d                	addi	sp,sp,-96
    1740:	ec86                	sd	ra,88(sp)
    1742:	e8a2                	sd	s0,80(sp)
    1744:	e4a6                	sd	s1,72(sp)
    1746:	e0ca                	sd	s2,64(sp)
    1748:	fc4e                	sd	s3,56(sp)
    174a:	f852                	sd	s4,48(sp)
    174c:	f456                	sd	s5,40(sp)
    174e:	f05a                	sd	s6,32(sp)
    1750:	ec5e                	sd	s7,24(sp)
    1752:	1080                	addi	s0,sp,96
    1754:	892a                	mv	s2,a0
  if(pipe(fds) != 0){
    1756:	fa840513          	addi	a0,s0,-88
    175a:	00004097          	auipc	ra,0x4
    175e:	0fe080e7          	jalr	254(ra) # 5858 <pipe>
    1762:	ed25                	bnez	a0,17da <pipe1+0x9c>
    1764:	84aa                	mv	s1,a0
  pid = fork();
    1766:	00004097          	auipc	ra,0x4
    176a:	0da080e7          	jalr	218(ra) # 5840 <fork>
    176e:	8a2a                	mv	s4,a0
  if(pid == 0){
    1770:	c159                	beqz	a0,17f6 <pipe1+0xb8>
  } else if(pid > 0){
    1772:	16a05e63          	blez	a0,18ee <pipe1+0x1b0>
    close(fds[1]);
    1776:	fac42503          	lw	a0,-84(s0)
    177a:	00004097          	auipc	ra,0x4
    177e:	0f6080e7          	jalr	246(ra) # 5870 <close>
    total = 0;
    1782:	8a26                	mv	s4,s1
    cc = 1;
    1784:	4985                	li	s3,1
    while((n = read(fds[0], buf, cc)) > 0){
    1786:	0000aa97          	auipc	s5,0xa
    178a:	602a8a93          	addi	s5,s5,1538 # bd88 <buf>
      if(cc > sizeof(buf))
    178e:	6b0d                	lui	s6,0x3
    while((n = read(fds[0], buf, cc)) > 0){
    1790:	864e                	mv	a2,s3
    1792:	85d6                	mv	a1,s5
    1794:	fa842503          	lw	a0,-88(s0)
    1798:	00004097          	auipc	ra,0x4
    179c:	0c8080e7          	jalr	200(ra) # 5860 <read>
    17a0:	10a05263          	blez	a0,18a4 <pipe1+0x166>
      for(i = 0; i < n; i++){
    17a4:	0000a717          	auipc	a4,0xa
    17a8:	5e470713          	addi	a4,a4,1508 # bd88 <buf>
    17ac:	00a4863b          	addw	a2,s1,a0
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    17b0:	00074683          	lbu	a3,0(a4)
    17b4:	0ff4f793          	andi	a5,s1,255
    17b8:	2485                	addiw	s1,s1,1
    17ba:	0cf69163          	bne	a3,a5,187c <pipe1+0x13e>
      for(i = 0; i < n; i++){
    17be:	0705                	addi	a4,a4,1
    17c0:	fec498e3          	bne	s1,a2,17b0 <pipe1+0x72>
      total += n;
    17c4:	00aa0a3b          	addw	s4,s4,a0
      cc = cc * 2;
    17c8:	0019979b          	slliw	a5,s3,0x1
    17cc:	0007899b          	sext.w	s3,a5
      if(cc > sizeof(buf))
    17d0:	013b7363          	bgeu	s6,s3,17d6 <pipe1+0x98>
        cc = sizeof(buf);
    17d4:	89da                	mv	s3,s6
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    17d6:	84b2                	mv	s1,a2
    17d8:	bf65                	j	1790 <pipe1+0x52>
    printf("%s: pipe() failed\n", s);
    17da:	85ca                	mv	a1,s2
    17dc:	00005517          	auipc	a0,0x5
    17e0:	26450513          	addi	a0,a0,612 # 6a40 <malloc+0xdc2>
    17e4:	00004097          	auipc	ra,0x4
    17e8:	3dc080e7          	jalr	988(ra) # 5bc0 <printf>
    exit(1);
    17ec:	4505                	li	a0,1
    17ee:	00004097          	auipc	ra,0x4
    17f2:	05a080e7          	jalr	90(ra) # 5848 <exit>
    close(fds[0]);
    17f6:	fa842503          	lw	a0,-88(s0)
    17fa:	00004097          	auipc	ra,0x4
    17fe:	076080e7          	jalr	118(ra) # 5870 <close>
    for(n = 0; n < N; n++){
    1802:	0000ab17          	auipc	s6,0xa
    1806:	586b0b13          	addi	s6,s6,1414 # bd88 <buf>
    180a:	416004bb          	negw	s1,s6
    180e:	0ff4f493          	andi	s1,s1,255
    1812:	409b0993          	addi	s3,s6,1033
      if(write(fds[1], buf, SZ) != SZ){
    1816:	8bda                	mv	s7,s6
    for(n = 0; n < N; n++){
    1818:	6a85                	lui	s5,0x1
    181a:	42da8a93          	addi	s5,s5,1069 # 142d <truncate3+0x85>
{
    181e:	87da                	mv	a5,s6
        buf[i] = seq++;
    1820:	0097873b          	addw	a4,a5,s1
    1824:	00e78023          	sb	a4,0(a5)
      for(i = 0; i < SZ; i++)
    1828:	0785                	addi	a5,a5,1
    182a:	fef99be3          	bne	s3,a5,1820 <pipe1+0xe2>
        buf[i] = seq++;
    182e:	409a0a1b          	addiw	s4,s4,1033
      if(write(fds[1], buf, SZ) != SZ){
    1832:	40900613          	li	a2,1033
    1836:	85de                	mv	a1,s7
    1838:	fac42503          	lw	a0,-84(s0)
    183c:	00004097          	auipc	ra,0x4
    1840:	02c080e7          	jalr	44(ra) # 5868 <write>
    1844:	40900793          	li	a5,1033
    1848:	00f51c63          	bne	a0,a5,1860 <pipe1+0x122>
    for(n = 0; n < N; n++){
    184c:	24a5                	addiw	s1,s1,9
    184e:	0ff4f493          	andi	s1,s1,255
    1852:	fd5a16e3          	bne	s4,s5,181e <pipe1+0xe0>
    exit(0);
    1856:	4501                	li	a0,0
    1858:	00004097          	auipc	ra,0x4
    185c:	ff0080e7          	jalr	-16(ra) # 5848 <exit>
        printf("%s: pipe1 oops 1\n", s);
    1860:	85ca                	mv	a1,s2
    1862:	00005517          	auipc	a0,0x5
    1866:	1f650513          	addi	a0,a0,502 # 6a58 <malloc+0xdda>
    186a:	00004097          	auipc	ra,0x4
    186e:	356080e7          	jalr	854(ra) # 5bc0 <printf>
        exit(1);
    1872:	4505                	li	a0,1
    1874:	00004097          	auipc	ra,0x4
    1878:	fd4080e7          	jalr	-44(ra) # 5848 <exit>
          printf("%s: pipe1 oops 2\n", s);
    187c:	85ca                	mv	a1,s2
    187e:	00005517          	auipc	a0,0x5
    1882:	1f250513          	addi	a0,a0,498 # 6a70 <malloc+0xdf2>
    1886:	00004097          	auipc	ra,0x4
    188a:	33a080e7          	jalr	826(ra) # 5bc0 <printf>
}
    188e:	60e6                	ld	ra,88(sp)
    1890:	6446                	ld	s0,80(sp)
    1892:	64a6                	ld	s1,72(sp)
    1894:	6906                	ld	s2,64(sp)
    1896:	79e2                	ld	s3,56(sp)
    1898:	7a42                	ld	s4,48(sp)
    189a:	7aa2                	ld	s5,40(sp)
    189c:	7b02                	ld	s6,32(sp)
    189e:	6be2                	ld	s7,24(sp)
    18a0:	6125                	addi	sp,sp,96
    18a2:	8082                	ret
    if(total != N * SZ){
    18a4:	6785                	lui	a5,0x1
    18a6:	42d78793          	addi	a5,a5,1069 # 142d <truncate3+0x85>
    18aa:	02fa0063          	beq	s4,a5,18ca <pipe1+0x18c>
      printf("%s: pipe1 oops 3 total %d\n", total);
    18ae:	85d2                	mv	a1,s4
    18b0:	00005517          	auipc	a0,0x5
    18b4:	1d850513          	addi	a0,a0,472 # 6a88 <malloc+0xe0a>
    18b8:	00004097          	auipc	ra,0x4
    18bc:	308080e7          	jalr	776(ra) # 5bc0 <printf>
      exit(1);
    18c0:	4505                	li	a0,1
    18c2:	00004097          	auipc	ra,0x4
    18c6:	f86080e7          	jalr	-122(ra) # 5848 <exit>
    close(fds[0]);
    18ca:	fa842503          	lw	a0,-88(s0)
    18ce:	00004097          	auipc	ra,0x4
    18d2:	fa2080e7          	jalr	-94(ra) # 5870 <close>
    wait(&xstatus);
    18d6:	fa440513          	addi	a0,s0,-92
    18da:	00004097          	auipc	ra,0x4
    18de:	f76080e7          	jalr	-138(ra) # 5850 <wait>
    exit(xstatus);
    18e2:	fa442503          	lw	a0,-92(s0)
    18e6:	00004097          	auipc	ra,0x4
    18ea:	f62080e7          	jalr	-158(ra) # 5848 <exit>
    printf("%s: fork() failed\n", s);
    18ee:	85ca                	mv	a1,s2
    18f0:	00005517          	auipc	a0,0x5
    18f4:	1b850513          	addi	a0,a0,440 # 6aa8 <malloc+0xe2a>
    18f8:	00004097          	auipc	ra,0x4
    18fc:	2c8080e7          	jalr	712(ra) # 5bc0 <printf>
    exit(1);
    1900:	4505                	li	a0,1
    1902:	00004097          	auipc	ra,0x4
    1906:	f46080e7          	jalr	-186(ra) # 5848 <exit>

000000000000190a <exitwait>:
{
    190a:	7139                	addi	sp,sp,-64
    190c:	fc06                	sd	ra,56(sp)
    190e:	f822                	sd	s0,48(sp)
    1910:	f426                	sd	s1,40(sp)
    1912:	f04a                	sd	s2,32(sp)
    1914:	ec4e                	sd	s3,24(sp)
    1916:	e852                	sd	s4,16(sp)
    1918:	0080                	addi	s0,sp,64
    191a:	8a2a                	mv	s4,a0
  for(i = 0; i < 100; i++){
    191c:	4901                	li	s2,0
    191e:	06400993          	li	s3,100
    pid = fork();
    1922:	00004097          	auipc	ra,0x4
    1926:	f1e080e7          	jalr	-226(ra) # 5840 <fork>
    192a:	84aa                	mv	s1,a0
    if(pid < 0){
    192c:	02054a63          	bltz	a0,1960 <exitwait+0x56>
    if(pid){
    1930:	c151                	beqz	a0,19b4 <exitwait+0xaa>
      if(wait(&xstate) != pid){
    1932:	fcc40513          	addi	a0,s0,-52
    1936:	00004097          	auipc	ra,0x4
    193a:	f1a080e7          	jalr	-230(ra) # 5850 <wait>
    193e:	02951f63          	bne	a0,s1,197c <exitwait+0x72>
      if(i != xstate) {
    1942:	fcc42783          	lw	a5,-52(s0)
    1946:	05279963          	bne	a5,s2,1998 <exitwait+0x8e>
  for(i = 0; i < 100; i++){
    194a:	2905                	addiw	s2,s2,1
    194c:	fd391be3          	bne	s2,s3,1922 <exitwait+0x18>
}
    1950:	70e2                	ld	ra,56(sp)
    1952:	7442                	ld	s0,48(sp)
    1954:	74a2                	ld	s1,40(sp)
    1956:	7902                	ld	s2,32(sp)
    1958:	69e2                	ld	s3,24(sp)
    195a:	6a42                	ld	s4,16(sp)
    195c:	6121                	addi	sp,sp,64
    195e:	8082                	ret
      printf("%s: fork failed\n", s);
    1960:	85d2                	mv	a1,s4
    1962:	00005517          	auipc	a0,0x5
    1966:	fd650513          	addi	a0,a0,-42 # 6938 <malloc+0xcba>
    196a:	00004097          	auipc	ra,0x4
    196e:	256080e7          	jalr	598(ra) # 5bc0 <printf>
      exit(1);
    1972:	4505                	li	a0,1
    1974:	00004097          	auipc	ra,0x4
    1978:	ed4080e7          	jalr	-300(ra) # 5848 <exit>
        printf("%s: wait wrong pid\n", s);
    197c:	85d2                	mv	a1,s4
    197e:	00005517          	auipc	a0,0x5
    1982:	14250513          	addi	a0,a0,322 # 6ac0 <malloc+0xe42>
    1986:	00004097          	auipc	ra,0x4
    198a:	23a080e7          	jalr	570(ra) # 5bc0 <printf>
        exit(1);
    198e:	4505                	li	a0,1
    1990:	00004097          	auipc	ra,0x4
    1994:	eb8080e7          	jalr	-328(ra) # 5848 <exit>
        printf("%s: wait wrong exit status\n", s);
    1998:	85d2                	mv	a1,s4
    199a:	00005517          	auipc	a0,0x5
    199e:	13e50513          	addi	a0,a0,318 # 6ad8 <malloc+0xe5a>
    19a2:	00004097          	auipc	ra,0x4
    19a6:	21e080e7          	jalr	542(ra) # 5bc0 <printf>
        exit(1);
    19aa:	4505                	li	a0,1
    19ac:	00004097          	auipc	ra,0x4
    19b0:	e9c080e7          	jalr	-356(ra) # 5848 <exit>
      exit(i);
    19b4:	854a                	mv	a0,s2
    19b6:	00004097          	auipc	ra,0x4
    19ba:	e92080e7          	jalr	-366(ra) # 5848 <exit>

00000000000019be <twochildren>:
{
    19be:	1101                	addi	sp,sp,-32
    19c0:	ec06                	sd	ra,24(sp)
    19c2:	e822                	sd	s0,16(sp)
    19c4:	e426                	sd	s1,8(sp)
    19c6:	e04a                	sd	s2,0(sp)
    19c8:	1000                	addi	s0,sp,32
    19ca:	892a                	mv	s2,a0
    19cc:	3e800493          	li	s1,1000
    int pid1 = fork();
    19d0:	00004097          	auipc	ra,0x4
    19d4:	e70080e7          	jalr	-400(ra) # 5840 <fork>
    if(pid1 < 0){
    19d8:	02054c63          	bltz	a0,1a10 <twochildren+0x52>
    if(pid1 == 0){
    19dc:	c921                	beqz	a0,1a2c <twochildren+0x6e>
      int pid2 = fork();
    19de:	00004097          	auipc	ra,0x4
    19e2:	e62080e7          	jalr	-414(ra) # 5840 <fork>
      if(pid2 < 0){
    19e6:	04054763          	bltz	a0,1a34 <twochildren+0x76>
      if(pid2 == 0){
    19ea:	c13d                	beqz	a0,1a50 <twochildren+0x92>
        wait(0);
    19ec:	4501                	li	a0,0
    19ee:	00004097          	auipc	ra,0x4
    19f2:	e62080e7          	jalr	-414(ra) # 5850 <wait>
        wait(0);
    19f6:	4501                	li	a0,0
    19f8:	00004097          	auipc	ra,0x4
    19fc:	e58080e7          	jalr	-424(ra) # 5850 <wait>
  for(int i = 0; i < 1000; i++){
    1a00:	34fd                	addiw	s1,s1,-1
    1a02:	f4f9                	bnez	s1,19d0 <twochildren+0x12>
}
    1a04:	60e2                	ld	ra,24(sp)
    1a06:	6442                	ld	s0,16(sp)
    1a08:	64a2                	ld	s1,8(sp)
    1a0a:	6902                	ld	s2,0(sp)
    1a0c:	6105                	addi	sp,sp,32
    1a0e:	8082                	ret
      printf("%s: fork failed\n", s);
    1a10:	85ca                	mv	a1,s2
    1a12:	00005517          	auipc	a0,0x5
    1a16:	f2650513          	addi	a0,a0,-218 # 6938 <malloc+0xcba>
    1a1a:	00004097          	auipc	ra,0x4
    1a1e:	1a6080e7          	jalr	422(ra) # 5bc0 <printf>
      exit(1);
    1a22:	4505                	li	a0,1
    1a24:	00004097          	auipc	ra,0x4
    1a28:	e24080e7          	jalr	-476(ra) # 5848 <exit>
      exit(0);
    1a2c:	00004097          	auipc	ra,0x4
    1a30:	e1c080e7          	jalr	-484(ra) # 5848 <exit>
        printf("%s: fork failed\n", s);
    1a34:	85ca                	mv	a1,s2
    1a36:	00005517          	auipc	a0,0x5
    1a3a:	f0250513          	addi	a0,a0,-254 # 6938 <malloc+0xcba>
    1a3e:	00004097          	auipc	ra,0x4
    1a42:	182080e7          	jalr	386(ra) # 5bc0 <printf>
        exit(1);
    1a46:	4505                	li	a0,1
    1a48:	00004097          	auipc	ra,0x4
    1a4c:	e00080e7          	jalr	-512(ra) # 5848 <exit>
        exit(0);
    1a50:	00004097          	auipc	ra,0x4
    1a54:	df8080e7          	jalr	-520(ra) # 5848 <exit>

0000000000001a58 <forkfork>:
{
    1a58:	7179                	addi	sp,sp,-48
    1a5a:	f406                	sd	ra,40(sp)
    1a5c:	f022                	sd	s0,32(sp)
    1a5e:	ec26                	sd	s1,24(sp)
    1a60:	1800                	addi	s0,sp,48
    1a62:	84aa                	mv	s1,a0
    int pid = fork();
    1a64:	00004097          	auipc	ra,0x4
    1a68:	ddc080e7          	jalr	-548(ra) # 5840 <fork>
    if(pid < 0){
    1a6c:	04054163          	bltz	a0,1aae <forkfork+0x56>
    if(pid == 0){
    1a70:	cd29                	beqz	a0,1aca <forkfork+0x72>
    int pid = fork();
    1a72:	00004097          	auipc	ra,0x4
    1a76:	dce080e7          	jalr	-562(ra) # 5840 <fork>
    if(pid < 0){
    1a7a:	02054a63          	bltz	a0,1aae <forkfork+0x56>
    if(pid == 0){
    1a7e:	c531                	beqz	a0,1aca <forkfork+0x72>
    wait(&xstatus);
    1a80:	fdc40513          	addi	a0,s0,-36
    1a84:	00004097          	auipc	ra,0x4
    1a88:	dcc080e7          	jalr	-564(ra) # 5850 <wait>
    if(xstatus != 0) {
    1a8c:	fdc42783          	lw	a5,-36(s0)
    1a90:	ebbd                	bnez	a5,1b06 <forkfork+0xae>
    wait(&xstatus);
    1a92:	fdc40513          	addi	a0,s0,-36
    1a96:	00004097          	auipc	ra,0x4
    1a9a:	dba080e7          	jalr	-582(ra) # 5850 <wait>
    if(xstatus != 0) {
    1a9e:	fdc42783          	lw	a5,-36(s0)
    1aa2:	e3b5                	bnez	a5,1b06 <forkfork+0xae>
}
    1aa4:	70a2                	ld	ra,40(sp)
    1aa6:	7402                	ld	s0,32(sp)
    1aa8:	64e2                	ld	s1,24(sp)
    1aaa:	6145                	addi	sp,sp,48
    1aac:	8082                	ret
      printf("%s: fork failed", s);
    1aae:	85a6                	mv	a1,s1
    1ab0:	00005517          	auipc	a0,0x5
    1ab4:	04850513          	addi	a0,a0,72 # 6af8 <malloc+0xe7a>
    1ab8:	00004097          	auipc	ra,0x4
    1abc:	108080e7          	jalr	264(ra) # 5bc0 <printf>
      exit(1);
    1ac0:	4505                	li	a0,1
    1ac2:	00004097          	auipc	ra,0x4
    1ac6:	d86080e7          	jalr	-634(ra) # 5848 <exit>
{
    1aca:	0c800493          	li	s1,200
        int pid1 = fork();
    1ace:	00004097          	auipc	ra,0x4
    1ad2:	d72080e7          	jalr	-654(ra) # 5840 <fork>
        if(pid1 < 0){
    1ad6:	00054f63          	bltz	a0,1af4 <forkfork+0x9c>
        if(pid1 == 0){
    1ada:	c115                	beqz	a0,1afe <forkfork+0xa6>
        wait(0);
    1adc:	4501                	li	a0,0
    1ade:	00004097          	auipc	ra,0x4
    1ae2:	d72080e7          	jalr	-654(ra) # 5850 <wait>
      for(int j = 0; j < 200; j++){
    1ae6:	34fd                	addiw	s1,s1,-1
    1ae8:	f0fd                	bnez	s1,1ace <forkfork+0x76>
      exit(0);
    1aea:	4501                	li	a0,0
    1aec:	00004097          	auipc	ra,0x4
    1af0:	d5c080e7          	jalr	-676(ra) # 5848 <exit>
          exit(1);
    1af4:	4505                	li	a0,1
    1af6:	00004097          	auipc	ra,0x4
    1afa:	d52080e7          	jalr	-686(ra) # 5848 <exit>
          exit(0);
    1afe:	00004097          	auipc	ra,0x4
    1b02:	d4a080e7          	jalr	-694(ra) # 5848 <exit>
      printf("%s: fork in child failed", s);
    1b06:	85a6                	mv	a1,s1
    1b08:	00005517          	auipc	a0,0x5
    1b0c:	00050513          	mv	a0,a0
    1b10:	00004097          	auipc	ra,0x4
    1b14:	0b0080e7          	jalr	176(ra) # 5bc0 <printf>
      exit(1);
    1b18:	4505                	li	a0,1
    1b1a:	00004097          	auipc	ra,0x4
    1b1e:	d2e080e7          	jalr	-722(ra) # 5848 <exit>

0000000000001b22 <reparent2>:
{
    1b22:	1101                	addi	sp,sp,-32
    1b24:	ec06                	sd	ra,24(sp)
    1b26:	e822                	sd	s0,16(sp)
    1b28:	e426                	sd	s1,8(sp)
    1b2a:	1000                	addi	s0,sp,32
    1b2c:	32000493          	li	s1,800
    int pid1 = fork();
    1b30:	00004097          	auipc	ra,0x4
    1b34:	d10080e7          	jalr	-752(ra) # 5840 <fork>
    if(pid1 < 0){
    1b38:	00054f63          	bltz	a0,1b56 <reparent2+0x34>
    if(pid1 == 0){
    1b3c:	c915                	beqz	a0,1b70 <reparent2+0x4e>
    wait(0);
    1b3e:	4501                	li	a0,0
    1b40:	00004097          	auipc	ra,0x4
    1b44:	d10080e7          	jalr	-752(ra) # 5850 <wait>
  for(int i = 0; i < 800; i++){
    1b48:	34fd                	addiw	s1,s1,-1
    1b4a:	f0fd                	bnez	s1,1b30 <reparent2+0xe>
  exit(0);
    1b4c:	4501                	li	a0,0
    1b4e:	00004097          	auipc	ra,0x4
    1b52:	cfa080e7          	jalr	-774(ra) # 5848 <exit>
      printf("fork failed\n");
    1b56:	00005517          	auipc	a0,0x5
    1b5a:	20250513          	addi	a0,a0,514 # 6d58 <malloc+0x10da>
    1b5e:	00004097          	auipc	ra,0x4
    1b62:	062080e7          	jalr	98(ra) # 5bc0 <printf>
      exit(1);
    1b66:	4505                	li	a0,1
    1b68:	00004097          	auipc	ra,0x4
    1b6c:	ce0080e7          	jalr	-800(ra) # 5848 <exit>
      fork();
    1b70:	00004097          	auipc	ra,0x4
    1b74:	cd0080e7          	jalr	-816(ra) # 5840 <fork>
      fork();
    1b78:	00004097          	auipc	ra,0x4
    1b7c:	cc8080e7          	jalr	-824(ra) # 5840 <fork>
      exit(0);
    1b80:	4501                	li	a0,0
    1b82:	00004097          	auipc	ra,0x4
    1b86:	cc6080e7          	jalr	-826(ra) # 5848 <exit>

0000000000001b8a <createdelete>:
{
    1b8a:	7175                	addi	sp,sp,-144
    1b8c:	e506                	sd	ra,136(sp)
    1b8e:	e122                	sd	s0,128(sp)
    1b90:	fca6                	sd	s1,120(sp)
    1b92:	f8ca                	sd	s2,112(sp)
    1b94:	f4ce                	sd	s3,104(sp)
    1b96:	f0d2                	sd	s4,96(sp)
    1b98:	ecd6                	sd	s5,88(sp)
    1b9a:	e8da                	sd	s6,80(sp)
    1b9c:	e4de                	sd	s7,72(sp)
    1b9e:	e0e2                	sd	s8,64(sp)
    1ba0:	fc66                	sd	s9,56(sp)
    1ba2:	0900                	addi	s0,sp,144
    1ba4:	8caa                	mv	s9,a0
  for(pi = 0; pi < NCHILD; pi++){
    1ba6:	4901                	li	s2,0
    1ba8:	4991                	li	s3,4
    pid = fork();
    1baa:	00004097          	auipc	ra,0x4
    1bae:	c96080e7          	jalr	-874(ra) # 5840 <fork>
    1bb2:	84aa                	mv	s1,a0
    if(pid < 0){
    1bb4:	02054f63          	bltz	a0,1bf2 <createdelete+0x68>
    if(pid == 0){
    1bb8:	c939                	beqz	a0,1c0e <createdelete+0x84>
  for(pi = 0; pi < NCHILD; pi++){
    1bba:	2905                	addiw	s2,s2,1
    1bbc:	ff3917e3          	bne	s2,s3,1baa <createdelete+0x20>
    1bc0:	4491                	li	s1,4
    wait(&xstatus);
    1bc2:	f7c40513          	addi	a0,s0,-132
    1bc6:	00004097          	auipc	ra,0x4
    1bca:	c8a080e7          	jalr	-886(ra) # 5850 <wait>
    if(xstatus != 0)
    1bce:	f7c42903          	lw	s2,-132(s0)
    1bd2:	0e091263          	bnez	s2,1cb6 <createdelete+0x12c>
  for(pi = 0; pi < NCHILD; pi++){
    1bd6:	34fd                	addiw	s1,s1,-1
    1bd8:	f4ed                	bnez	s1,1bc2 <createdelete+0x38>
  name[0] = name[1] = name[2] = 0;
    1bda:	f8040123          	sb	zero,-126(s0)
    1bde:	03000993          	li	s3,48
    1be2:	5a7d                	li	s4,-1
    1be4:	07000c13          	li	s8,112
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1be8:	4b21                	li	s6,8
      if((i == 0 || i >= N/2) && fd < 0){
    1bea:	4ba5                	li	s7,9
    for(pi = 0; pi < NCHILD; pi++){
    1bec:	07400a93          	li	s5,116
    1bf0:	a29d                	j	1d56 <createdelete+0x1cc>
      printf("fork failed\n", s);
    1bf2:	85e6                	mv	a1,s9
    1bf4:	00005517          	auipc	a0,0x5
    1bf8:	16450513          	addi	a0,a0,356 # 6d58 <malloc+0x10da>
    1bfc:	00004097          	auipc	ra,0x4
    1c00:	fc4080e7          	jalr	-60(ra) # 5bc0 <printf>
      exit(1);
    1c04:	4505                	li	a0,1
    1c06:	00004097          	auipc	ra,0x4
    1c0a:	c42080e7          	jalr	-958(ra) # 5848 <exit>
      name[0] = 'p' + pi;
    1c0e:	0709091b          	addiw	s2,s2,112
    1c12:	f9240023          	sb	s2,-128(s0)
      name[2] = '\0';
    1c16:	f8040123          	sb	zero,-126(s0)
      for(i = 0; i < N; i++){
    1c1a:	4951                	li	s2,20
    1c1c:	a015                	j	1c40 <createdelete+0xb6>
          printf("%s: create failed\n", s);
    1c1e:	85e6                	mv	a1,s9
    1c20:	00005517          	auipc	a0,0x5
    1c24:	db050513          	addi	a0,a0,-592 # 69d0 <malloc+0xd52>
    1c28:	00004097          	auipc	ra,0x4
    1c2c:	f98080e7          	jalr	-104(ra) # 5bc0 <printf>
          exit(1);
    1c30:	4505                	li	a0,1
    1c32:	00004097          	auipc	ra,0x4
    1c36:	c16080e7          	jalr	-1002(ra) # 5848 <exit>
      for(i = 0; i < N; i++){
    1c3a:	2485                	addiw	s1,s1,1
    1c3c:	07248863          	beq	s1,s2,1cac <createdelete+0x122>
        name[1] = '0' + i;
    1c40:	0304879b          	addiw	a5,s1,48
    1c44:	f8f400a3          	sb	a5,-127(s0)
        fd = open(name, O_CREATE | O_RDWR);
    1c48:	20200593          	li	a1,514
    1c4c:	f8040513          	addi	a0,s0,-128
    1c50:	00004097          	auipc	ra,0x4
    1c54:	c38080e7          	jalr	-968(ra) # 5888 <open>
        if(fd < 0){
    1c58:	fc0543e3          	bltz	a0,1c1e <createdelete+0x94>
        close(fd);
    1c5c:	00004097          	auipc	ra,0x4
    1c60:	c14080e7          	jalr	-1004(ra) # 5870 <close>
        if(i > 0 && (i % 2 ) == 0){
    1c64:	fc905be3          	blez	s1,1c3a <createdelete+0xb0>
    1c68:	0014f793          	andi	a5,s1,1
    1c6c:	f7f9                	bnez	a5,1c3a <createdelete+0xb0>
          name[1] = '0' + (i / 2);
    1c6e:	01f4d79b          	srliw	a5,s1,0x1f
    1c72:	9fa5                	addw	a5,a5,s1
    1c74:	4017d79b          	sraiw	a5,a5,0x1
    1c78:	0307879b          	addiw	a5,a5,48
    1c7c:	f8f400a3          	sb	a5,-127(s0)
          if(unlink(name) < 0){
    1c80:	f8040513          	addi	a0,s0,-128
    1c84:	00004097          	auipc	ra,0x4
    1c88:	c14080e7          	jalr	-1004(ra) # 5898 <unlink>
    1c8c:	fa0557e3          	bgez	a0,1c3a <createdelete+0xb0>
            printf("%s: unlink failed\n", s);
    1c90:	85e6                	mv	a1,s9
    1c92:	00005517          	auipc	a0,0x5
    1c96:	e9650513          	addi	a0,a0,-362 # 6b28 <malloc+0xeaa>
    1c9a:	00004097          	auipc	ra,0x4
    1c9e:	f26080e7          	jalr	-218(ra) # 5bc0 <printf>
            exit(1);
    1ca2:	4505                	li	a0,1
    1ca4:	00004097          	auipc	ra,0x4
    1ca8:	ba4080e7          	jalr	-1116(ra) # 5848 <exit>
      exit(0);
    1cac:	4501                	li	a0,0
    1cae:	00004097          	auipc	ra,0x4
    1cb2:	b9a080e7          	jalr	-1126(ra) # 5848 <exit>
      exit(1);
    1cb6:	4505                	li	a0,1
    1cb8:	00004097          	auipc	ra,0x4
    1cbc:	b90080e7          	jalr	-1136(ra) # 5848 <exit>
        printf("%s: oops createdelete %s didn't exist\n", s, name);
    1cc0:	f8040613          	addi	a2,s0,-128
    1cc4:	85e6                	mv	a1,s9
    1cc6:	00005517          	auipc	a0,0x5
    1cca:	e7a50513          	addi	a0,a0,-390 # 6b40 <malloc+0xec2>
    1cce:	00004097          	auipc	ra,0x4
    1cd2:	ef2080e7          	jalr	-270(ra) # 5bc0 <printf>
        exit(1);
    1cd6:	4505                	li	a0,1
    1cd8:	00004097          	auipc	ra,0x4
    1cdc:	b70080e7          	jalr	-1168(ra) # 5848 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1ce0:	054b7163          	bgeu	s6,s4,1d22 <createdelete+0x198>
      if(fd >= 0)
    1ce4:	02055a63          	bgez	a0,1d18 <createdelete+0x18e>
    for(pi = 0; pi < NCHILD; pi++){
    1ce8:	2485                	addiw	s1,s1,1
    1cea:	0ff4f493          	andi	s1,s1,255
    1cee:	05548c63          	beq	s1,s5,1d46 <createdelete+0x1bc>
      name[0] = 'p' + pi;
    1cf2:	f8940023          	sb	s1,-128(s0)
      name[1] = '0' + i;
    1cf6:	f93400a3          	sb	s3,-127(s0)
      fd = open(name, 0);
    1cfa:	4581                	li	a1,0
    1cfc:	f8040513          	addi	a0,s0,-128
    1d00:	00004097          	auipc	ra,0x4
    1d04:	b88080e7          	jalr	-1144(ra) # 5888 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1d08:	00090463          	beqz	s2,1d10 <createdelete+0x186>
    1d0c:	fd2bdae3          	bge	s7,s2,1ce0 <createdelete+0x156>
    1d10:	fa0548e3          	bltz	a0,1cc0 <createdelete+0x136>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1d14:	014b7963          	bgeu	s6,s4,1d26 <createdelete+0x19c>
        close(fd);
    1d18:	00004097          	auipc	ra,0x4
    1d1c:	b58080e7          	jalr	-1192(ra) # 5870 <close>
    1d20:	b7e1                	j	1ce8 <createdelete+0x15e>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1d22:	fc0543e3          	bltz	a0,1ce8 <createdelete+0x15e>
        printf("%s: oops createdelete %s did exist\n", s, name);
    1d26:	f8040613          	addi	a2,s0,-128
    1d2a:	85e6                	mv	a1,s9
    1d2c:	00005517          	auipc	a0,0x5
    1d30:	e3c50513          	addi	a0,a0,-452 # 6b68 <malloc+0xeea>
    1d34:	00004097          	auipc	ra,0x4
    1d38:	e8c080e7          	jalr	-372(ra) # 5bc0 <printf>
        exit(1);
    1d3c:	4505                	li	a0,1
    1d3e:	00004097          	auipc	ra,0x4
    1d42:	b0a080e7          	jalr	-1270(ra) # 5848 <exit>
  for(i = 0; i < N; i++){
    1d46:	2905                	addiw	s2,s2,1
    1d48:	2a05                	addiw	s4,s4,1
    1d4a:	2985                	addiw	s3,s3,1
    1d4c:	0ff9f993          	andi	s3,s3,255
    1d50:	47d1                	li	a5,20
    1d52:	02f90a63          	beq	s2,a5,1d86 <createdelete+0x1fc>
    for(pi = 0; pi < NCHILD; pi++){
    1d56:	84e2                	mv	s1,s8
    1d58:	bf69                	j	1cf2 <createdelete+0x168>
  for(i = 0; i < N; i++){
    1d5a:	2905                	addiw	s2,s2,1
    1d5c:	0ff97913          	andi	s2,s2,255
    1d60:	2985                	addiw	s3,s3,1
    1d62:	0ff9f993          	andi	s3,s3,255
    1d66:	03490863          	beq	s2,s4,1d96 <createdelete+0x20c>
  name[0] = name[1] = name[2] = 0;
    1d6a:	84d6                	mv	s1,s5
      name[0] = 'p' + i;
    1d6c:	f9240023          	sb	s2,-128(s0)
      name[1] = '0' + i;
    1d70:	f93400a3          	sb	s3,-127(s0)
      unlink(name);
    1d74:	f8040513          	addi	a0,s0,-128
    1d78:	00004097          	auipc	ra,0x4
    1d7c:	b20080e7          	jalr	-1248(ra) # 5898 <unlink>
    for(pi = 0; pi < NCHILD; pi++){
    1d80:	34fd                	addiw	s1,s1,-1
    1d82:	f4ed                	bnez	s1,1d6c <createdelete+0x1e2>
    1d84:	bfd9                	j	1d5a <createdelete+0x1d0>
    1d86:	03000993          	li	s3,48
    1d8a:	07000913          	li	s2,112
  name[0] = name[1] = name[2] = 0;
    1d8e:	4a91                	li	s5,4
  for(i = 0; i < N; i++){
    1d90:	08400a13          	li	s4,132
    1d94:	bfd9                	j	1d6a <createdelete+0x1e0>
}
    1d96:	60aa                	ld	ra,136(sp)
    1d98:	640a                	ld	s0,128(sp)
    1d9a:	74e6                	ld	s1,120(sp)
    1d9c:	7946                	ld	s2,112(sp)
    1d9e:	79a6                	ld	s3,104(sp)
    1da0:	7a06                	ld	s4,96(sp)
    1da2:	6ae6                	ld	s5,88(sp)
    1da4:	6b46                	ld	s6,80(sp)
    1da6:	6ba6                	ld	s7,72(sp)
    1da8:	6c06                	ld	s8,64(sp)
    1daa:	7ce2                	ld	s9,56(sp)
    1dac:	6149                	addi	sp,sp,144
    1dae:	8082                	ret

0000000000001db0 <linkunlink>:
{
    1db0:	711d                	addi	sp,sp,-96
    1db2:	ec86                	sd	ra,88(sp)
    1db4:	e8a2                	sd	s0,80(sp)
    1db6:	e4a6                	sd	s1,72(sp)
    1db8:	e0ca                	sd	s2,64(sp)
    1dba:	fc4e                	sd	s3,56(sp)
    1dbc:	f852                	sd	s4,48(sp)
    1dbe:	f456                	sd	s5,40(sp)
    1dc0:	f05a                	sd	s6,32(sp)
    1dc2:	ec5e                	sd	s7,24(sp)
    1dc4:	e862                	sd	s8,16(sp)
    1dc6:	e466                	sd	s9,8(sp)
    1dc8:	1080                	addi	s0,sp,96
    1dca:	84aa                	mv	s1,a0
  unlink("x");
    1dcc:	00004517          	auipc	a0,0x4
    1dd0:	3a450513          	addi	a0,a0,932 # 6170 <malloc+0x4f2>
    1dd4:	00004097          	auipc	ra,0x4
    1dd8:	ac4080e7          	jalr	-1340(ra) # 5898 <unlink>
  pid = fork();
    1ddc:	00004097          	auipc	ra,0x4
    1de0:	a64080e7          	jalr	-1436(ra) # 5840 <fork>
  if(pid < 0){
    1de4:	02054b63          	bltz	a0,1e1a <linkunlink+0x6a>
    1de8:	8c2a                	mv	s8,a0
  unsigned int x = (pid ? 1 : 97);
    1dea:	4c85                	li	s9,1
    1dec:	e119                	bnez	a0,1df2 <linkunlink+0x42>
    1dee:	06100c93          	li	s9,97
    1df2:	06400493          	li	s1,100
    x = x * 1103515245 + 12345;
    1df6:	41c659b7          	lui	s3,0x41c65
    1dfa:	e6d9899b          	addiw	s3,s3,-403
    1dfe:	690d                	lui	s2,0x3
    1e00:	0399091b          	addiw	s2,s2,57
    if((x % 3) == 0){
    1e04:	4a0d                	li	s4,3
    } else if((x % 3) == 1){
    1e06:	4b05                	li	s6,1
      unlink("x");
    1e08:	00004a97          	auipc	s5,0x4
    1e0c:	368a8a93          	addi	s5,s5,872 # 6170 <malloc+0x4f2>
      link("cat", "x");
    1e10:	00005b97          	auipc	s7,0x5
    1e14:	d80b8b93          	addi	s7,s7,-640 # 6b90 <malloc+0xf12>
    1e18:	a825                	j	1e50 <linkunlink+0xa0>
    printf("%s: fork failed\n", s);
    1e1a:	85a6                	mv	a1,s1
    1e1c:	00005517          	auipc	a0,0x5
    1e20:	b1c50513          	addi	a0,a0,-1252 # 6938 <malloc+0xcba>
    1e24:	00004097          	auipc	ra,0x4
    1e28:	d9c080e7          	jalr	-612(ra) # 5bc0 <printf>
    exit(1);
    1e2c:	4505                	li	a0,1
    1e2e:	00004097          	auipc	ra,0x4
    1e32:	a1a080e7          	jalr	-1510(ra) # 5848 <exit>
      close(open("x", O_RDWR | O_CREATE));
    1e36:	20200593          	li	a1,514
    1e3a:	8556                	mv	a0,s5
    1e3c:	00004097          	auipc	ra,0x4
    1e40:	a4c080e7          	jalr	-1460(ra) # 5888 <open>
    1e44:	00004097          	auipc	ra,0x4
    1e48:	a2c080e7          	jalr	-1492(ra) # 5870 <close>
  for(i = 0; i < 100; i++){
    1e4c:	34fd                	addiw	s1,s1,-1
    1e4e:	c88d                	beqz	s1,1e80 <linkunlink+0xd0>
    x = x * 1103515245 + 12345;
    1e50:	033c87bb          	mulw	a5,s9,s3
    1e54:	012787bb          	addw	a5,a5,s2
    1e58:	00078c9b          	sext.w	s9,a5
    if((x % 3) == 0){
    1e5c:	0347f7bb          	remuw	a5,a5,s4
    1e60:	dbf9                	beqz	a5,1e36 <linkunlink+0x86>
    } else if((x % 3) == 1){
    1e62:	01678863          	beq	a5,s6,1e72 <linkunlink+0xc2>
      unlink("x");
    1e66:	8556                	mv	a0,s5
    1e68:	00004097          	auipc	ra,0x4
    1e6c:	a30080e7          	jalr	-1488(ra) # 5898 <unlink>
    1e70:	bff1                	j	1e4c <linkunlink+0x9c>
      link("cat", "x");
    1e72:	85d6                	mv	a1,s5
    1e74:	855e                	mv	a0,s7
    1e76:	00004097          	auipc	ra,0x4
    1e7a:	a32080e7          	jalr	-1486(ra) # 58a8 <link>
    1e7e:	b7f9                	j	1e4c <linkunlink+0x9c>
  if(pid)
    1e80:	020c0463          	beqz	s8,1ea8 <linkunlink+0xf8>
    wait(0);
    1e84:	4501                	li	a0,0
    1e86:	00004097          	auipc	ra,0x4
    1e8a:	9ca080e7          	jalr	-1590(ra) # 5850 <wait>
}
    1e8e:	60e6                	ld	ra,88(sp)
    1e90:	6446                	ld	s0,80(sp)
    1e92:	64a6                	ld	s1,72(sp)
    1e94:	6906                	ld	s2,64(sp)
    1e96:	79e2                	ld	s3,56(sp)
    1e98:	7a42                	ld	s4,48(sp)
    1e9a:	7aa2                	ld	s5,40(sp)
    1e9c:	7b02                	ld	s6,32(sp)
    1e9e:	6be2                	ld	s7,24(sp)
    1ea0:	6c42                	ld	s8,16(sp)
    1ea2:	6ca2                	ld	s9,8(sp)
    1ea4:	6125                	addi	sp,sp,96
    1ea6:	8082                	ret
    exit(0);
    1ea8:	4501                	li	a0,0
    1eaa:	00004097          	auipc	ra,0x4
    1eae:	99e080e7          	jalr	-1634(ra) # 5848 <exit>

0000000000001eb2 <manywrites>:
{
    1eb2:	711d                	addi	sp,sp,-96
    1eb4:	ec86                	sd	ra,88(sp)
    1eb6:	e8a2                	sd	s0,80(sp)
    1eb8:	e4a6                	sd	s1,72(sp)
    1eba:	e0ca                	sd	s2,64(sp)
    1ebc:	fc4e                	sd	s3,56(sp)
    1ebe:	f852                	sd	s4,48(sp)
    1ec0:	f456                	sd	s5,40(sp)
    1ec2:	f05a                	sd	s6,32(sp)
    1ec4:	ec5e                	sd	s7,24(sp)
    1ec6:	1080                	addi	s0,sp,96
    1ec8:	8aaa                	mv	s5,a0
  for(int ci = 0; ci < nchildren; ci++){
    1eca:	4981                	li	s3,0
    1ecc:	4911                	li	s2,4
    int pid = fork();
    1ece:	00004097          	auipc	ra,0x4
    1ed2:	972080e7          	jalr	-1678(ra) # 5840 <fork>
    1ed6:	84aa                	mv	s1,a0
    if(pid < 0){
    1ed8:	02054963          	bltz	a0,1f0a <manywrites+0x58>
    if(pid == 0){
    1edc:	c521                	beqz	a0,1f24 <manywrites+0x72>
  for(int ci = 0; ci < nchildren; ci++){
    1ede:	2985                	addiw	s3,s3,1
    1ee0:	ff2997e3          	bne	s3,s2,1ece <manywrites+0x1c>
    1ee4:	4491                	li	s1,4
    int st = 0;
    1ee6:	fa042423          	sw	zero,-88(s0)
    wait(&st);
    1eea:	fa840513          	addi	a0,s0,-88
    1eee:	00004097          	auipc	ra,0x4
    1ef2:	962080e7          	jalr	-1694(ra) # 5850 <wait>
    if(st != 0)
    1ef6:	fa842503          	lw	a0,-88(s0)
    1efa:	ed6d                	bnez	a0,1ff4 <manywrites+0x142>
  for(int ci = 0; ci < nchildren; ci++){
    1efc:	34fd                	addiw	s1,s1,-1
    1efe:	f4e5                	bnez	s1,1ee6 <manywrites+0x34>
  exit(0);
    1f00:	4501                	li	a0,0
    1f02:	00004097          	auipc	ra,0x4
    1f06:	946080e7          	jalr	-1722(ra) # 5848 <exit>
      printf("fork failed\n");
    1f0a:	00005517          	auipc	a0,0x5
    1f0e:	e4e50513          	addi	a0,a0,-434 # 6d58 <malloc+0x10da>
    1f12:	00004097          	auipc	ra,0x4
    1f16:	cae080e7          	jalr	-850(ra) # 5bc0 <printf>
      exit(1);
    1f1a:	4505                	li	a0,1
    1f1c:	00004097          	auipc	ra,0x4
    1f20:	92c080e7          	jalr	-1748(ra) # 5848 <exit>
      name[0] = 'b';
    1f24:	06200793          	li	a5,98
    1f28:	faf40423          	sb	a5,-88(s0)
      name[1] = 'a' + ci;
    1f2c:	0619879b          	addiw	a5,s3,97
    1f30:	faf404a3          	sb	a5,-87(s0)
      name[2] = '\0';
    1f34:	fa040523          	sb	zero,-86(s0)
      unlink(name);
    1f38:	fa840513          	addi	a0,s0,-88
    1f3c:	00004097          	auipc	ra,0x4
    1f40:	95c080e7          	jalr	-1700(ra) # 5898 <unlink>
    1f44:	4bf9                	li	s7,30
          int cc = write(fd, buf, sz);
    1f46:	0000ab17          	auipc	s6,0xa
    1f4a:	e42b0b13          	addi	s6,s6,-446 # bd88 <buf>
        for(int i = 0; i < ci+1; i++){
    1f4e:	8a26                	mv	s4,s1
    1f50:	0209ce63          	bltz	s3,1f8c <manywrites+0xda>
          int fd = open(name, O_CREATE | O_RDWR);
    1f54:	20200593          	li	a1,514
    1f58:	fa840513          	addi	a0,s0,-88
    1f5c:	00004097          	auipc	ra,0x4
    1f60:	92c080e7          	jalr	-1748(ra) # 5888 <open>
    1f64:	892a                	mv	s2,a0
          if(fd < 0){
    1f66:	04054763          	bltz	a0,1fb4 <manywrites+0x102>
          int cc = write(fd, buf, sz);
    1f6a:	660d                	lui	a2,0x3
    1f6c:	85da                	mv	a1,s6
    1f6e:	00004097          	auipc	ra,0x4
    1f72:	8fa080e7          	jalr	-1798(ra) # 5868 <write>
          if(cc != sz){
    1f76:	678d                	lui	a5,0x3
    1f78:	04f51e63          	bne	a0,a5,1fd4 <manywrites+0x122>
          close(fd);
    1f7c:	854a                	mv	a0,s2
    1f7e:	00004097          	auipc	ra,0x4
    1f82:	8f2080e7          	jalr	-1806(ra) # 5870 <close>
        for(int i = 0; i < ci+1; i++){
    1f86:	2a05                	addiw	s4,s4,1
    1f88:	fd49d6e3          	bge	s3,s4,1f54 <manywrites+0xa2>
        unlink(name);
    1f8c:	fa840513          	addi	a0,s0,-88
    1f90:	00004097          	auipc	ra,0x4
    1f94:	908080e7          	jalr	-1784(ra) # 5898 <unlink>
      for(int iters = 0; iters < howmany; iters++){
    1f98:	3bfd                	addiw	s7,s7,-1
    1f9a:	fa0b9ae3          	bnez	s7,1f4e <manywrites+0x9c>
      unlink(name);
    1f9e:	fa840513          	addi	a0,s0,-88
    1fa2:	00004097          	auipc	ra,0x4
    1fa6:	8f6080e7          	jalr	-1802(ra) # 5898 <unlink>
      exit(0);
    1faa:	4501                	li	a0,0
    1fac:	00004097          	auipc	ra,0x4
    1fb0:	89c080e7          	jalr	-1892(ra) # 5848 <exit>
            printf("%s: cannot create %s\n", s, name);
    1fb4:	fa840613          	addi	a2,s0,-88
    1fb8:	85d6                	mv	a1,s5
    1fba:	00005517          	auipc	a0,0x5
    1fbe:	bde50513          	addi	a0,a0,-1058 # 6b98 <malloc+0xf1a>
    1fc2:	00004097          	auipc	ra,0x4
    1fc6:	bfe080e7          	jalr	-1026(ra) # 5bc0 <printf>
            exit(1);
    1fca:	4505                	li	a0,1
    1fcc:	00004097          	auipc	ra,0x4
    1fd0:	87c080e7          	jalr	-1924(ra) # 5848 <exit>
            printf("%s: write(%d) ret %d\n", s, sz, cc);
    1fd4:	86aa                	mv	a3,a0
    1fd6:	660d                	lui	a2,0x3
    1fd8:	85d6                	mv	a1,s5
    1fda:	00004517          	auipc	a0,0x4
    1fde:	1e650513          	addi	a0,a0,486 # 61c0 <malloc+0x542>
    1fe2:	00004097          	auipc	ra,0x4
    1fe6:	bde080e7          	jalr	-1058(ra) # 5bc0 <printf>
            exit(1);
    1fea:	4505                	li	a0,1
    1fec:	00004097          	auipc	ra,0x4
    1ff0:	85c080e7          	jalr	-1956(ra) # 5848 <exit>
      exit(st);
    1ff4:	00004097          	auipc	ra,0x4
    1ff8:	854080e7          	jalr	-1964(ra) # 5848 <exit>

0000000000001ffc <forktest>:
{
    1ffc:	7179                	addi	sp,sp,-48
    1ffe:	f406                	sd	ra,40(sp)
    2000:	f022                	sd	s0,32(sp)
    2002:	ec26                	sd	s1,24(sp)
    2004:	e84a                	sd	s2,16(sp)
    2006:	e44e                	sd	s3,8(sp)
    2008:	1800                	addi	s0,sp,48
    200a:	89aa                	mv	s3,a0
  for(n=0; n<N; n++){
    200c:	4481                	li	s1,0
    200e:	3e800913          	li	s2,1000
    pid = fork();
    2012:	00004097          	auipc	ra,0x4
    2016:	82e080e7          	jalr	-2002(ra) # 5840 <fork>
    if(pid < 0)
    201a:	02054863          	bltz	a0,204a <forktest+0x4e>
    if(pid == 0)
    201e:	c115                	beqz	a0,2042 <forktest+0x46>
  for(n=0; n<N; n++){
    2020:	2485                	addiw	s1,s1,1
    2022:	ff2498e3          	bne	s1,s2,2012 <forktest+0x16>
    printf("%s: fork claimed to work 1000 times!\n", s);
    2026:	85ce                	mv	a1,s3
    2028:	00005517          	auipc	a0,0x5
    202c:	ba050513          	addi	a0,a0,-1120 # 6bc8 <malloc+0xf4a>
    2030:	00004097          	auipc	ra,0x4
    2034:	b90080e7          	jalr	-1136(ra) # 5bc0 <printf>
    exit(1);
    2038:	4505                	li	a0,1
    203a:	00004097          	auipc	ra,0x4
    203e:	80e080e7          	jalr	-2034(ra) # 5848 <exit>
      exit(0);
    2042:	00004097          	auipc	ra,0x4
    2046:	806080e7          	jalr	-2042(ra) # 5848 <exit>
  if (n == 0) {
    204a:	cc9d                	beqz	s1,2088 <forktest+0x8c>
  if(n == N){
    204c:	3e800793          	li	a5,1000
    2050:	fcf48be3          	beq	s1,a5,2026 <forktest+0x2a>
  for(; n > 0; n--){
    2054:	00905b63          	blez	s1,206a <forktest+0x6e>
    if(wait(0) < 0){
    2058:	4501                	li	a0,0
    205a:	00003097          	auipc	ra,0x3
    205e:	7f6080e7          	jalr	2038(ra) # 5850 <wait>
    2062:	04054163          	bltz	a0,20a4 <forktest+0xa8>
  for(; n > 0; n--){
    2066:	34fd                	addiw	s1,s1,-1
    2068:	f8e5                	bnez	s1,2058 <forktest+0x5c>
  if(wait(0) != -1){
    206a:	4501                	li	a0,0
    206c:	00003097          	auipc	ra,0x3
    2070:	7e4080e7          	jalr	2020(ra) # 5850 <wait>
    2074:	57fd                	li	a5,-1
    2076:	04f51563          	bne	a0,a5,20c0 <forktest+0xc4>
}
    207a:	70a2                	ld	ra,40(sp)
    207c:	7402                	ld	s0,32(sp)
    207e:	64e2                	ld	s1,24(sp)
    2080:	6942                	ld	s2,16(sp)
    2082:	69a2                	ld	s3,8(sp)
    2084:	6145                	addi	sp,sp,48
    2086:	8082                	ret
    printf("%s: no fork at all!\n", s);
    2088:	85ce                	mv	a1,s3
    208a:	00005517          	auipc	a0,0x5
    208e:	b2650513          	addi	a0,a0,-1242 # 6bb0 <malloc+0xf32>
    2092:	00004097          	auipc	ra,0x4
    2096:	b2e080e7          	jalr	-1234(ra) # 5bc0 <printf>
    exit(1);
    209a:	4505                	li	a0,1
    209c:	00003097          	auipc	ra,0x3
    20a0:	7ac080e7          	jalr	1964(ra) # 5848 <exit>
      printf("%s: wait stopped early\n", s);
    20a4:	85ce                	mv	a1,s3
    20a6:	00005517          	auipc	a0,0x5
    20aa:	b4a50513          	addi	a0,a0,-1206 # 6bf0 <malloc+0xf72>
    20ae:	00004097          	auipc	ra,0x4
    20b2:	b12080e7          	jalr	-1262(ra) # 5bc0 <printf>
      exit(1);
    20b6:	4505                	li	a0,1
    20b8:	00003097          	auipc	ra,0x3
    20bc:	790080e7          	jalr	1936(ra) # 5848 <exit>
    printf("%s: wait got too many\n", s);
    20c0:	85ce                	mv	a1,s3
    20c2:	00005517          	auipc	a0,0x5
    20c6:	b4650513          	addi	a0,a0,-1210 # 6c08 <malloc+0xf8a>
    20ca:	00004097          	auipc	ra,0x4
    20ce:	af6080e7          	jalr	-1290(ra) # 5bc0 <printf>
    exit(1);
    20d2:	4505                	li	a0,1
    20d4:	00003097          	auipc	ra,0x3
    20d8:	774080e7          	jalr	1908(ra) # 5848 <exit>

00000000000020dc <kernmem>:
{
    20dc:	715d                	addi	sp,sp,-80
    20de:	e486                	sd	ra,72(sp)
    20e0:	e0a2                	sd	s0,64(sp)
    20e2:	fc26                	sd	s1,56(sp)
    20e4:	f84a                	sd	s2,48(sp)
    20e6:	f44e                	sd	s3,40(sp)
    20e8:	f052                	sd	s4,32(sp)
    20ea:	ec56                	sd	s5,24(sp)
    20ec:	0880                	addi	s0,sp,80
    20ee:	8a2a                	mv	s4,a0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    20f0:	4485                	li	s1,1
    20f2:	04fe                	slli	s1,s1,0x1f
    if(xstatus != -1)  // did kernel kill child?
    20f4:	5afd                	li	s5,-1
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    20f6:	69b1                	lui	s3,0xc
    20f8:	35098993          	addi	s3,s3,848 # c350 <buf+0x5c8>
    20fc:	1003d937          	lui	s2,0x1003d
    2100:	090e                	slli	s2,s2,0x3
    2102:	48090913          	addi	s2,s2,1152 # 1003d480 <__BSS_END__+0x1002e6e8>
    pid = fork();
    2106:	00003097          	auipc	ra,0x3
    210a:	73a080e7          	jalr	1850(ra) # 5840 <fork>
    if(pid < 0){
    210e:	02054963          	bltz	a0,2140 <kernmem+0x64>
    if(pid == 0){
    2112:	c529                	beqz	a0,215c <kernmem+0x80>
    wait(&xstatus);
    2114:	fbc40513          	addi	a0,s0,-68
    2118:	00003097          	auipc	ra,0x3
    211c:	738080e7          	jalr	1848(ra) # 5850 <wait>
    if(xstatus != -1)  // did kernel kill child?
    2120:	fbc42783          	lw	a5,-68(s0)
    2124:	05579d63          	bne	a5,s5,217e <kernmem+0xa2>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2128:	94ce                	add	s1,s1,s3
    212a:	fd249ee3          	bne	s1,s2,2106 <kernmem+0x2a>
}
    212e:	60a6                	ld	ra,72(sp)
    2130:	6406                	ld	s0,64(sp)
    2132:	74e2                	ld	s1,56(sp)
    2134:	7942                	ld	s2,48(sp)
    2136:	79a2                	ld	s3,40(sp)
    2138:	7a02                	ld	s4,32(sp)
    213a:	6ae2                	ld	s5,24(sp)
    213c:	6161                	addi	sp,sp,80
    213e:	8082                	ret
      printf("%s: fork failed\n", s);
    2140:	85d2                	mv	a1,s4
    2142:	00004517          	auipc	a0,0x4
    2146:	7f650513          	addi	a0,a0,2038 # 6938 <malloc+0xcba>
    214a:	00004097          	auipc	ra,0x4
    214e:	a76080e7          	jalr	-1418(ra) # 5bc0 <printf>
      exit(1);
    2152:	4505                	li	a0,1
    2154:	00003097          	auipc	ra,0x3
    2158:	6f4080e7          	jalr	1780(ra) # 5848 <exit>
      printf("%s: oops could read %x = %x\n", s, a, *a);
    215c:	0004c683          	lbu	a3,0(s1)
    2160:	8626                	mv	a2,s1
    2162:	85d2                	mv	a1,s4
    2164:	00005517          	auipc	a0,0x5
    2168:	abc50513          	addi	a0,a0,-1348 # 6c20 <malloc+0xfa2>
    216c:	00004097          	auipc	ra,0x4
    2170:	a54080e7          	jalr	-1452(ra) # 5bc0 <printf>
      exit(1);
    2174:	4505                	li	a0,1
    2176:	00003097          	auipc	ra,0x3
    217a:	6d2080e7          	jalr	1746(ra) # 5848 <exit>
      exit(1);
    217e:	4505                	li	a0,1
    2180:	00003097          	auipc	ra,0x3
    2184:	6c8080e7          	jalr	1736(ra) # 5848 <exit>

0000000000002188 <MAXVAplus>:
{
    2188:	7179                	addi	sp,sp,-48
    218a:	f406                	sd	ra,40(sp)
    218c:	f022                	sd	s0,32(sp)
    218e:	ec26                	sd	s1,24(sp)
    2190:	e84a                	sd	s2,16(sp)
    2192:	1800                	addi	s0,sp,48
  volatile uint64 a = MAXVA;
    2194:	4785                	li	a5,1
    2196:	179a                	slli	a5,a5,0x26
    2198:	fcf43c23          	sd	a5,-40(s0)
  for( ; a != 0; a <<= 1){
    219c:	fd843783          	ld	a5,-40(s0)
    21a0:	cf85                	beqz	a5,21d8 <MAXVAplus+0x50>
    21a2:	892a                	mv	s2,a0
    if(xstatus != -1)  // did kernel kill child?
    21a4:	54fd                	li	s1,-1
    pid = fork();
    21a6:	00003097          	auipc	ra,0x3
    21aa:	69a080e7          	jalr	1690(ra) # 5840 <fork>
    if(pid < 0){
    21ae:	02054b63          	bltz	a0,21e4 <MAXVAplus+0x5c>
    if(pid == 0){
    21b2:	c539                	beqz	a0,2200 <MAXVAplus+0x78>
    wait(&xstatus);
    21b4:	fd440513          	addi	a0,s0,-44
    21b8:	00003097          	auipc	ra,0x3
    21bc:	698080e7          	jalr	1688(ra) # 5850 <wait>
    if(xstatus != -1)  // did kernel kill child?
    21c0:	fd442783          	lw	a5,-44(s0)
    21c4:	06979463          	bne	a5,s1,222c <MAXVAplus+0xa4>
  for( ; a != 0; a <<= 1){
    21c8:	fd843783          	ld	a5,-40(s0)
    21cc:	0786                	slli	a5,a5,0x1
    21ce:	fcf43c23          	sd	a5,-40(s0)
    21d2:	fd843783          	ld	a5,-40(s0)
    21d6:	fbe1                	bnez	a5,21a6 <MAXVAplus+0x1e>
}
    21d8:	70a2                	ld	ra,40(sp)
    21da:	7402                	ld	s0,32(sp)
    21dc:	64e2                	ld	s1,24(sp)
    21de:	6942                	ld	s2,16(sp)
    21e0:	6145                	addi	sp,sp,48
    21e2:	8082                	ret
      printf("%s: fork failed\n", s);
    21e4:	85ca                	mv	a1,s2
    21e6:	00004517          	auipc	a0,0x4
    21ea:	75250513          	addi	a0,a0,1874 # 6938 <malloc+0xcba>
    21ee:	00004097          	auipc	ra,0x4
    21f2:	9d2080e7          	jalr	-1582(ra) # 5bc0 <printf>
      exit(1);
    21f6:	4505                	li	a0,1
    21f8:	00003097          	auipc	ra,0x3
    21fc:	650080e7          	jalr	1616(ra) # 5848 <exit>
      *(char*)a = 99;
    2200:	fd843783          	ld	a5,-40(s0)
    2204:	06300713          	li	a4,99
    2208:	00e78023          	sb	a4,0(a5) # 3000 <iputtest+0x86>
      printf("%s: oops wrote %x\n", s, a);
    220c:	fd843603          	ld	a2,-40(s0)
    2210:	85ca                	mv	a1,s2
    2212:	00005517          	auipc	a0,0x5
    2216:	a2e50513          	addi	a0,a0,-1490 # 6c40 <malloc+0xfc2>
    221a:	00004097          	auipc	ra,0x4
    221e:	9a6080e7          	jalr	-1626(ra) # 5bc0 <printf>
      exit(1);
    2222:	4505                	li	a0,1
    2224:	00003097          	auipc	ra,0x3
    2228:	624080e7          	jalr	1572(ra) # 5848 <exit>
      exit(1);
    222c:	4505                	li	a0,1
    222e:	00003097          	auipc	ra,0x3
    2232:	61a080e7          	jalr	1562(ra) # 5848 <exit>

0000000000002236 <bigargtest>:
{
    2236:	7179                	addi	sp,sp,-48
    2238:	f406                	sd	ra,40(sp)
    223a:	f022                	sd	s0,32(sp)
    223c:	ec26                	sd	s1,24(sp)
    223e:	1800                	addi	s0,sp,48
    2240:	84aa                	mv	s1,a0
  unlink("bigarg-ok");
    2242:	00005517          	auipc	a0,0x5
    2246:	a1650513          	addi	a0,a0,-1514 # 6c58 <malloc+0xfda>
    224a:	00003097          	auipc	ra,0x3
    224e:	64e080e7          	jalr	1614(ra) # 5898 <unlink>
  pid = fork();
    2252:	00003097          	auipc	ra,0x3
    2256:	5ee080e7          	jalr	1518(ra) # 5840 <fork>
  if(pid == 0){
    225a:	c121                	beqz	a0,229a <bigargtest+0x64>
  } else if(pid < 0){
    225c:	0a054063          	bltz	a0,22fc <bigargtest+0xc6>
  wait(&xstatus);
    2260:	fdc40513          	addi	a0,s0,-36
    2264:	00003097          	auipc	ra,0x3
    2268:	5ec080e7          	jalr	1516(ra) # 5850 <wait>
  if(xstatus != 0)
    226c:	fdc42503          	lw	a0,-36(s0)
    2270:	e545                	bnez	a0,2318 <bigargtest+0xe2>
  fd = open("bigarg-ok", 0);
    2272:	4581                	li	a1,0
    2274:	00005517          	auipc	a0,0x5
    2278:	9e450513          	addi	a0,a0,-1564 # 6c58 <malloc+0xfda>
    227c:	00003097          	auipc	ra,0x3
    2280:	60c080e7          	jalr	1548(ra) # 5888 <open>
  if(fd < 0){
    2284:	08054e63          	bltz	a0,2320 <bigargtest+0xea>
  close(fd);
    2288:	00003097          	auipc	ra,0x3
    228c:	5e8080e7          	jalr	1512(ra) # 5870 <close>
}
    2290:	70a2                	ld	ra,40(sp)
    2292:	7402                	ld	s0,32(sp)
    2294:	64e2                	ld	s1,24(sp)
    2296:	6145                	addi	sp,sp,48
    2298:	8082                	ret
    229a:	00006797          	auipc	a5,0x6
    229e:	2d678793          	addi	a5,a5,726 # 8570 <args.1>
    22a2:	00006697          	auipc	a3,0x6
    22a6:	3c668693          	addi	a3,a3,966 # 8668 <args.1+0xf8>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    22aa:	00005717          	auipc	a4,0x5
    22ae:	9be70713          	addi	a4,a4,-1602 # 6c68 <malloc+0xfea>
    22b2:	e398                	sd	a4,0(a5)
    for(i = 0; i < MAXARG-1; i++)
    22b4:	07a1                	addi	a5,a5,8
    22b6:	fed79ee3          	bne	a5,a3,22b2 <bigargtest+0x7c>
    args[MAXARG-1] = 0;
    22ba:	00006597          	auipc	a1,0x6
    22be:	2b658593          	addi	a1,a1,694 # 8570 <args.1>
    22c2:	0e05bc23          	sd	zero,248(a1)
    exec("echo", args);
    22c6:	00004517          	auipc	a0,0x4
    22ca:	e3a50513          	addi	a0,a0,-454 # 6100 <malloc+0x482>
    22ce:	00003097          	auipc	ra,0x3
    22d2:	5b2080e7          	jalr	1458(ra) # 5880 <exec>
    fd = open("bigarg-ok", O_CREATE);
    22d6:	20000593          	li	a1,512
    22da:	00005517          	auipc	a0,0x5
    22de:	97e50513          	addi	a0,a0,-1666 # 6c58 <malloc+0xfda>
    22e2:	00003097          	auipc	ra,0x3
    22e6:	5a6080e7          	jalr	1446(ra) # 5888 <open>
    close(fd);
    22ea:	00003097          	auipc	ra,0x3
    22ee:	586080e7          	jalr	1414(ra) # 5870 <close>
    exit(0);
    22f2:	4501                	li	a0,0
    22f4:	00003097          	auipc	ra,0x3
    22f8:	554080e7          	jalr	1364(ra) # 5848 <exit>
    printf("%s: bigargtest: fork failed\n", s);
    22fc:	85a6                	mv	a1,s1
    22fe:	00005517          	auipc	a0,0x5
    2302:	a4a50513          	addi	a0,a0,-1462 # 6d48 <malloc+0x10ca>
    2306:	00004097          	auipc	ra,0x4
    230a:	8ba080e7          	jalr	-1862(ra) # 5bc0 <printf>
    exit(1);
    230e:	4505                	li	a0,1
    2310:	00003097          	auipc	ra,0x3
    2314:	538080e7          	jalr	1336(ra) # 5848 <exit>
    exit(xstatus);
    2318:	00003097          	auipc	ra,0x3
    231c:	530080e7          	jalr	1328(ra) # 5848 <exit>
    printf("%s: bigarg test failed!\n", s);
    2320:	85a6                	mv	a1,s1
    2322:	00005517          	auipc	a0,0x5
    2326:	a4650513          	addi	a0,a0,-1466 # 6d68 <malloc+0x10ea>
    232a:	00004097          	auipc	ra,0x4
    232e:	896080e7          	jalr	-1898(ra) # 5bc0 <printf>
    exit(1);
    2332:	4505                	li	a0,1
    2334:	00003097          	auipc	ra,0x3
    2338:	514080e7          	jalr	1300(ra) # 5848 <exit>

000000000000233c <stacktest>:
{
    233c:	7179                	addi	sp,sp,-48
    233e:	f406                	sd	ra,40(sp)
    2340:	f022                	sd	s0,32(sp)
    2342:	ec26                	sd	s1,24(sp)
    2344:	1800                	addi	s0,sp,48
    2346:	84aa                	mv	s1,a0
  pid = fork();
    2348:	00003097          	auipc	ra,0x3
    234c:	4f8080e7          	jalr	1272(ra) # 5840 <fork>
  if(pid == 0) {
    2350:	c115                	beqz	a0,2374 <stacktest+0x38>
  } else if(pid < 0){
    2352:	04054463          	bltz	a0,239a <stacktest+0x5e>
  wait(&xstatus);
    2356:	fdc40513          	addi	a0,s0,-36
    235a:	00003097          	auipc	ra,0x3
    235e:	4f6080e7          	jalr	1270(ra) # 5850 <wait>
  if(xstatus == -1)  // kernel killed child?
    2362:	fdc42503          	lw	a0,-36(s0)
    2366:	57fd                	li	a5,-1
    2368:	04f50763          	beq	a0,a5,23b6 <stacktest+0x7a>
    exit(xstatus);
    236c:	00003097          	auipc	ra,0x3
    2370:	4dc080e7          	jalr	1244(ra) # 5848 <exit>

static inline uint64
r_sp()
{
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
    2374:	870a                	mv	a4,sp
    printf("%s: stacktest: read below stack %p\n", s, *sp);
    2376:	77fd                	lui	a5,0xfffff
    2378:	97ba                	add	a5,a5,a4
    237a:	0007c603          	lbu	a2,0(a5) # fffffffffffff000 <__BSS_END__+0xffffffffffff0268>
    237e:	85a6                	mv	a1,s1
    2380:	00005517          	auipc	a0,0x5
    2384:	a0850513          	addi	a0,a0,-1528 # 6d88 <malloc+0x110a>
    2388:	00004097          	auipc	ra,0x4
    238c:	838080e7          	jalr	-1992(ra) # 5bc0 <printf>
    exit(1);
    2390:	4505                	li	a0,1
    2392:	00003097          	auipc	ra,0x3
    2396:	4b6080e7          	jalr	1206(ra) # 5848 <exit>
    printf("%s: fork failed\n", s);
    239a:	85a6                	mv	a1,s1
    239c:	00004517          	auipc	a0,0x4
    23a0:	59c50513          	addi	a0,a0,1436 # 6938 <malloc+0xcba>
    23a4:	00004097          	auipc	ra,0x4
    23a8:	81c080e7          	jalr	-2020(ra) # 5bc0 <printf>
    exit(1);
    23ac:	4505                	li	a0,1
    23ae:	00003097          	auipc	ra,0x3
    23b2:	49a080e7          	jalr	1178(ra) # 5848 <exit>
    exit(0);
    23b6:	4501                	li	a0,0
    23b8:	00003097          	auipc	ra,0x3
    23bc:	490080e7          	jalr	1168(ra) # 5848 <exit>

00000000000023c0 <copyinstr3>:
{
    23c0:	7179                	addi	sp,sp,-48
    23c2:	f406                	sd	ra,40(sp)
    23c4:	f022                	sd	s0,32(sp)
    23c6:	ec26                	sd	s1,24(sp)
    23c8:	1800                	addi	s0,sp,48
  sbrk(8192);
    23ca:	6509                	lui	a0,0x2
    23cc:	00003097          	auipc	ra,0x3
    23d0:	504080e7          	jalr	1284(ra) # 58d0 <sbrk>
  uint64 top = (uint64) sbrk(0);
    23d4:	4501                	li	a0,0
    23d6:	00003097          	auipc	ra,0x3
    23da:	4fa080e7          	jalr	1274(ra) # 58d0 <sbrk>
  if((top % PGSIZE) != 0){
    23de:	03451793          	slli	a5,a0,0x34
    23e2:	e3c9                	bnez	a5,2464 <copyinstr3+0xa4>
  top = (uint64) sbrk(0);
    23e4:	4501                	li	a0,0
    23e6:	00003097          	auipc	ra,0x3
    23ea:	4ea080e7          	jalr	1258(ra) # 58d0 <sbrk>
  if(top % PGSIZE){
    23ee:	03451793          	slli	a5,a0,0x34
    23f2:	e3d9                	bnez	a5,2478 <copyinstr3+0xb8>
  char *b = (char *) (top - 1);
    23f4:	fff50493          	addi	s1,a0,-1 # 1fff <forktest+0x3>
  *b = 'x';
    23f8:	07800793          	li	a5,120
    23fc:	fef50fa3          	sb	a5,-1(a0)
  int ret = unlink(b);
    2400:	8526                	mv	a0,s1
    2402:	00003097          	auipc	ra,0x3
    2406:	496080e7          	jalr	1174(ra) # 5898 <unlink>
  if(ret != -1){
    240a:	57fd                	li	a5,-1
    240c:	08f51363          	bne	a0,a5,2492 <copyinstr3+0xd2>
  int fd = open(b, O_CREATE | O_WRONLY);
    2410:	20100593          	li	a1,513
    2414:	8526                	mv	a0,s1
    2416:	00003097          	auipc	ra,0x3
    241a:	472080e7          	jalr	1138(ra) # 5888 <open>
  if(fd != -1){
    241e:	57fd                	li	a5,-1
    2420:	08f51863          	bne	a0,a5,24b0 <copyinstr3+0xf0>
  ret = link(b, b);
    2424:	85a6                	mv	a1,s1
    2426:	8526                	mv	a0,s1
    2428:	00003097          	auipc	ra,0x3
    242c:	480080e7          	jalr	1152(ra) # 58a8 <link>
  if(ret != -1){
    2430:	57fd                	li	a5,-1
    2432:	08f51e63          	bne	a0,a5,24ce <copyinstr3+0x10e>
  char *args[] = { "xx", 0 };
    2436:	00005797          	auipc	a5,0x5
    243a:	5ea78793          	addi	a5,a5,1514 # 7a20 <malloc+0x1da2>
    243e:	fcf43823          	sd	a5,-48(s0)
    2442:	fc043c23          	sd	zero,-40(s0)
  ret = exec(b, args);
    2446:	fd040593          	addi	a1,s0,-48
    244a:	8526                	mv	a0,s1
    244c:	00003097          	auipc	ra,0x3
    2450:	434080e7          	jalr	1076(ra) # 5880 <exec>
  if(ret != -1){
    2454:	57fd                	li	a5,-1
    2456:	08f51c63          	bne	a0,a5,24ee <copyinstr3+0x12e>
}
    245a:	70a2                	ld	ra,40(sp)
    245c:	7402                	ld	s0,32(sp)
    245e:	64e2                	ld	s1,24(sp)
    2460:	6145                	addi	sp,sp,48
    2462:	8082                	ret
    sbrk(PGSIZE - (top % PGSIZE));
    2464:	0347d513          	srli	a0,a5,0x34
    2468:	6785                	lui	a5,0x1
    246a:	40a7853b          	subw	a0,a5,a0
    246e:	00003097          	auipc	ra,0x3
    2472:	462080e7          	jalr	1122(ra) # 58d0 <sbrk>
    2476:	b7bd                	j	23e4 <copyinstr3+0x24>
    printf("oops\n");
    2478:	00005517          	auipc	a0,0x5
    247c:	93850513          	addi	a0,a0,-1736 # 6db0 <malloc+0x1132>
    2480:	00003097          	auipc	ra,0x3
    2484:	740080e7          	jalr	1856(ra) # 5bc0 <printf>
    exit(1);
    2488:	4505                	li	a0,1
    248a:	00003097          	auipc	ra,0x3
    248e:	3be080e7          	jalr	958(ra) # 5848 <exit>
    printf("unlink(%s) returned %d, not -1\n", b, ret);
    2492:	862a                	mv	a2,a0
    2494:	85a6                	mv	a1,s1
    2496:	00004517          	auipc	a0,0x4
    249a:	3c250513          	addi	a0,a0,962 # 6858 <malloc+0xbda>
    249e:	00003097          	auipc	ra,0x3
    24a2:	722080e7          	jalr	1826(ra) # 5bc0 <printf>
    exit(1);
    24a6:	4505                	li	a0,1
    24a8:	00003097          	auipc	ra,0x3
    24ac:	3a0080e7          	jalr	928(ra) # 5848 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    24b0:	862a                	mv	a2,a0
    24b2:	85a6                	mv	a1,s1
    24b4:	00004517          	auipc	a0,0x4
    24b8:	3c450513          	addi	a0,a0,964 # 6878 <malloc+0xbfa>
    24bc:	00003097          	auipc	ra,0x3
    24c0:	704080e7          	jalr	1796(ra) # 5bc0 <printf>
    exit(1);
    24c4:	4505                	li	a0,1
    24c6:	00003097          	auipc	ra,0x3
    24ca:	382080e7          	jalr	898(ra) # 5848 <exit>
    printf("link(%s, %s) returned %d, not -1\n", b, b, ret);
    24ce:	86aa                	mv	a3,a0
    24d0:	8626                	mv	a2,s1
    24d2:	85a6                	mv	a1,s1
    24d4:	00004517          	auipc	a0,0x4
    24d8:	3c450513          	addi	a0,a0,964 # 6898 <malloc+0xc1a>
    24dc:	00003097          	auipc	ra,0x3
    24e0:	6e4080e7          	jalr	1764(ra) # 5bc0 <printf>
    exit(1);
    24e4:	4505                	li	a0,1
    24e6:	00003097          	auipc	ra,0x3
    24ea:	362080e7          	jalr	866(ra) # 5848 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    24ee:	567d                	li	a2,-1
    24f0:	85a6                	mv	a1,s1
    24f2:	00004517          	auipc	a0,0x4
    24f6:	3ce50513          	addi	a0,a0,974 # 68c0 <malloc+0xc42>
    24fa:	00003097          	auipc	ra,0x3
    24fe:	6c6080e7          	jalr	1734(ra) # 5bc0 <printf>
    exit(1);
    2502:	4505                	li	a0,1
    2504:	00003097          	auipc	ra,0x3
    2508:	344080e7          	jalr	836(ra) # 5848 <exit>

000000000000250c <rwsbrk>:
{
    250c:	1101                	addi	sp,sp,-32
    250e:	ec06                	sd	ra,24(sp)
    2510:	e822                	sd	s0,16(sp)
    2512:	e426                	sd	s1,8(sp)
    2514:	e04a                	sd	s2,0(sp)
    2516:	1000                	addi	s0,sp,32
  uint64 a = (uint64) sbrk(8192);
    2518:	6509                	lui	a0,0x2
    251a:	00003097          	auipc	ra,0x3
    251e:	3b6080e7          	jalr	950(ra) # 58d0 <sbrk>
  if(a == 0xffffffffffffffffLL) {
    2522:	57fd                	li	a5,-1
    2524:	06f50363          	beq	a0,a5,258a <rwsbrk+0x7e>
    2528:	84aa                	mv	s1,a0
  if ((uint64) sbrk(-8192) ==  0xffffffffffffffffLL) {
    252a:	7579                	lui	a0,0xffffe
    252c:	00003097          	auipc	ra,0x3
    2530:	3a4080e7          	jalr	932(ra) # 58d0 <sbrk>
    2534:	57fd                	li	a5,-1
    2536:	06f50763          	beq	a0,a5,25a4 <rwsbrk+0x98>
  fd = open("rwsbrk", O_CREATE|O_WRONLY);
    253a:	20100593          	li	a1,513
    253e:	00004517          	auipc	a0,0x4
    2542:	8b250513          	addi	a0,a0,-1870 # 5df0 <malloc+0x172>
    2546:	00003097          	auipc	ra,0x3
    254a:	342080e7          	jalr	834(ra) # 5888 <open>
    254e:	892a                	mv	s2,a0
  if(fd < 0){
    2550:	06054763          	bltz	a0,25be <rwsbrk+0xb2>
  n = write(fd, (void*)(a+4096), 1024);
    2554:	6505                	lui	a0,0x1
    2556:	94aa                	add	s1,s1,a0
    2558:	40000613          	li	a2,1024
    255c:	85a6                	mv	a1,s1
    255e:	854a                	mv	a0,s2
    2560:	00003097          	auipc	ra,0x3
    2564:	308080e7          	jalr	776(ra) # 5868 <write>
    2568:	862a                	mv	a2,a0
  if(n >= 0){
    256a:	06054763          	bltz	a0,25d8 <rwsbrk+0xcc>
    printf("write(fd, %p, 1024) returned %d, not -1\n", a+4096, n);
    256e:	85a6                	mv	a1,s1
    2570:	00005517          	auipc	a0,0x5
    2574:	89850513          	addi	a0,a0,-1896 # 6e08 <malloc+0x118a>
    2578:	00003097          	auipc	ra,0x3
    257c:	648080e7          	jalr	1608(ra) # 5bc0 <printf>
    exit(1);
    2580:	4505                	li	a0,1
    2582:	00003097          	auipc	ra,0x3
    2586:	2c6080e7          	jalr	710(ra) # 5848 <exit>
    printf("sbrk(rwsbrk) failed\n");
    258a:	00005517          	auipc	a0,0x5
    258e:	82e50513          	addi	a0,a0,-2002 # 6db8 <malloc+0x113a>
    2592:	00003097          	auipc	ra,0x3
    2596:	62e080e7          	jalr	1582(ra) # 5bc0 <printf>
    exit(1);
    259a:	4505                	li	a0,1
    259c:	00003097          	auipc	ra,0x3
    25a0:	2ac080e7          	jalr	684(ra) # 5848 <exit>
    printf("sbrk(rwsbrk) shrink failed\n");
    25a4:	00005517          	auipc	a0,0x5
    25a8:	82c50513          	addi	a0,a0,-2004 # 6dd0 <malloc+0x1152>
    25ac:	00003097          	auipc	ra,0x3
    25b0:	614080e7          	jalr	1556(ra) # 5bc0 <printf>
    exit(1);
    25b4:	4505                	li	a0,1
    25b6:	00003097          	auipc	ra,0x3
    25ba:	292080e7          	jalr	658(ra) # 5848 <exit>
    printf("open(rwsbrk) failed\n");
    25be:	00005517          	auipc	a0,0x5
    25c2:	83250513          	addi	a0,a0,-1998 # 6df0 <malloc+0x1172>
    25c6:	00003097          	auipc	ra,0x3
    25ca:	5fa080e7          	jalr	1530(ra) # 5bc0 <printf>
    exit(1);
    25ce:	4505                	li	a0,1
    25d0:	00003097          	auipc	ra,0x3
    25d4:	278080e7          	jalr	632(ra) # 5848 <exit>
  close(fd);
    25d8:	854a                	mv	a0,s2
    25da:	00003097          	auipc	ra,0x3
    25de:	296080e7          	jalr	662(ra) # 5870 <close>
  unlink("rwsbrk");
    25e2:	00004517          	auipc	a0,0x4
    25e6:	80e50513          	addi	a0,a0,-2034 # 5df0 <malloc+0x172>
    25ea:	00003097          	auipc	ra,0x3
    25ee:	2ae080e7          	jalr	686(ra) # 5898 <unlink>
  fd = open("README", O_RDONLY);
    25f2:	4581                	li	a1,0
    25f4:	00004517          	auipc	a0,0x4
    25f8:	ca450513          	addi	a0,a0,-860 # 6298 <malloc+0x61a>
    25fc:	00003097          	auipc	ra,0x3
    2600:	28c080e7          	jalr	652(ra) # 5888 <open>
    2604:	892a                	mv	s2,a0
  if(fd < 0){
    2606:	02054963          	bltz	a0,2638 <rwsbrk+0x12c>
  n = read(fd, (void*)(a+4096), 10);
    260a:	4629                	li	a2,10
    260c:	85a6                	mv	a1,s1
    260e:	00003097          	auipc	ra,0x3
    2612:	252080e7          	jalr	594(ra) # 5860 <read>
    2616:	862a                	mv	a2,a0
  if(n >= 0){
    2618:	02054d63          	bltz	a0,2652 <rwsbrk+0x146>
    printf("read(fd, %p, 10) returned %d, not -1\n", a+4096, n);
    261c:	85a6                	mv	a1,s1
    261e:	00005517          	auipc	a0,0x5
    2622:	81a50513          	addi	a0,a0,-2022 # 6e38 <malloc+0x11ba>
    2626:	00003097          	auipc	ra,0x3
    262a:	59a080e7          	jalr	1434(ra) # 5bc0 <printf>
    exit(1);
    262e:	4505                	li	a0,1
    2630:	00003097          	auipc	ra,0x3
    2634:	218080e7          	jalr	536(ra) # 5848 <exit>
    printf("open(rwsbrk) failed\n");
    2638:	00004517          	auipc	a0,0x4
    263c:	7b850513          	addi	a0,a0,1976 # 6df0 <malloc+0x1172>
    2640:	00003097          	auipc	ra,0x3
    2644:	580080e7          	jalr	1408(ra) # 5bc0 <printf>
    exit(1);
    2648:	4505                	li	a0,1
    264a:	00003097          	auipc	ra,0x3
    264e:	1fe080e7          	jalr	510(ra) # 5848 <exit>
  close(fd);
    2652:	854a                	mv	a0,s2
    2654:	00003097          	auipc	ra,0x3
    2658:	21c080e7          	jalr	540(ra) # 5870 <close>
  exit(0);
    265c:	4501                	li	a0,0
    265e:	00003097          	auipc	ra,0x3
    2662:	1ea080e7          	jalr	490(ra) # 5848 <exit>

0000000000002666 <sbrkbasic>:
{
    2666:	7139                	addi	sp,sp,-64
    2668:	fc06                	sd	ra,56(sp)
    266a:	f822                	sd	s0,48(sp)
    266c:	f426                	sd	s1,40(sp)
    266e:	f04a                	sd	s2,32(sp)
    2670:	ec4e                	sd	s3,24(sp)
    2672:	e852                	sd	s4,16(sp)
    2674:	0080                	addi	s0,sp,64
    2676:	8a2a                	mv	s4,a0
  pid = fork();
    2678:	00003097          	auipc	ra,0x3
    267c:	1c8080e7          	jalr	456(ra) # 5840 <fork>
  if(pid < 0){
    2680:	02054c63          	bltz	a0,26b8 <sbrkbasic+0x52>
  if(pid == 0){
    2684:	ed21                	bnez	a0,26dc <sbrkbasic+0x76>
    a = sbrk(TOOMUCH);
    2686:	40000537          	lui	a0,0x40000
    268a:	00003097          	auipc	ra,0x3
    268e:	246080e7          	jalr	582(ra) # 58d0 <sbrk>
    if(a == (char*)0xffffffffffffffffL){
    2692:	57fd                	li	a5,-1
    2694:	02f50f63          	beq	a0,a5,26d2 <sbrkbasic+0x6c>
    for(b = a; b < a+TOOMUCH; b += 4096){
    2698:	400007b7          	lui	a5,0x40000
    269c:	97aa                	add	a5,a5,a0
      *b = 99;
    269e:	06300693          	li	a3,99
    for(b = a; b < a+TOOMUCH; b += 4096){
    26a2:	6705                	lui	a4,0x1
      *b = 99;
    26a4:	00d50023          	sb	a3,0(a0) # 40000000 <__BSS_END__+0x3fff1268>
    for(b = a; b < a+TOOMUCH; b += 4096){
    26a8:	953a                	add	a0,a0,a4
    26aa:	fef51de3          	bne	a0,a5,26a4 <sbrkbasic+0x3e>
    exit(1);
    26ae:	4505                	li	a0,1
    26b0:	00003097          	auipc	ra,0x3
    26b4:	198080e7          	jalr	408(ra) # 5848 <exit>
    printf("fork failed in sbrkbasic\n");
    26b8:	00004517          	auipc	a0,0x4
    26bc:	7a850513          	addi	a0,a0,1960 # 6e60 <malloc+0x11e2>
    26c0:	00003097          	auipc	ra,0x3
    26c4:	500080e7          	jalr	1280(ra) # 5bc0 <printf>
    exit(1);
    26c8:	4505                	li	a0,1
    26ca:	00003097          	auipc	ra,0x3
    26ce:	17e080e7          	jalr	382(ra) # 5848 <exit>
      exit(0);
    26d2:	4501                	li	a0,0
    26d4:	00003097          	auipc	ra,0x3
    26d8:	174080e7          	jalr	372(ra) # 5848 <exit>
  wait(&xstatus);
    26dc:	fcc40513          	addi	a0,s0,-52
    26e0:	00003097          	auipc	ra,0x3
    26e4:	170080e7          	jalr	368(ra) # 5850 <wait>
  if(xstatus == 1){
    26e8:	fcc42703          	lw	a4,-52(s0)
    26ec:	4785                	li	a5,1
    26ee:	00f70d63          	beq	a4,a5,2708 <sbrkbasic+0xa2>
  a = sbrk(0);
    26f2:	4501                	li	a0,0
    26f4:	00003097          	auipc	ra,0x3
    26f8:	1dc080e7          	jalr	476(ra) # 58d0 <sbrk>
    26fc:	84aa                	mv	s1,a0
  for(i = 0; i < 5000; i++){
    26fe:	4901                	li	s2,0
    2700:	6985                	lui	s3,0x1
    2702:	38898993          	addi	s3,s3,904 # 1388 <copyinstr2+0x1d6>
    2706:	a005                	j	2726 <sbrkbasic+0xc0>
    printf("%s: too much memory allocated!\n", s);
    2708:	85d2                	mv	a1,s4
    270a:	00004517          	auipc	a0,0x4
    270e:	77650513          	addi	a0,a0,1910 # 6e80 <malloc+0x1202>
    2712:	00003097          	auipc	ra,0x3
    2716:	4ae080e7          	jalr	1198(ra) # 5bc0 <printf>
    exit(1);
    271a:	4505                	li	a0,1
    271c:	00003097          	auipc	ra,0x3
    2720:	12c080e7          	jalr	300(ra) # 5848 <exit>
    a = b + 1;
    2724:	84be                	mv	s1,a5
    b = sbrk(1);
    2726:	4505                	li	a0,1
    2728:	00003097          	auipc	ra,0x3
    272c:	1a8080e7          	jalr	424(ra) # 58d0 <sbrk>
    if(b != a){
    2730:	04951c63          	bne	a0,s1,2788 <sbrkbasic+0x122>
    *b = 1;
    2734:	4785                	li	a5,1
    2736:	00f48023          	sb	a5,0(s1)
    a = b + 1;
    273a:	00148793          	addi	a5,s1,1
  for(i = 0; i < 5000; i++){
    273e:	2905                	addiw	s2,s2,1
    2740:	ff3912e3          	bne	s2,s3,2724 <sbrkbasic+0xbe>
  pid = fork();
    2744:	00003097          	auipc	ra,0x3
    2748:	0fc080e7          	jalr	252(ra) # 5840 <fork>
    274c:	892a                	mv	s2,a0
  if(pid < 0){
    274e:	04054e63          	bltz	a0,27aa <sbrkbasic+0x144>
  c = sbrk(1);
    2752:	4505                	li	a0,1
    2754:	00003097          	auipc	ra,0x3
    2758:	17c080e7          	jalr	380(ra) # 58d0 <sbrk>
  c = sbrk(1);
    275c:	4505                	li	a0,1
    275e:	00003097          	auipc	ra,0x3
    2762:	172080e7          	jalr	370(ra) # 58d0 <sbrk>
  if(c != a + 1){
    2766:	0489                	addi	s1,s1,2
    2768:	04a48f63          	beq	s1,a0,27c6 <sbrkbasic+0x160>
    printf("%s: sbrk test failed post-fork\n", s);
    276c:	85d2                	mv	a1,s4
    276e:	00004517          	auipc	a0,0x4
    2772:	77250513          	addi	a0,a0,1906 # 6ee0 <malloc+0x1262>
    2776:	00003097          	auipc	ra,0x3
    277a:	44a080e7          	jalr	1098(ra) # 5bc0 <printf>
    exit(1);
    277e:	4505                	li	a0,1
    2780:	00003097          	auipc	ra,0x3
    2784:	0c8080e7          	jalr	200(ra) # 5848 <exit>
      printf("%s: sbrk test failed %d %x %x\n", s, i, a, b);
    2788:	872a                	mv	a4,a0
    278a:	86a6                	mv	a3,s1
    278c:	864a                	mv	a2,s2
    278e:	85d2                	mv	a1,s4
    2790:	00004517          	auipc	a0,0x4
    2794:	71050513          	addi	a0,a0,1808 # 6ea0 <malloc+0x1222>
    2798:	00003097          	auipc	ra,0x3
    279c:	428080e7          	jalr	1064(ra) # 5bc0 <printf>
      exit(1);
    27a0:	4505                	li	a0,1
    27a2:	00003097          	auipc	ra,0x3
    27a6:	0a6080e7          	jalr	166(ra) # 5848 <exit>
    printf("%s: sbrk test fork failed\n", s);
    27aa:	85d2                	mv	a1,s4
    27ac:	00004517          	auipc	a0,0x4
    27b0:	71450513          	addi	a0,a0,1812 # 6ec0 <malloc+0x1242>
    27b4:	00003097          	auipc	ra,0x3
    27b8:	40c080e7          	jalr	1036(ra) # 5bc0 <printf>
    exit(1);
    27bc:	4505                	li	a0,1
    27be:	00003097          	auipc	ra,0x3
    27c2:	08a080e7          	jalr	138(ra) # 5848 <exit>
  if(pid == 0)
    27c6:	00091763          	bnez	s2,27d4 <sbrkbasic+0x16e>
    exit(0);
    27ca:	4501                	li	a0,0
    27cc:	00003097          	auipc	ra,0x3
    27d0:	07c080e7          	jalr	124(ra) # 5848 <exit>
  wait(&xstatus);
    27d4:	fcc40513          	addi	a0,s0,-52
    27d8:	00003097          	auipc	ra,0x3
    27dc:	078080e7          	jalr	120(ra) # 5850 <wait>
  exit(xstatus);
    27e0:	fcc42503          	lw	a0,-52(s0)
    27e4:	00003097          	auipc	ra,0x3
    27e8:	064080e7          	jalr	100(ra) # 5848 <exit>

00000000000027ec <sbrkmuch>:
{
    27ec:	7179                	addi	sp,sp,-48
    27ee:	f406                	sd	ra,40(sp)
    27f0:	f022                	sd	s0,32(sp)
    27f2:	ec26                	sd	s1,24(sp)
    27f4:	e84a                	sd	s2,16(sp)
    27f6:	e44e                	sd	s3,8(sp)
    27f8:	e052                	sd	s4,0(sp)
    27fa:	1800                	addi	s0,sp,48
    27fc:	89aa                	mv	s3,a0
  oldbrk = sbrk(0);
    27fe:	4501                	li	a0,0
    2800:	00003097          	auipc	ra,0x3
    2804:	0d0080e7          	jalr	208(ra) # 58d0 <sbrk>
    2808:	892a                	mv	s2,a0
  a = sbrk(0);
    280a:	4501                	li	a0,0
    280c:	00003097          	auipc	ra,0x3
    2810:	0c4080e7          	jalr	196(ra) # 58d0 <sbrk>
    2814:	84aa                	mv	s1,a0
  p = sbrk(amt);
    2816:	06400537          	lui	a0,0x6400
    281a:	9d05                	subw	a0,a0,s1
    281c:	00003097          	auipc	ra,0x3
    2820:	0b4080e7          	jalr	180(ra) # 58d0 <sbrk>
  if (p != a) {
    2824:	0ca49863          	bne	s1,a0,28f4 <sbrkmuch+0x108>
  char *eee = sbrk(0);
    2828:	4501                	li	a0,0
    282a:	00003097          	auipc	ra,0x3
    282e:	0a6080e7          	jalr	166(ra) # 58d0 <sbrk>
    2832:	87aa                	mv	a5,a0
  for(char *pp = a; pp < eee; pp += 4096)
    2834:	00a4f963          	bgeu	s1,a0,2846 <sbrkmuch+0x5a>
    *pp = 1;
    2838:	4685                	li	a3,1
  for(char *pp = a; pp < eee; pp += 4096)
    283a:	6705                	lui	a4,0x1
    *pp = 1;
    283c:	00d48023          	sb	a3,0(s1)
  for(char *pp = a; pp < eee; pp += 4096)
    2840:	94ba                	add	s1,s1,a4
    2842:	fef4ede3          	bltu	s1,a5,283c <sbrkmuch+0x50>
  *lastaddr = 99;
    2846:	064007b7          	lui	a5,0x6400
    284a:	06300713          	li	a4,99
    284e:	fee78fa3          	sb	a4,-1(a5) # 63fffff <__BSS_END__+0x63f1267>
  a = sbrk(0);
    2852:	4501                	li	a0,0
    2854:	00003097          	auipc	ra,0x3
    2858:	07c080e7          	jalr	124(ra) # 58d0 <sbrk>
    285c:	84aa                	mv	s1,a0
  c = sbrk(-PGSIZE);
    285e:	757d                	lui	a0,0xfffff
    2860:	00003097          	auipc	ra,0x3
    2864:	070080e7          	jalr	112(ra) # 58d0 <sbrk>
  if(c == (char*)0xffffffffffffffffL){
    2868:	57fd                	li	a5,-1
    286a:	0af50363          	beq	a0,a5,2910 <sbrkmuch+0x124>
  c = sbrk(0);
    286e:	4501                	li	a0,0
    2870:	00003097          	auipc	ra,0x3
    2874:	060080e7          	jalr	96(ra) # 58d0 <sbrk>
  if(c != a - PGSIZE){
    2878:	77fd                	lui	a5,0xfffff
    287a:	97a6                	add	a5,a5,s1
    287c:	0af51863          	bne	a0,a5,292c <sbrkmuch+0x140>
  a = sbrk(0);
    2880:	4501                	li	a0,0
    2882:	00003097          	auipc	ra,0x3
    2886:	04e080e7          	jalr	78(ra) # 58d0 <sbrk>
    288a:	84aa                	mv	s1,a0
  c = sbrk(PGSIZE);
    288c:	6505                	lui	a0,0x1
    288e:	00003097          	auipc	ra,0x3
    2892:	042080e7          	jalr	66(ra) # 58d0 <sbrk>
    2896:	8a2a                	mv	s4,a0
  if(c != a || sbrk(0) != a + PGSIZE){
    2898:	0aa49a63          	bne	s1,a0,294c <sbrkmuch+0x160>
    289c:	4501                	li	a0,0
    289e:	00003097          	auipc	ra,0x3
    28a2:	032080e7          	jalr	50(ra) # 58d0 <sbrk>
    28a6:	6785                	lui	a5,0x1
    28a8:	97a6                	add	a5,a5,s1
    28aa:	0af51163          	bne	a0,a5,294c <sbrkmuch+0x160>
  if(*lastaddr == 99){
    28ae:	064007b7          	lui	a5,0x6400
    28b2:	fff7c703          	lbu	a4,-1(a5) # 63fffff <__BSS_END__+0x63f1267>
    28b6:	06300793          	li	a5,99
    28ba:	0af70963          	beq	a4,a5,296c <sbrkmuch+0x180>
  a = sbrk(0);
    28be:	4501                	li	a0,0
    28c0:	00003097          	auipc	ra,0x3
    28c4:	010080e7          	jalr	16(ra) # 58d0 <sbrk>
    28c8:	84aa                	mv	s1,a0
  c = sbrk(-(sbrk(0) - oldbrk));
    28ca:	4501                	li	a0,0
    28cc:	00003097          	auipc	ra,0x3
    28d0:	004080e7          	jalr	4(ra) # 58d0 <sbrk>
    28d4:	40a9053b          	subw	a0,s2,a0
    28d8:	00003097          	auipc	ra,0x3
    28dc:	ff8080e7          	jalr	-8(ra) # 58d0 <sbrk>
  if(c != a){
    28e0:	0aa49463          	bne	s1,a0,2988 <sbrkmuch+0x19c>
}
    28e4:	70a2                	ld	ra,40(sp)
    28e6:	7402                	ld	s0,32(sp)
    28e8:	64e2                	ld	s1,24(sp)
    28ea:	6942                	ld	s2,16(sp)
    28ec:	69a2                	ld	s3,8(sp)
    28ee:	6a02                	ld	s4,0(sp)
    28f0:	6145                	addi	sp,sp,48
    28f2:	8082                	ret
    printf("%s: sbrk test failed to grow big address space; enough phys mem?\n", s);
    28f4:	85ce                	mv	a1,s3
    28f6:	00004517          	auipc	a0,0x4
    28fa:	60a50513          	addi	a0,a0,1546 # 6f00 <malloc+0x1282>
    28fe:	00003097          	auipc	ra,0x3
    2902:	2c2080e7          	jalr	706(ra) # 5bc0 <printf>
    exit(1);
    2906:	4505                	li	a0,1
    2908:	00003097          	auipc	ra,0x3
    290c:	f40080e7          	jalr	-192(ra) # 5848 <exit>
    printf("%s: sbrk could not deallocate\n", s);
    2910:	85ce                	mv	a1,s3
    2912:	00004517          	auipc	a0,0x4
    2916:	63650513          	addi	a0,a0,1590 # 6f48 <malloc+0x12ca>
    291a:	00003097          	auipc	ra,0x3
    291e:	2a6080e7          	jalr	678(ra) # 5bc0 <printf>
    exit(1);
    2922:	4505                	li	a0,1
    2924:	00003097          	auipc	ra,0x3
    2928:	f24080e7          	jalr	-220(ra) # 5848 <exit>
    printf("%s: sbrk deallocation produced wrong address, a %x c %x\n", s, a, c);
    292c:	86aa                	mv	a3,a0
    292e:	8626                	mv	a2,s1
    2930:	85ce                	mv	a1,s3
    2932:	00004517          	auipc	a0,0x4
    2936:	63650513          	addi	a0,a0,1590 # 6f68 <malloc+0x12ea>
    293a:	00003097          	auipc	ra,0x3
    293e:	286080e7          	jalr	646(ra) # 5bc0 <printf>
    exit(1);
    2942:	4505                	li	a0,1
    2944:	00003097          	auipc	ra,0x3
    2948:	f04080e7          	jalr	-252(ra) # 5848 <exit>
    printf("%s: sbrk re-allocation failed, a %x c %x\n", s, a, c);
    294c:	86d2                	mv	a3,s4
    294e:	8626                	mv	a2,s1
    2950:	85ce                	mv	a1,s3
    2952:	00004517          	auipc	a0,0x4
    2956:	65650513          	addi	a0,a0,1622 # 6fa8 <malloc+0x132a>
    295a:	00003097          	auipc	ra,0x3
    295e:	266080e7          	jalr	614(ra) # 5bc0 <printf>
    exit(1);
    2962:	4505                	li	a0,1
    2964:	00003097          	auipc	ra,0x3
    2968:	ee4080e7          	jalr	-284(ra) # 5848 <exit>
    printf("%s: sbrk de-allocation didn't really deallocate\n", s);
    296c:	85ce                	mv	a1,s3
    296e:	00004517          	auipc	a0,0x4
    2972:	66a50513          	addi	a0,a0,1642 # 6fd8 <malloc+0x135a>
    2976:	00003097          	auipc	ra,0x3
    297a:	24a080e7          	jalr	586(ra) # 5bc0 <printf>
    exit(1);
    297e:	4505                	li	a0,1
    2980:	00003097          	auipc	ra,0x3
    2984:	ec8080e7          	jalr	-312(ra) # 5848 <exit>
    printf("%s: sbrk downsize failed, a %x c %x\n", s, a, c);
    2988:	86aa                	mv	a3,a0
    298a:	8626                	mv	a2,s1
    298c:	85ce                	mv	a1,s3
    298e:	00004517          	auipc	a0,0x4
    2992:	68250513          	addi	a0,a0,1666 # 7010 <malloc+0x1392>
    2996:	00003097          	auipc	ra,0x3
    299a:	22a080e7          	jalr	554(ra) # 5bc0 <printf>
    exit(1);
    299e:	4505                	li	a0,1
    29a0:	00003097          	auipc	ra,0x3
    29a4:	ea8080e7          	jalr	-344(ra) # 5848 <exit>

00000000000029a8 <sbrkarg>:
{
    29a8:	7179                	addi	sp,sp,-48
    29aa:	f406                	sd	ra,40(sp)
    29ac:	f022                	sd	s0,32(sp)
    29ae:	ec26                	sd	s1,24(sp)
    29b0:	e84a                	sd	s2,16(sp)
    29b2:	e44e                	sd	s3,8(sp)
    29b4:	1800                	addi	s0,sp,48
    29b6:	89aa                	mv	s3,a0
  a = sbrk(PGSIZE);
    29b8:	6505                	lui	a0,0x1
    29ba:	00003097          	auipc	ra,0x3
    29be:	f16080e7          	jalr	-234(ra) # 58d0 <sbrk>
    29c2:	892a                	mv	s2,a0
  fd = open("sbrk", O_CREATE|O_WRONLY);
    29c4:	20100593          	li	a1,513
    29c8:	00004517          	auipc	a0,0x4
    29cc:	67050513          	addi	a0,a0,1648 # 7038 <malloc+0x13ba>
    29d0:	00003097          	auipc	ra,0x3
    29d4:	eb8080e7          	jalr	-328(ra) # 5888 <open>
    29d8:	84aa                	mv	s1,a0
  unlink("sbrk");
    29da:	00004517          	auipc	a0,0x4
    29de:	65e50513          	addi	a0,a0,1630 # 7038 <malloc+0x13ba>
    29e2:	00003097          	auipc	ra,0x3
    29e6:	eb6080e7          	jalr	-330(ra) # 5898 <unlink>
  if(fd < 0)  {
    29ea:	0404c163          	bltz	s1,2a2c <sbrkarg+0x84>
  if ((n = write(fd, a, PGSIZE)) < 0) {
    29ee:	6605                	lui	a2,0x1
    29f0:	85ca                	mv	a1,s2
    29f2:	8526                	mv	a0,s1
    29f4:	00003097          	auipc	ra,0x3
    29f8:	e74080e7          	jalr	-396(ra) # 5868 <write>
    29fc:	04054663          	bltz	a0,2a48 <sbrkarg+0xa0>
  close(fd);
    2a00:	8526                	mv	a0,s1
    2a02:	00003097          	auipc	ra,0x3
    2a06:	e6e080e7          	jalr	-402(ra) # 5870 <close>
  a = sbrk(PGSIZE);
    2a0a:	6505                	lui	a0,0x1
    2a0c:	00003097          	auipc	ra,0x3
    2a10:	ec4080e7          	jalr	-316(ra) # 58d0 <sbrk>
  if(pipe((int *) a) != 0){
    2a14:	00003097          	auipc	ra,0x3
    2a18:	e44080e7          	jalr	-444(ra) # 5858 <pipe>
    2a1c:	e521                	bnez	a0,2a64 <sbrkarg+0xbc>
}
    2a1e:	70a2                	ld	ra,40(sp)
    2a20:	7402                	ld	s0,32(sp)
    2a22:	64e2                	ld	s1,24(sp)
    2a24:	6942                	ld	s2,16(sp)
    2a26:	69a2                	ld	s3,8(sp)
    2a28:	6145                	addi	sp,sp,48
    2a2a:	8082                	ret
    printf("%s: open sbrk failed\n", s);
    2a2c:	85ce                	mv	a1,s3
    2a2e:	00004517          	auipc	a0,0x4
    2a32:	61250513          	addi	a0,a0,1554 # 7040 <malloc+0x13c2>
    2a36:	00003097          	auipc	ra,0x3
    2a3a:	18a080e7          	jalr	394(ra) # 5bc0 <printf>
    exit(1);
    2a3e:	4505                	li	a0,1
    2a40:	00003097          	auipc	ra,0x3
    2a44:	e08080e7          	jalr	-504(ra) # 5848 <exit>
    printf("%s: write sbrk failed\n", s);
    2a48:	85ce                	mv	a1,s3
    2a4a:	00004517          	auipc	a0,0x4
    2a4e:	60e50513          	addi	a0,a0,1550 # 7058 <malloc+0x13da>
    2a52:	00003097          	auipc	ra,0x3
    2a56:	16e080e7          	jalr	366(ra) # 5bc0 <printf>
    exit(1);
    2a5a:	4505                	li	a0,1
    2a5c:	00003097          	auipc	ra,0x3
    2a60:	dec080e7          	jalr	-532(ra) # 5848 <exit>
    printf("%s: pipe() failed\n", s);
    2a64:	85ce                	mv	a1,s3
    2a66:	00004517          	auipc	a0,0x4
    2a6a:	fda50513          	addi	a0,a0,-38 # 6a40 <malloc+0xdc2>
    2a6e:	00003097          	auipc	ra,0x3
    2a72:	152080e7          	jalr	338(ra) # 5bc0 <printf>
    exit(1);
    2a76:	4505                	li	a0,1
    2a78:	00003097          	auipc	ra,0x3
    2a7c:	dd0080e7          	jalr	-560(ra) # 5848 <exit>

0000000000002a80 <argptest>:
{
    2a80:	1101                	addi	sp,sp,-32
    2a82:	ec06                	sd	ra,24(sp)
    2a84:	e822                	sd	s0,16(sp)
    2a86:	e426                	sd	s1,8(sp)
    2a88:	e04a                	sd	s2,0(sp)
    2a8a:	1000                	addi	s0,sp,32
    2a8c:	892a                	mv	s2,a0
  fd = open("init", O_RDONLY);
    2a8e:	4581                	li	a1,0
    2a90:	00004517          	auipc	a0,0x4
    2a94:	5e050513          	addi	a0,a0,1504 # 7070 <malloc+0x13f2>
    2a98:	00003097          	auipc	ra,0x3
    2a9c:	df0080e7          	jalr	-528(ra) # 5888 <open>
  if (fd < 0) {
    2aa0:	02054b63          	bltz	a0,2ad6 <argptest+0x56>
    2aa4:	84aa                	mv	s1,a0
  read(fd, sbrk(0) - 1, -1);
    2aa6:	4501                	li	a0,0
    2aa8:	00003097          	auipc	ra,0x3
    2aac:	e28080e7          	jalr	-472(ra) # 58d0 <sbrk>
    2ab0:	567d                	li	a2,-1
    2ab2:	fff50593          	addi	a1,a0,-1
    2ab6:	8526                	mv	a0,s1
    2ab8:	00003097          	auipc	ra,0x3
    2abc:	da8080e7          	jalr	-600(ra) # 5860 <read>
  close(fd);
    2ac0:	8526                	mv	a0,s1
    2ac2:	00003097          	auipc	ra,0x3
    2ac6:	dae080e7          	jalr	-594(ra) # 5870 <close>
}
    2aca:	60e2                	ld	ra,24(sp)
    2acc:	6442                	ld	s0,16(sp)
    2ace:	64a2                	ld	s1,8(sp)
    2ad0:	6902                	ld	s2,0(sp)
    2ad2:	6105                	addi	sp,sp,32
    2ad4:	8082                	ret
    printf("%s: open failed\n", s);
    2ad6:	85ca                	mv	a1,s2
    2ad8:	00004517          	auipc	a0,0x4
    2adc:	e7850513          	addi	a0,a0,-392 # 6950 <malloc+0xcd2>
    2ae0:	00003097          	auipc	ra,0x3
    2ae4:	0e0080e7          	jalr	224(ra) # 5bc0 <printf>
    exit(1);
    2ae8:	4505                	li	a0,1
    2aea:	00003097          	auipc	ra,0x3
    2aee:	d5e080e7          	jalr	-674(ra) # 5848 <exit>

0000000000002af2 <sbrkbugs>:
{
    2af2:	1141                	addi	sp,sp,-16
    2af4:	e406                	sd	ra,8(sp)
    2af6:	e022                	sd	s0,0(sp)
    2af8:	0800                	addi	s0,sp,16
  int pid = fork();
    2afa:	00003097          	auipc	ra,0x3
    2afe:	d46080e7          	jalr	-698(ra) # 5840 <fork>
  if(pid < 0){
    2b02:	02054263          	bltz	a0,2b26 <sbrkbugs+0x34>
  if(pid == 0){
    2b06:	ed0d                	bnez	a0,2b40 <sbrkbugs+0x4e>
    int sz = (uint64) sbrk(0);
    2b08:	00003097          	auipc	ra,0x3
    2b0c:	dc8080e7          	jalr	-568(ra) # 58d0 <sbrk>
    sbrk(-sz);
    2b10:	40a0053b          	negw	a0,a0
    2b14:	00003097          	auipc	ra,0x3
    2b18:	dbc080e7          	jalr	-580(ra) # 58d0 <sbrk>
    exit(0);
    2b1c:	4501                	li	a0,0
    2b1e:	00003097          	auipc	ra,0x3
    2b22:	d2a080e7          	jalr	-726(ra) # 5848 <exit>
    printf("fork failed\n");
    2b26:	00004517          	auipc	a0,0x4
    2b2a:	23250513          	addi	a0,a0,562 # 6d58 <malloc+0x10da>
    2b2e:	00003097          	auipc	ra,0x3
    2b32:	092080e7          	jalr	146(ra) # 5bc0 <printf>
    exit(1);
    2b36:	4505                	li	a0,1
    2b38:	00003097          	auipc	ra,0x3
    2b3c:	d10080e7          	jalr	-752(ra) # 5848 <exit>
  wait(0);
    2b40:	4501                	li	a0,0
    2b42:	00003097          	auipc	ra,0x3
    2b46:	d0e080e7          	jalr	-754(ra) # 5850 <wait>
  pid = fork();
    2b4a:	00003097          	auipc	ra,0x3
    2b4e:	cf6080e7          	jalr	-778(ra) # 5840 <fork>
  if(pid < 0){
    2b52:	02054563          	bltz	a0,2b7c <sbrkbugs+0x8a>
  if(pid == 0){
    2b56:	e121                	bnez	a0,2b96 <sbrkbugs+0xa4>
    int sz = (uint64) sbrk(0);
    2b58:	00003097          	auipc	ra,0x3
    2b5c:	d78080e7          	jalr	-648(ra) # 58d0 <sbrk>
    sbrk(-(sz - 3500));
    2b60:	6785                	lui	a5,0x1
    2b62:	dac7879b          	addiw	a5,a5,-596
    2b66:	40a7853b          	subw	a0,a5,a0
    2b6a:	00003097          	auipc	ra,0x3
    2b6e:	d66080e7          	jalr	-666(ra) # 58d0 <sbrk>
    exit(0);
    2b72:	4501                	li	a0,0
    2b74:	00003097          	auipc	ra,0x3
    2b78:	cd4080e7          	jalr	-812(ra) # 5848 <exit>
    printf("fork failed\n");
    2b7c:	00004517          	auipc	a0,0x4
    2b80:	1dc50513          	addi	a0,a0,476 # 6d58 <malloc+0x10da>
    2b84:	00003097          	auipc	ra,0x3
    2b88:	03c080e7          	jalr	60(ra) # 5bc0 <printf>
    exit(1);
    2b8c:	4505                	li	a0,1
    2b8e:	00003097          	auipc	ra,0x3
    2b92:	cba080e7          	jalr	-838(ra) # 5848 <exit>
  wait(0);
    2b96:	4501                	li	a0,0
    2b98:	00003097          	auipc	ra,0x3
    2b9c:	cb8080e7          	jalr	-840(ra) # 5850 <wait>
  pid = fork();
    2ba0:	00003097          	auipc	ra,0x3
    2ba4:	ca0080e7          	jalr	-864(ra) # 5840 <fork>
  if(pid < 0){
    2ba8:	02054a63          	bltz	a0,2bdc <sbrkbugs+0xea>
  if(pid == 0){
    2bac:	e529                	bnez	a0,2bf6 <sbrkbugs+0x104>
    sbrk((10*4096 + 2048) - (uint64)sbrk(0));
    2bae:	00003097          	auipc	ra,0x3
    2bb2:	d22080e7          	jalr	-734(ra) # 58d0 <sbrk>
    2bb6:	67ad                	lui	a5,0xb
    2bb8:	8007879b          	addiw	a5,a5,-2048
    2bbc:	40a7853b          	subw	a0,a5,a0
    2bc0:	00003097          	auipc	ra,0x3
    2bc4:	d10080e7          	jalr	-752(ra) # 58d0 <sbrk>
    sbrk(-10);
    2bc8:	5559                	li	a0,-10
    2bca:	00003097          	auipc	ra,0x3
    2bce:	d06080e7          	jalr	-762(ra) # 58d0 <sbrk>
    exit(0);
    2bd2:	4501                	li	a0,0
    2bd4:	00003097          	auipc	ra,0x3
    2bd8:	c74080e7          	jalr	-908(ra) # 5848 <exit>
    printf("fork failed\n");
    2bdc:	00004517          	auipc	a0,0x4
    2be0:	17c50513          	addi	a0,a0,380 # 6d58 <malloc+0x10da>
    2be4:	00003097          	auipc	ra,0x3
    2be8:	fdc080e7          	jalr	-36(ra) # 5bc0 <printf>
    exit(1);
    2bec:	4505                	li	a0,1
    2bee:	00003097          	auipc	ra,0x3
    2bf2:	c5a080e7          	jalr	-934(ra) # 5848 <exit>
  wait(0);
    2bf6:	4501                	li	a0,0
    2bf8:	00003097          	auipc	ra,0x3
    2bfc:	c58080e7          	jalr	-936(ra) # 5850 <wait>
  exit(0);
    2c00:	4501                	li	a0,0
    2c02:	00003097          	auipc	ra,0x3
    2c06:	c46080e7          	jalr	-954(ra) # 5848 <exit>

0000000000002c0a <sbrklast>:
{
    2c0a:	7179                	addi	sp,sp,-48
    2c0c:	f406                	sd	ra,40(sp)
    2c0e:	f022                	sd	s0,32(sp)
    2c10:	ec26                	sd	s1,24(sp)
    2c12:	e84a                	sd	s2,16(sp)
    2c14:	e44e                	sd	s3,8(sp)
    2c16:	e052                	sd	s4,0(sp)
    2c18:	1800                	addi	s0,sp,48
  uint64 top = (uint64) sbrk(0);
    2c1a:	4501                	li	a0,0
    2c1c:	00003097          	auipc	ra,0x3
    2c20:	cb4080e7          	jalr	-844(ra) # 58d0 <sbrk>
  if((top % 4096) != 0)
    2c24:	03451793          	slli	a5,a0,0x34
    2c28:	ebd9                	bnez	a5,2cbe <sbrklast+0xb4>
  sbrk(4096);
    2c2a:	6505                	lui	a0,0x1
    2c2c:	00003097          	auipc	ra,0x3
    2c30:	ca4080e7          	jalr	-860(ra) # 58d0 <sbrk>
  sbrk(10);
    2c34:	4529                	li	a0,10
    2c36:	00003097          	auipc	ra,0x3
    2c3a:	c9a080e7          	jalr	-870(ra) # 58d0 <sbrk>
  sbrk(-20);
    2c3e:	5531                	li	a0,-20
    2c40:	00003097          	auipc	ra,0x3
    2c44:	c90080e7          	jalr	-880(ra) # 58d0 <sbrk>
  top = (uint64) sbrk(0);
    2c48:	4501                	li	a0,0
    2c4a:	00003097          	auipc	ra,0x3
    2c4e:	c86080e7          	jalr	-890(ra) # 58d0 <sbrk>
    2c52:	84aa                	mv	s1,a0
  char *p = (char *) (top - 64);
    2c54:	fc050913          	addi	s2,a0,-64 # fc0 <bigdir+0x5e>
  p[0] = 'x';
    2c58:	07800a13          	li	s4,120
    2c5c:	fd450023          	sb	s4,-64(a0)
  p[1] = '\0';
    2c60:	fc0500a3          	sb	zero,-63(a0)
  int fd = open(p, O_RDWR|O_CREATE);
    2c64:	20200593          	li	a1,514
    2c68:	854a                	mv	a0,s2
    2c6a:	00003097          	auipc	ra,0x3
    2c6e:	c1e080e7          	jalr	-994(ra) # 5888 <open>
    2c72:	89aa                	mv	s3,a0
  write(fd, p, 1);
    2c74:	4605                	li	a2,1
    2c76:	85ca                	mv	a1,s2
    2c78:	00003097          	auipc	ra,0x3
    2c7c:	bf0080e7          	jalr	-1040(ra) # 5868 <write>
  close(fd);
    2c80:	854e                	mv	a0,s3
    2c82:	00003097          	auipc	ra,0x3
    2c86:	bee080e7          	jalr	-1042(ra) # 5870 <close>
  fd = open(p, O_RDWR);
    2c8a:	4589                	li	a1,2
    2c8c:	854a                	mv	a0,s2
    2c8e:	00003097          	auipc	ra,0x3
    2c92:	bfa080e7          	jalr	-1030(ra) # 5888 <open>
  p[0] = '\0';
    2c96:	fc048023          	sb	zero,-64(s1)
  read(fd, p, 1);
    2c9a:	4605                	li	a2,1
    2c9c:	85ca                	mv	a1,s2
    2c9e:	00003097          	auipc	ra,0x3
    2ca2:	bc2080e7          	jalr	-1086(ra) # 5860 <read>
  if(p[0] != 'x')
    2ca6:	fc04c783          	lbu	a5,-64(s1)
    2caa:	03479463          	bne	a5,s4,2cd2 <sbrklast+0xc8>
}
    2cae:	70a2                	ld	ra,40(sp)
    2cb0:	7402                	ld	s0,32(sp)
    2cb2:	64e2                	ld	s1,24(sp)
    2cb4:	6942                	ld	s2,16(sp)
    2cb6:	69a2                	ld	s3,8(sp)
    2cb8:	6a02                	ld	s4,0(sp)
    2cba:	6145                	addi	sp,sp,48
    2cbc:	8082                	ret
    sbrk(4096 - (top % 4096));
    2cbe:	0347d513          	srli	a0,a5,0x34
    2cc2:	6785                	lui	a5,0x1
    2cc4:	40a7853b          	subw	a0,a5,a0
    2cc8:	00003097          	auipc	ra,0x3
    2ccc:	c08080e7          	jalr	-1016(ra) # 58d0 <sbrk>
    2cd0:	bfa9                	j	2c2a <sbrklast+0x20>
    exit(1);
    2cd2:	4505                	li	a0,1
    2cd4:	00003097          	auipc	ra,0x3
    2cd8:	b74080e7          	jalr	-1164(ra) # 5848 <exit>

0000000000002cdc <sbrk8000>:
{
    2cdc:	1141                	addi	sp,sp,-16
    2cde:	e406                	sd	ra,8(sp)
    2ce0:	e022                	sd	s0,0(sp)
    2ce2:	0800                	addi	s0,sp,16
  sbrk(0x80000004);
    2ce4:	80000537          	lui	a0,0x80000
    2ce8:	0511                	addi	a0,a0,4
    2cea:	00003097          	auipc	ra,0x3
    2cee:	be6080e7          	jalr	-1050(ra) # 58d0 <sbrk>
  volatile char *top = sbrk(0);
    2cf2:	4501                	li	a0,0
    2cf4:	00003097          	auipc	ra,0x3
    2cf8:	bdc080e7          	jalr	-1060(ra) # 58d0 <sbrk>
  *(top-1) = *(top-1) + 1;
    2cfc:	fff54783          	lbu	a5,-1(a0) # ffffffff7fffffff <__BSS_END__+0xffffffff7fff1267>
    2d00:	0785                	addi	a5,a5,1
    2d02:	0ff7f793          	andi	a5,a5,255
    2d06:	fef50fa3          	sb	a5,-1(a0)
}
    2d0a:	60a2                	ld	ra,8(sp)
    2d0c:	6402                	ld	s0,0(sp)
    2d0e:	0141                	addi	sp,sp,16
    2d10:	8082                	ret

0000000000002d12 <execout>:
// test the exec() code that cleans up if it runs out
// of memory. it's really a test that such a condition
// doesn't cause a panic.
void
execout(char *s)
{
    2d12:	715d                	addi	sp,sp,-80
    2d14:	e486                	sd	ra,72(sp)
    2d16:	e0a2                	sd	s0,64(sp)
    2d18:	fc26                	sd	s1,56(sp)
    2d1a:	f84a                	sd	s2,48(sp)
    2d1c:	f44e                	sd	s3,40(sp)
    2d1e:	f052                	sd	s4,32(sp)
    2d20:	0880                	addi	s0,sp,80
  for(int avail = 0; avail < 15; avail++){
    2d22:	4901                	li	s2,0
    2d24:	49bd                	li	s3,15
    int pid = fork();
    2d26:	00003097          	auipc	ra,0x3
    2d2a:	b1a080e7          	jalr	-1254(ra) # 5840 <fork>
    2d2e:	84aa                	mv	s1,a0
    if(pid < 0){
    2d30:	02054063          	bltz	a0,2d50 <execout+0x3e>
      printf("fork failed\n");
      exit(1);
    } else if(pid == 0){
    2d34:	c91d                	beqz	a0,2d6a <execout+0x58>
      close(1);
      char *args[] = { "echo", "x", 0 };
      exec("echo", args);
      exit(0);
    } else {
      wait((int*)0);
    2d36:	4501                	li	a0,0
    2d38:	00003097          	auipc	ra,0x3
    2d3c:	b18080e7          	jalr	-1256(ra) # 5850 <wait>
  for(int avail = 0; avail < 15; avail++){
    2d40:	2905                	addiw	s2,s2,1
    2d42:	ff3912e3          	bne	s2,s3,2d26 <execout+0x14>
    }
  }

  exit(0);
    2d46:	4501                	li	a0,0
    2d48:	00003097          	auipc	ra,0x3
    2d4c:	b00080e7          	jalr	-1280(ra) # 5848 <exit>
      printf("fork failed\n");
    2d50:	00004517          	auipc	a0,0x4
    2d54:	00850513          	addi	a0,a0,8 # 6d58 <malloc+0x10da>
    2d58:	00003097          	auipc	ra,0x3
    2d5c:	e68080e7          	jalr	-408(ra) # 5bc0 <printf>
      exit(1);
    2d60:	4505                	li	a0,1
    2d62:	00003097          	auipc	ra,0x3
    2d66:	ae6080e7          	jalr	-1306(ra) # 5848 <exit>
        if(a == 0xffffffffffffffffLL)
    2d6a:	59fd                	li	s3,-1
        *(char*)(a + 4096 - 1) = 1;
    2d6c:	4a05                	li	s4,1
        uint64 a = (uint64) sbrk(4096);
    2d6e:	6505                	lui	a0,0x1
    2d70:	00003097          	auipc	ra,0x3
    2d74:	b60080e7          	jalr	-1184(ra) # 58d0 <sbrk>
        if(a == 0xffffffffffffffffLL)
    2d78:	01350763          	beq	a0,s3,2d86 <execout+0x74>
        *(char*)(a + 4096 - 1) = 1;
    2d7c:	6785                	lui	a5,0x1
    2d7e:	953e                	add	a0,a0,a5
    2d80:	ff450fa3          	sb	s4,-1(a0) # fff <bigdir+0x9d>
      while(1){
    2d84:	b7ed                	j	2d6e <execout+0x5c>
      for(int i = 0; i < avail; i++)
    2d86:	01205a63          	blez	s2,2d9a <execout+0x88>
        sbrk(-4096);
    2d8a:	757d                	lui	a0,0xfffff
    2d8c:	00003097          	auipc	ra,0x3
    2d90:	b44080e7          	jalr	-1212(ra) # 58d0 <sbrk>
      for(int i = 0; i < avail; i++)
    2d94:	2485                	addiw	s1,s1,1
    2d96:	ff249ae3          	bne	s1,s2,2d8a <execout+0x78>
      close(1);
    2d9a:	4505                	li	a0,1
    2d9c:	00003097          	auipc	ra,0x3
    2da0:	ad4080e7          	jalr	-1324(ra) # 5870 <close>
      char *args[] = { "echo", "x", 0 };
    2da4:	00003517          	auipc	a0,0x3
    2da8:	35c50513          	addi	a0,a0,860 # 6100 <malloc+0x482>
    2dac:	faa43c23          	sd	a0,-72(s0)
    2db0:	00003797          	auipc	a5,0x3
    2db4:	3c078793          	addi	a5,a5,960 # 6170 <malloc+0x4f2>
    2db8:	fcf43023          	sd	a5,-64(s0)
    2dbc:	fc043423          	sd	zero,-56(s0)
      exec("echo", args);
    2dc0:	fb840593          	addi	a1,s0,-72
    2dc4:	00003097          	auipc	ra,0x3
    2dc8:	abc080e7          	jalr	-1348(ra) # 5880 <exec>
      exit(0);
    2dcc:	4501                	li	a0,0
    2dce:	00003097          	auipc	ra,0x3
    2dd2:	a7a080e7          	jalr	-1414(ra) # 5848 <exit>

0000000000002dd6 <fourteen>:
{
    2dd6:	1101                	addi	sp,sp,-32
    2dd8:	ec06                	sd	ra,24(sp)
    2dda:	e822                	sd	s0,16(sp)
    2ddc:	e426                	sd	s1,8(sp)
    2dde:	1000                	addi	s0,sp,32
    2de0:	84aa                	mv	s1,a0
  if(mkdir("12345678901234") != 0){
    2de2:	00004517          	auipc	a0,0x4
    2de6:	46650513          	addi	a0,a0,1126 # 7248 <malloc+0x15ca>
    2dea:	00003097          	auipc	ra,0x3
    2dee:	ac6080e7          	jalr	-1338(ra) # 58b0 <mkdir>
    2df2:	e165                	bnez	a0,2ed2 <fourteen+0xfc>
  if(mkdir("12345678901234/123456789012345") != 0){
    2df4:	00004517          	auipc	a0,0x4
    2df8:	2ac50513          	addi	a0,a0,684 # 70a0 <malloc+0x1422>
    2dfc:	00003097          	auipc	ra,0x3
    2e00:	ab4080e7          	jalr	-1356(ra) # 58b0 <mkdir>
    2e04:	e56d                	bnez	a0,2eee <fourteen+0x118>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2e06:	20000593          	li	a1,512
    2e0a:	00004517          	auipc	a0,0x4
    2e0e:	2ee50513          	addi	a0,a0,750 # 70f8 <malloc+0x147a>
    2e12:	00003097          	auipc	ra,0x3
    2e16:	a76080e7          	jalr	-1418(ra) # 5888 <open>
  if(fd < 0){
    2e1a:	0e054863          	bltz	a0,2f0a <fourteen+0x134>
  close(fd);
    2e1e:	00003097          	auipc	ra,0x3
    2e22:	a52080e7          	jalr	-1454(ra) # 5870 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2e26:	4581                	li	a1,0
    2e28:	00004517          	auipc	a0,0x4
    2e2c:	34850513          	addi	a0,a0,840 # 7170 <malloc+0x14f2>
    2e30:	00003097          	auipc	ra,0x3
    2e34:	a58080e7          	jalr	-1448(ra) # 5888 <open>
  if(fd < 0){
    2e38:	0e054763          	bltz	a0,2f26 <fourteen+0x150>
  close(fd);
    2e3c:	00003097          	auipc	ra,0x3
    2e40:	a34080e7          	jalr	-1484(ra) # 5870 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2e44:	00004517          	auipc	a0,0x4
    2e48:	39c50513          	addi	a0,a0,924 # 71e0 <malloc+0x1562>
    2e4c:	00003097          	auipc	ra,0x3
    2e50:	a64080e7          	jalr	-1436(ra) # 58b0 <mkdir>
    2e54:	c57d                	beqz	a0,2f42 <fourteen+0x16c>
  if(mkdir("123456789012345/12345678901234") == 0){
    2e56:	00004517          	auipc	a0,0x4
    2e5a:	3e250513          	addi	a0,a0,994 # 7238 <malloc+0x15ba>
    2e5e:	00003097          	auipc	ra,0x3
    2e62:	a52080e7          	jalr	-1454(ra) # 58b0 <mkdir>
    2e66:	cd65                	beqz	a0,2f5e <fourteen+0x188>
  unlink("123456789012345/12345678901234");
    2e68:	00004517          	auipc	a0,0x4
    2e6c:	3d050513          	addi	a0,a0,976 # 7238 <malloc+0x15ba>
    2e70:	00003097          	auipc	ra,0x3
    2e74:	a28080e7          	jalr	-1496(ra) # 5898 <unlink>
  unlink("12345678901234/12345678901234");
    2e78:	00004517          	auipc	a0,0x4
    2e7c:	36850513          	addi	a0,a0,872 # 71e0 <malloc+0x1562>
    2e80:	00003097          	auipc	ra,0x3
    2e84:	a18080e7          	jalr	-1512(ra) # 5898 <unlink>
  unlink("12345678901234/12345678901234/12345678901234");
    2e88:	00004517          	auipc	a0,0x4
    2e8c:	2e850513          	addi	a0,a0,744 # 7170 <malloc+0x14f2>
    2e90:	00003097          	auipc	ra,0x3
    2e94:	a08080e7          	jalr	-1528(ra) # 5898 <unlink>
  unlink("123456789012345/123456789012345/123456789012345");
    2e98:	00004517          	auipc	a0,0x4
    2e9c:	26050513          	addi	a0,a0,608 # 70f8 <malloc+0x147a>
    2ea0:	00003097          	auipc	ra,0x3
    2ea4:	9f8080e7          	jalr	-1544(ra) # 5898 <unlink>
  unlink("12345678901234/123456789012345");
    2ea8:	00004517          	auipc	a0,0x4
    2eac:	1f850513          	addi	a0,a0,504 # 70a0 <malloc+0x1422>
    2eb0:	00003097          	auipc	ra,0x3
    2eb4:	9e8080e7          	jalr	-1560(ra) # 5898 <unlink>
  unlink("12345678901234");
    2eb8:	00004517          	auipc	a0,0x4
    2ebc:	39050513          	addi	a0,a0,912 # 7248 <malloc+0x15ca>
    2ec0:	00003097          	auipc	ra,0x3
    2ec4:	9d8080e7          	jalr	-1576(ra) # 5898 <unlink>
}
    2ec8:	60e2                	ld	ra,24(sp)
    2eca:	6442                	ld	s0,16(sp)
    2ecc:	64a2                	ld	s1,8(sp)
    2ece:	6105                	addi	sp,sp,32
    2ed0:	8082                	ret
    printf("%s: mkdir 12345678901234 failed\n", s);
    2ed2:	85a6                	mv	a1,s1
    2ed4:	00004517          	auipc	a0,0x4
    2ed8:	1a450513          	addi	a0,a0,420 # 7078 <malloc+0x13fa>
    2edc:	00003097          	auipc	ra,0x3
    2ee0:	ce4080e7          	jalr	-796(ra) # 5bc0 <printf>
    exit(1);
    2ee4:	4505                	li	a0,1
    2ee6:	00003097          	auipc	ra,0x3
    2eea:	962080e7          	jalr	-1694(ra) # 5848 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 failed\n", s);
    2eee:	85a6                	mv	a1,s1
    2ef0:	00004517          	auipc	a0,0x4
    2ef4:	1d050513          	addi	a0,a0,464 # 70c0 <malloc+0x1442>
    2ef8:	00003097          	auipc	ra,0x3
    2efc:	cc8080e7          	jalr	-824(ra) # 5bc0 <printf>
    exit(1);
    2f00:	4505                	li	a0,1
    2f02:	00003097          	auipc	ra,0x3
    2f06:	946080e7          	jalr	-1722(ra) # 5848 <exit>
    printf("%s: create 123456789012345/123456789012345/123456789012345 failed\n", s);
    2f0a:	85a6                	mv	a1,s1
    2f0c:	00004517          	auipc	a0,0x4
    2f10:	21c50513          	addi	a0,a0,540 # 7128 <malloc+0x14aa>
    2f14:	00003097          	auipc	ra,0x3
    2f18:	cac080e7          	jalr	-852(ra) # 5bc0 <printf>
    exit(1);
    2f1c:	4505                	li	a0,1
    2f1e:	00003097          	auipc	ra,0x3
    2f22:	92a080e7          	jalr	-1750(ra) # 5848 <exit>
    printf("%s: open 12345678901234/12345678901234/12345678901234 failed\n", s);
    2f26:	85a6                	mv	a1,s1
    2f28:	00004517          	auipc	a0,0x4
    2f2c:	27850513          	addi	a0,a0,632 # 71a0 <malloc+0x1522>
    2f30:	00003097          	auipc	ra,0x3
    2f34:	c90080e7          	jalr	-880(ra) # 5bc0 <printf>
    exit(1);
    2f38:	4505                	li	a0,1
    2f3a:	00003097          	auipc	ra,0x3
    2f3e:	90e080e7          	jalr	-1778(ra) # 5848 <exit>
    printf("%s: mkdir 12345678901234/12345678901234 succeeded!\n", s);
    2f42:	85a6                	mv	a1,s1
    2f44:	00004517          	auipc	a0,0x4
    2f48:	2bc50513          	addi	a0,a0,700 # 7200 <malloc+0x1582>
    2f4c:	00003097          	auipc	ra,0x3
    2f50:	c74080e7          	jalr	-908(ra) # 5bc0 <printf>
    exit(1);
    2f54:	4505                	li	a0,1
    2f56:	00003097          	auipc	ra,0x3
    2f5a:	8f2080e7          	jalr	-1806(ra) # 5848 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 succeeded!\n", s);
    2f5e:	85a6                	mv	a1,s1
    2f60:	00004517          	auipc	a0,0x4
    2f64:	2f850513          	addi	a0,a0,760 # 7258 <malloc+0x15da>
    2f68:	00003097          	auipc	ra,0x3
    2f6c:	c58080e7          	jalr	-936(ra) # 5bc0 <printf>
    exit(1);
    2f70:	4505                	li	a0,1
    2f72:	00003097          	auipc	ra,0x3
    2f76:	8d6080e7          	jalr	-1834(ra) # 5848 <exit>

0000000000002f7a <iputtest>:
{
    2f7a:	1101                	addi	sp,sp,-32
    2f7c:	ec06                	sd	ra,24(sp)
    2f7e:	e822                	sd	s0,16(sp)
    2f80:	e426                	sd	s1,8(sp)
    2f82:	1000                	addi	s0,sp,32
    2f84:	84aa                	mv	s1,a0
  if(mkdir("iputdir") < 0){
    2f86:	00004517          	auipc	a0,0x4
    2f8a:	30a50513          	addi	a0,a0,778 # 7290 <malloc+0x1612>
    2f8e:	00003097          	auipc	ra,0x3
    2f92:	922080e7          	jalr	-1758(ra) # 58b0 <mkdir>
    2f96:	04054563          	bltz	a0,2fe0 <iputtest+0x66>
  if(chdir("iputdir") < 0){
    2f9a:	00004517          	auipc	a0,0x4
    2f9e:	2f650513          	addi	a0,a0,758 # 7290 <malloc+0x1612>
    2fa2:	00003097          	auipc	ra,0x3
    2fa6:	916080e7          	jalr	-1770(ra) # 58b8 <chdir>
    2faa:	04054963          	bltz	a0,2ffc <iputtest+0x82>
  if(unlink("../iputdir") < 0){
    2fae:	00004517          	auipc	a0,0x4
    2fb2:	32250513          	addi	a0,a0,802 # 72d0 <malloc+0x1652>
    2fb6:	00003097          	auipc	ra,0x3
    2fba:	8e2080e7          	jalr	-1822(ra) # 5898 <unlink>
    2fbe:	04054d63          	bltz	a0,3018 <iputtest+0x9e>
  if(chdir("/") < 0){
    2fc2:	00004517          	auipc	a0,0x4
    2fc6:	33e50513          	addi	a0,a0,830 # 7300 <malloc+0x1682>
    2fca:	00003097          	auipc	ra,0x3
    2fce:	8ee080e7          	jalr	-1810(ra) # 58b8 <chdir>
    2fd2:	06054163          	bltz	a0,3034 <iputtest+0xba>
}
    2fd6:	60e2                	ld	ra,24(sp)
    2fd8:	6442                	ld	s0,16(sp)
    2fda:	64a2                	ld	s1,8(sp)
    2fdc:	6105                	addi	sp,sp,32
    2fde:	8082                	ret
    printf("%s: mkdir failed\n", s);
    2fe0:	85a6                	mv	a1,s1
    2fe2:	00004517          	auipc	a0,0x4
    2fe6:	2b650513          	addi	a0,a0,694 # 7298 <malloc+0x161a>
    2fea:	00003097          	auipc	ra,0x3
    2fee:	bd6080e7          	jalr	-1066(ra) # 5bc0 <printf>
    exit(1);
    2ff2:	4505                	li	a0,1
    2ff4:	00003097          	auipc	ra,0x3
    2ff8:	854080e7          	jalr	-1964(ra) # 5848 <exit>
    printf("%s: chdir iputdir failed\n", s);
    2ffc:	85a6                	mv	a1,s1
    2ffe:	00004517          	auipc	a0,0x4
    3002:	2b250513          	addi	a0,a0,690 # 72b0 <malloc+0x1632>
    3006:	00003097          	auipc	ra,0x3
    300a:	bba080e7          	jalr	-1094(ra) # 5bc0 <printf>
    exit(1);
    300e:	4505                	li	a0,1
    3010:	00003097          	auipc	ra,0x3
    3014:	838080e7          	jalr	-1992(ra) # 5848 <exit>
    printf("%s: unlink ../iputdir failed\n", s);
    3018:	85a6                	mv	a1,s1
    301a:	00004517          	auipc	a0,0x4
    301e:	2c650513          	addi	a0,a0,710 # 72e0 <malloc+0x1662>
    3022:	00003097          	auipc	ra,0x3
    3026:	b9e080e7          	jalr	-1122(ra) # 5bc0 <printf>
    exit(1);
    302a:	4505                	li	a0,1
    302c:	00003097          	auipc	ra,0x3
    3030:	81c080e7          	jalr	-2020(ra) # 5848 <exit>
    printf("%s: chdir / failed\n", s);
    3034:	85a6                	mv	a1,s1
    3036:	00004517          	auipc	a0,0x4
    303a:	2d250513          	addi	a0,a0,722 # 7308 <malloc+0x168a>
    303e:	00003097          	auipc	ra,0x3
    3042:	b82080e7          	jalr	-1150(ra) # 5bc0 <printf>
    exit(1);
    3046:	4505                	li	a0,1
    3048:	00003097          	auipc	ra,0x3
    304c:	800080e7          	jalr	-2048(ra) # 5848 <exit>

0000000000003050 <exitiputtest>:
{
    3050:	7179                	addi	sp,sp,-48
    3052:	f406                	sd	ra,40(sp)
    3054:	f022                	sd	s0,32(sp)
    3056:	ec26                	sd	s1,24(sp)
    3058:	1800                	addi	s0,sp,48
    305a:	84aa                	mv	s1,a0
  pid = fork();
    305c:	00002097          	auipc	ra,0x2
    3060:	7e4080e7          	jalr	2020(ra) # 5840 <fork>
  if(pid < 0){
    3064:	04054663          	bltz	a0,30b0 <exitiputtest+0x60>
  if(pid == 0){
    3068:	ed45                	bnez	a0,3120 <exitiputtest+0xd0>
    if(mkdir("iputdir") < 0){
    306a:	00004517          	auipc	a0,0x4
    306e:	22650513          	addi	a0,a0,550 # 7290 <malloc+0x1612>
    3072:	00003097          	auipc	ra,0x3
    3076:	83e080e7          	jalr	-1986(ra) # 58b0 <mkdir>
    307a:	04054963          	bltz	a0,30cc <exitiputtest+0x7c>
    if(chdir("iputdir") < 0){
    307e:	00004517          	auipc	a0,0x4
    3082:	21250513          	addi	a0,a0,530 # 7290 <malloc+0x1612>
    3086:	00003097          	auipc	ra,0x3
    308a:	832080e7          	jalr	-1998(ra) # 58b8 <chdir>
    308e:	04054d63          	bltz	a0,30e8 <exitiputtest+0x98>
    if(unlink("../iputdir") < 0){
    3092:	00004517          	auipc	a0,0x4
    3096:	23e50513          	addi	a0,a0,574 # 72d0 <malloc+0x1652>
    309a:	00002097          	auipc	ra,0x2
    309e:	7fe080e7          	jalr	2046(ra) # 5898 <unlink>
    30a2:	06054163          	bltz	a0,3104 <exitiputtest+0xb4>
    exit(0);
    30a6:	4501                	li	a0,0
    30a8:	00002097          	auipc	ra,0x2
    30ac:	7a0080e7          	jalr	1952(ra) # 5848 <exit>
    printf("%s: fork failed\n", s);
    30b0:	85a6                	mv	a1,s1
    30b2:	00004517          	auipc	a0,0x4
    30b6:	88650513          	addi	a0,a0,-1914 # 6938 <malloc+0xcba>
    30ba:	00003097          	auipc	ra,0x3
    30be:	b06080e7          	jalr	-1274(ra) # 5bc0 <printf>
    exit(1);
    30c2:	4505                	li	a0,1
    30c4:	00002097          	auipc	ra,0x2
    30c8:	784080e7          	jalr	1924(ra) # 5848 <exit>
      printf("%s: mkdir failed\n", s);
    30cc:	85a6                	mv	a1,s1
    30ce:	00004517          	auipc	a0,0x4
    30d2:	1ca50513          	addi	a0,a0,458 # 7298 <malloc+0x161a>
    30d6:	00003097          	auipc	ra,0x3
    30da:	aea080e7          	jalr	-1302(ra) # 5bc0 <printf>
      exit(1);
    30de:	4505                	li	a0,1
    30e0:	00002097          	auipc	ra,0x2
    30e4:	768080e7          	jalr	1896(ra) # 5848 <exit>
      printf("%s: child chdir failed\n", s);
    30e8:	85a6                	mv	a1,s1
    30ea:	00004517          	auipc	a0,0x4
    30ee:	23650513          	addi	a0,a0,566 # 7320 <malloc+0x16a2>
    30f2:	00003097          	auipc	ra,0x3
    30f6:	ace080e7          	jalr	-1330(ra) # 5bc0 <printf>
      exit(1);
    30fa:	4505                	li	a0,1
    30fc:	00002097          	auipc	ra,0x2
    3100:	74c080e7          	jalr	1868(ra) # 5848 <exit>
      printf("%s: unlink ../iputdir failed\n", s);
    3104:	85a6                	mv	a1,s1
    3106:	00004517          	auipc	a0,0x4
    310a:	1da50513          	addi	a0,a0,474 # 72e0 <malloc+0x1662>
    310e:	00003097          	auipc	ra,0x3
    3112:	ab2080e7          	jalr	-1358(ra) # 5bc0 <printf>
      exit(1);
    3116:	4505                	li	a0,1
    3118:	00002097          	auipc	ra,0x2
    311c:	730080e7          	jalr	1840(ra) # 5848 <exit>
  wait(&xstatus);
    3120:	fdc40513          	addi	a0,s0,-36
    3124:	00002097          	auipc	ra,0x2
    3128:	72c080e7          	jalr	1836(ra) # 5850 <wait>
  exit(xstatus);
    312c:	fdc42503          	lw	a0,-36(s0)
    3130:	00002097          	auipc	ra,0x2
    3134:	718080e7          	jalr	1816(ra) # 5848 <exit>

0000000000003138 <dirtest>:
{
    3138:	1101                	addi	sp,sp,-32
    313a:	ec06                	sd	ra,24(sp)
    313c:	e822                	sd	s0,16(sp)
    313e:	e426                	sd	s1,8(sp)
    3140:	1000                	addi	s0,sp,32
    3142:	84aa                	mv	s1,a0
  if(mkdir("dir0") < 0){
    3144:	00004517          	auipc	a0,0x4
    3148:	1f450513          	addi	a0,a0,500 # 7338 <malloc+0x16ba>
    314c:	00002097          	auipc	ra,0x2
    3150:	764080e7          	jalr	1892(ra) # 58b0 <mkdir>
    3154:	04054563          	bltz	a0,319e <dirtest+0x66>
  if(chdir("dir0") < 0){
    3158:	00004517          	auipc	a0,0x4
    315c:	1e050513          	addi	a0,a0,480 # 7338 <malloc+0x16ba>
    3160:	00002097          	auipc	ra,0x2
    3164:	758080e7          	jalr	1880(ra) # 58b8 <chdir>
    3168:	04054963          	bltz	a0,31ba <dirtest+0x82>
  if(chdir("..") < 0){
    316c:	00004517          	auipc	a0,0x4
    3170:	1ec50513          	addi	a0,a0,492 # 7358 <malloc+0x16da>
    3174:	00002097          	auipc	ra,0x2
    3178:	744080e7          	jalr	1860(ra) # 58b8 <chdir>
    317c:	04054d63          	bltz	a0,31d6 <dirtest+0x9e>
  if(unlink("dir0") < 0){
    3180:	00004517          	auipc	a0,0x4
    3184:	1b850513          	addi	a0,a0,440 # 7338 <malloc+0x16ba>
    3188:	00002097          	auipc	ra,0x2
    318c:	710080e7          	jalr	1808(ra) # 5898 <unlink>
    3190:	06054163          	bltz	a0,31f2 <dirtest+0xba>
}
    3194:	60e2                	ld	ra,24(sp)
    3196:	6442                	ld	s0,16(sp)
    3198:	64a2                	ld	s1,8(sp)
    319a:	6105                	addi	sp,sp,32
    319c:	8082                	ret
    printf("%s: mkdir failed\n", s);
    319e:	85a6                	mv	a1,s1
    31a0:	00004517          	auipc	a0,0x4
    31a4:	0f850513          	addi	a0,a0,248 # 7298 <malloc+0x161a>
    31a8:	00003097          	auipc	ra,0x3
    31ac:	a18080e7          	jalr	-1512(ra) # 5bc0 <printf>
    exit(1);
    31b0:	4505                	li	a0,1
    31b2:	00002097          	auipc	ra,0x2
    31b6:	696080e7          	jalr	1686(ra) # 5848 <exit>
    printf("%s: chdir dir0 failed\n", s);
    31ba:	85a6                	mv	a1,s1
    31bc:	00004517          	auipc	a0,0x4
    31c0:	18450513          	addi	a0,a0,388 # 7340 <malloc+0x16c2>
    31c4:	00003097          	auipc	ra,0x3
    31c8:	9fc080e7          	jalr	-1540(ra) # 5bc0 <printf>
    exit(1);
    31cc:	4505                	li	a0,1
    31ce:	00002097          	auipc	ra,0x2
    31d2:	67a080e7          	jalr	1658(ra) # 5848 <exit>
    printf("%s: chdir .. failed\n", s);
    31d6:	85a6                	mv	a1,s1
    31d8:	00004517          	auipc	a0,0x4
    31dc:	18850513          	addi	a0,a0,392 # 7360 <malloc+0x16e2>
    31e0:	00003097          	auipc	ra,0x3
    31e4:	9e0080e7          	jalr	-1568(ra) # 5bc0 <printf>
    exit(1);
    31e8:	4505                	li	a0,1
    31ea:	00002097          	auipc	ra,0x2
    31ee:	65e080e7          	jalr	1630(ra) # 5848 <exit>
    printf("%s: unlink dir0 failed\n", s);
    31f2:	85a6                	mv	a1,s1
    31f4:	00004517          	auipc	a0,0x4
    31f8:	18450513          	addi	a0,a0,388 # 7378 <malloc+0x16fa>
    31fc:	00003097          	auipc	ra,0x3
    3200:	9c4080e7          	jalr	-1596(ra) # 5bc0 <printf>
    exit(1);
    3204:	4505                	li	a0,1
    3206:	00002097          	auipc	ra,0x2
    320a:	642080e7          	jalr	1602(ra) # 5848 <exit>

000000000000320e <subdir>:
{
    320e:	1101                	addi	sp,sp,-32
    3210:	ec06                	sd	ra,24(sp)
    3212:	e822                	sd	s0,16(sp)
    3214:	e426                	sd	s1,8(sp)
    3216:	e04a                	sd	s2,0(sp)
    3218:	1000                	addi	s0,sp,32
    321a:	892a                	mv	s2,a0
  unlink("ff");
    321c:	00004517          	auipc	a0,0x4
    3220:	2a450513          	addi	a0,a0,676 # 74c0 <malloc+0x1842>
    3224:	00002097          	auipc	ra,0x2
    3228:	674080e7          	jalr	1652(ra) # 5898 <unlink>
  if(mkdir("dd") != 0){
    322c:	00004517          	auipc	a0,0x4
    3230:	16450513          	addi	a0,a0,356 # 7390 <malloc+0x1712>
    3234:	00002097          	auipc	ra,0x2
    3238:	67c080e7          	jalr	1660(ra) # 58b0 <mkdir>
    323c:	38051663          	bnez	a0,35c8 <subdir+0x3ba>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    3240:	20200593          	li	a1,514
    3244:	00004517          	auipc	a0,0x4
    3248:	16c50513          	addi	a0,a0,364 # 73b0 <malloc+0x1732>
    324c:	00002097          	auipc	ra,0x2
    3250:	63c080e7          	jalr	1596(ra) # 5888 <open>
    3254:	84aa                	mv	s1,a0
  if(fd < 0){
    3256:	38054763          	bltz	a0,35e4 <subdir+0x3d6>
  write(fd, "ff", 2);
    325a:	4609                	li	a2,2
    325c:	00004597          	auipc	a1,0x4
    3260:	26458593          	addi	a1,a1,612 # 74c0 <malloc+0x1842>
    3264:	00002097          	auipc	ra,0x2
    3268:	604080e7          	jalr	1540(ra) # 5868 <write>
  close(fd);
    326c:	8526                	mv	a0,s1
    326e:	00002097          	auipc	ra,0x2
    3272:	602080e7          	jalr	1538(ra) # 5870 <close>
  if(unlink("dd") >= 0){
    3276:	00004517          	auipc	a0,0x4
    327a:	11a50513          	addi	a0,a0,282 # 7390 <malloc+0x1712>
    327e:	00002097          	auipc	ra,0x2
    3282:	61a080e7          	jalr	1562(ra) # 5898 <unlink>
    3286:	36055d63          	bgez	a0,3600 <subdir+0x3f2>
  if(mkdir("/dd/dd") != 0){
    328a:	00004517          	auipc	a0,0x4
    328e:	17e50513          	addi	a0,a0,382 # 7408 <malloc+0x178a>
    3292:	00002097          	auipc	ra,0x2
    3296:	61e080e7          	jalr	1566(ra) # 58b0 <mkdir>
    329a:	38051163          	bnez	a0,361c <subdir+0x40e>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    329e:	20200593          	li	a1,514
    32a2:	00004517          	auipc	a0,0x4
    32a6:	18e50513          	addi	a0,a0,398 # 7430 <malloc+0x17b2>
    32aa:	00002097          	auipc	ra,0x2
    32ae:	5de080e7          	jalr	1502(ra) # 5888 <open>
    32b2:	84aa                	mv	s1,a0
  if(fd < 0){
    32b4:	38054263          	bltz	a0,3638 <subdir+0x42a>
  write(fd, "FF", 2);
    32b8:	4609                	li	a2,2
    32ba:	00004597          	auipc	a1,0x4
    32be:	1a658593          	addi	a1,a1,422 # 7460 <malloc+0x17e2>
    32c2:	00002097          	auipc	ra,0x2
    32c6:	5a6080e7          	jalr	1446(ra) # 5868 <write>
  close(fd);
    32ca:	8526                	mv	a0,s1
    32cc:	00002097          	auipc	ra,0x2
    32d0:	5a4080e7          	jalr	1444(ra) # 5870 <close>
  fd = open("dd/dd/../ff", 0);
    32d4:	4581                	li	a1,0
    32d6:	00004517          	auipc	a0,0x4
    32da:	19250513          	addi	a0,a0,402 # 7468 <malloc+0x17ea>
    32de:	00002097          	auipc	ra,0x2
    32e2:	5aa080e7          	jalr	1450(ra) # 5888 <open>
    32e6:	84aa                	mv	s1,a0
  if(fd < 0){
    32e8:	36054663          	bltz	a0,3654 <subdir+0x446>
  cc = read(fd, buf, sizeof(buf));
    32ec:	660d                	lui	a2,0x3
    32ee:	00009597          	auipc	a1,0x9
    32f2:	a9a58593          	addi	a1,a1,-1382 # bd88 <buf>
    32f6:	00002097          	auipc	ra,0x2
    32fa:	56a080e7          	jalr	1386(ra) # 5860 <read>
  if(cc != 2 || buf[0] != 'f'){
    32fe:	4789                	li	a5,2
    3300:	36f51863          	bne	a0,a5,3670 <subdir+0x462>
    3304:	00009717          	auipc	a4,0x9
    3308:	a8474703          	lbu	a4,-1404(a4) # bd88 <buf>
    330c:	06600793          	li	a5,102
    3310:	36f71063          	bne	a4,a5,3670 <subdir+0x462>
  close(fd);
    3314:	8526                	mv	a0,s1
    3316:	00002097          	auipc	ra,0x2
    331a:	55a080e7          	jalr	1370(ra) # 5870 <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    331e:	00004597          	auipc	a1,0x4
    3322:	19a58593          	addi	a1,a1,410 # 74b8 <malloc+0x183a>
    3326:	00004517          	auipc	a0,0x4
    332a:	10a50513          	addi	a0,a0,266 # 7430 <malloc+0x17b2>
    332e:	00002097          	auipc	ra,0x2
    3332:	57a080e7          	jalr	1402(ra) # 58a8 <link>
    3336:	34051b63          	bnez	a0,368c <subdir+0x47e>
  if(unlink("dd/dd/ff") != 0){
    333a:	00004517          	auipc	a0,0x4
    333e:	0f650513          	addi	a0,a0,246 # 7430 <malloc+0x17b2>
    3342:	00002097          	auipc	ra,0x2
    3346:	556080e7          	jalr	1366(ra) # 5898 <unlink>
    334a:	34051f63          	bnez	a0,36a8 <subdir+0x49a>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    334e:	4581                	li	a1,0
    3350:	00004517          	auipc	a0,0x4
    3354:	0e050513          	addi	a0,a0,224 # 7430 <malloc+0x17b2>
    3358:	00002097          	auipc	ra,0x2
    335c:	530080e7          	jalr	1328(ra) # 5888 <open>
    3360:	36055263          	bgez	a0,36c4 <subdir+0x4b6>
  if(chdir("dd") != 0){
    3364:	00004517          	auipc	a0,0x4
    3368:	02c50513          	addi	a0,a0,44 # 7390 <malloc+0x1712>
    336c:	00002097          	auipc	ra,0x2
    3370:	54c080e7          	jalr	1356(ra) # 58b8 <chdir>
    3374:	36051663          	bnez	a0,36e0 <subdir+0x4d2>
  if(chdir("dd/../../dd") != 0){
    3378:	00004517          	auipc	a0,0x4
    337c:	1d850513          	addi	a0,a0,472 # 7550 <malloc+0x18d2>
    3380:	00002097          	auipc	ra,0x2
    3384:	538080e7          	jalr	1336(ra) # 58b8 <chdir>
    3388:	36051a63          	bnez	a0,36fc <subdir+0x4ee>
  if(chdir("dd/../../../dd") != 0){
    338c:	00004517          	auipc	a0,0x4
    3390:	1f450513          	addi	a0,a0,500 # 7580 <malloc+0x1902>
    3394:	00002097          	auipc	ra,0x2
    3398:	524080e7          	jalr	1316(ra) # 58b8 <chdir>
    339c:	36051e63          	bnez	a0,3718 <subdir+0x50a>
  if(chdir("./..") != 0){
    33a0:	00004517          	auipc	a0,0x4
    33a4:	21050513          	addi	a0,a0,528 # 75b0 <malloc+0x1932>
    33a8:	00002097          	auipc	ra,0x2
    33ac:	510080e7          	jalr	1296(ra) # 58b8 <chdir>
    33b0:	38051263          	bnez	a0,3734 <subdir+0x526>
  fd = open("dd/dd/ffff", 0);
    33b4:	4581                	li	a1,0
    33b6:	00004517          	auipc	a0,0x4
    33ba:	10250513          	addi	a0,a0,258 # 74b8 <malloc+0x183a>
    33be:	00002097          	auipc	ra,0x2
    33c2:	4ca080e7          	jalr	1226(ra) # 5888 <open>
    33c6:	84aa                	mv	s1,a0
  if(fd < 0){
    33c8:	38054463          	bltz	a0,3750 <subdir+0x542>
  if(read(fd, buf, sizeof(buf)) != 2){
    33cc:	660d                	lui	a2,0x3
    33ce:	00009597          	auipc	a1,0x9
    33d2:	9ba58593          	addi	a1,a1,-1606 # bd88 <buf>
    33d6:	00002097          	auipc	ra,0x2
    33da:	48a080e7          	jalr	1162(ra) # 5860 <read>
    33de:	4789                	li	a5,2
    33e0:	38f51663          	bne	a0,a5,376c <subdir+0x55e>
  close(fd);
    33e4:	8526                	mv	a0,s1
    33e6:	00002097          	auipc	ra,0x2
    33ea:	48a080e7          	jalr	1162(ra) # 5870 <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    33ee:	4581                	li	a1,0
    33f0:	00004517          	auipc	a0,0x4
    33f4:	04050513          	addi	a0,a0,64 # 7430 <malloc+0x17b2>
    33f8:	00002097          	auipc	ra,0x2
    33fc:	490080e7          	jalr	1168(ra) # 5888 <open>
    3400:	38055463          	bgez	a0,3788 <subdir+0x57a>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    3404:	20200593          	li	a1,514
    3408:	00004517          	auipc	a0,0x4
    340c:	23850513          	addi	a0,a0,568 # 7640 <malloc+0x19c2>
    3410:	00002097          	auipc	ra,0x2
    3414:	478080e7          	jalr	1144(ra) # 5888 <open>
    3418:	38055663          	bgez	a0,37a4 <subdir+0x596>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    341c:	20200593          	li	a1,514
    3420:	00004517          	auipc	a0,0x4
    3424:	25050513          	addi	a0,a0,592 # 7670 <malloc+0x19f2>
    3428:	00002097          	auipc	ra,0x2
    342c:	460080e7          	jalr	1120(ra) # 5888 <open>
    3430:	38055863          	bgez	a0,37c0 <subdir+0x5b2>
  if(open("dd", O_CREATE) >= 0){
    3434:	20000593          	li	a1,512
    3438:	00004517          	auipc	a0,0x4
    343c:	f5850513          	addi	a0,a0,-168 # 7390 <malloc+0x1712>
    3440:	00002097          	auipc	ra,0x2
    3444:	448080e7          	jalr	1096(ra) # 5888 <open>
    3448:	38055a63          	bgez	a0,37dc <subdir+0x5ce>
  if(open("dd", O_RDWR) >= 0){
    344c:	4589                	li	a1,2
    344e:	00004517          	auipc	a0,0x4
    3452:	f4250513          	addi	a0,a0,-190 # 7390 <malloc+0x1712>
    3456:	00002097          	auipc	ra,0x2
    345a:	432080e7          	jalr	1074(ra) # 5888 <open>
    345e:	38055d63          	bgez	a0,37f8 <subdir+0x5ea>
  if(open("dd", O_WRONLY) >= 0){
    3462:	4585                	li	a1,1
    3464:	00004517          	auipc	a0,0x4
    3468:	f2c50513          	addi	a0,a0,-212 # 7390 <malloc+0x1712>
    346c:	00002097          	auipc	ra,0x2
    3470:	41c080e7          	jalr	1052(ra) # 5888 <open>
    3474:	3a055063          	bgez	a0,3814 <subdir+0x606>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    3478:	00004597          	auipc	a1,0x4
    347c:	28858593          	addi	a1,a1,648 # 7700 <malloc+0x1a82>
    3480:	00004517          	auipc	a0,0x4
    3484:	1c050513          	addi	a0,a0,448 # 7640 <malloc+0x19c2>
    3488:	00002097          	auipc	ra,0x2
    348c:	420080e7          	jalr	1056(ra) # 58a8 <link>
    3490:	3a050063          	beqz	a0,3830 <subdir+0x622>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    3494:	00004597          	auipc	a1,0x4
    3498:	26c58593          	addi	a1,a1,620 # 7700 <malloc+0x1a82>
    349c:	00004517          	auipc	a0,0x4
    34a0:	1d450513          	addi	a0,a0,468 # 7670 <malloc+0x19f2>
    34a4:	00002097          	auipc	ra,0x2
    34a8:	404080e7          	jalr	1028(ra) # 58a8 <link>
    34ac:	3a050063          	beqz	a0,384c <subdir+0x63e>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    34b0:	00004597          	auipc	a1,0x4
    34b4:	00858593          	addi	a1,a1,8 # 74b8 <malloc+0x183a>
    34b8:	00004517          	auipc	a0,0x4
    34bc:	ef850513          	addi	a0,a0,-264 # 73b0 <malloc+0x1732>
    34c0:	00002097          	auipc	ra,0x2
    34c4:	3e8080e7          	jalr	1000(ra) # 58a8 <link>
    34c8:	3a050063          	beqz	a0,3868 <subdir+0x65a>
  if(mkdir("dd/ff/ff") == 0){
    34cc:	00004517          	auipc	a0,0x4
    34d0:	17450513          	addi	a0,a0,372 # 7640 <malloc+0x19c2>
    34d4:	00002097          	auipc	ra,0x2
    34d8:	3dc080e7          	jalr	988(ra) # 58b0 <mkdir>
    34dc:	3a050463          	beqz	a0,3884 <subdir+0x676>
  if(mkdir("dd/xx/ff") == 0){
    34e0:	00004517          	auipc	a0,0x4
    34e4:	19050513          	addi	a0,a0,400 # 7670 <malloc+0x19f2>
    34e8:	00002097          	auipc	ra,0x2
    34ec:	3c8080e7          	jalr	968(ra) # 58b0 <mkdir>
    34f0:	3a050863          	beqz	a0,38a0 <subdir+0x692>
  if(mkdir("dd/dd/ffff") == 0){
    34f4:	00004517          	auipc	a0,0x4
    34f8:	fc450513          	addi	a0,a0,-60 # 74b8 <malloc+0x183a>
    34fc:	00002097          	auipc	ra,0x2
    3500:	3b4080e7          	jalr	948(ra) # 58b0 <mkdir>
    3504:	3a050c63          	beqz	a0,38bc <subdir+0x6ae>
  if(unlink("dd/xx/ff") == 0){
    3508:	00004517          	auipc	a0,0x4
    350c:	16850513          	addi	a0,a0,360 # 7670 <malloc+0x19f2>
    3510:	00002097          	auipc	ra,0x2
    3514:	388080e7          	jalr	904(ra) # 5898 <unlink>
    3518:	3c050063          	beqz	a0,38d8 <subdir+0x6ca>
  if(unlink("dd/ff/ff") == 0){
    351c:	00004517          	auipc	a0,0x4
    3520:	12450513          	addi	a0,a0,292 # 7640 <malloc+0x19c2>
    3524:	00002097          	auipc	ra,0x2
    3528:	374080e7          	jalr	884(ra) # 5898 <unlink>
    352c:	3c050463          	beqz	a0,38f4 <subdir+0x6e6>
  if(chdir("dd/ff") == 0){
    3530:	00004517          	auipc	a0,0x4
    3534:	e8050513          	addi	a0,a0,-384 # 73b0 <malloc+0x1732>
    3538:	00002097          	auipc	ra,0x2
    353c:	380080e7          	jalr	896(ra) # 58b8 <chdir>
    3540:	3c050863          	beqz	a0,3910 <subdir+0x702>
  if(chdir("dd/xx") == 0){
    3544:	00004517          	auipc	a0,0x4
    3548:	30c50513          	addi	a0,a0,780 # 7850 <malloc+0x1bd2>
    354c:	00002097          	auipc	ra,0x2
    3550:	36c080e7          	jalr	876(ra) # 58b8 <chdir>
    3554:	3c050c63          	beqz	a0,392c <subdir+0x71e>
  if(unlink("dd/dd/ffff") != 0){
    3558:	00004517          	auipc	a0,0x4
    355c:	f6050513          	addi	a0,a0,-160 # 74b8 <malloc+0x183a>
    3560:	00002097          	auipc	ra,0x2
    3564:	338080e7          	jalr	824(ra) # 5898 <unlink>
    3568:	3e051063          	bnez	a0,3948 <subdir+0x73a>
  if(unlink("dd/ff") != 0){
    356c:	00004517          	auipc	a0,0x4
    3570:	e4450513          	addi	a0,a0,-444 # 73b0 <malloc+0x1732>
    3574:	00002097          	auipc	ra,0x2
    3578:	324080e7          	jalr	804(ra) # 5898 <unlink>
    357c:	3e051463          	bnez	a0,3964 <subdir+0x756>
  if(unlink("dd") == 0){
    3580:	00004517          	auipc	a0,0x4
    3584:	e1050513          	addi	a0,a0,-496 # 7390 <malloc+0x1712>
    3588:	00002097          	auipc	ra,0x2
    358c:	310080e7          	jalr	784(ra) # 5898 <unlink>
    3590:	3e050863          	beqz	a0,3980 <subdir+0x772>
  if(unlink("dd/dd") < 0){
    3594:	00004517          	auipc	a0,0x4
    3598:	32c50513          	addi	a0,a0,812 # 78c0 <malloc+0x1c42>
    359c:	00002097          	auipc	ra,0x2
    35a0:	2fc080e7          	jalr	764(ra) # 5898 <unlink>
    35a4:	3e054c63          	bltz	a0,399c <subdir+0x78e>
  if(unlink("dd") < 0){
    35a8:	00004517          	auipc	a0,0x4
    35ac:	de850513          	addi	a0,a0,-536 # 7390 <malloc+0x1712>
    35b0:	00002097          	auipc	ra,0x2
    35b4:	2e8080e7          	jalr	744(ra) # 5898 <unlink>
    35b8:	40054063          	bltz	a0,39b8 <subdir+0x7aa>
}
    35bc:	60e2                	ld	ra,24(sp)
    35be:	6442                	ld	s0,16(sp)
    35c0:	64a2                	ld	s1,8(sp)
    35c2:	6902                	ld	s2,0(sp)
    35c4:	6105                	addi	sp,sp,32
    35c6:	8082                	ret
    printf("%s: mkdir dd failed\n", s);
    35c8:	85ca                	mv	a1,s2
    35ca:	00004517          	auipc	a0,0x4
    35ce:	dce50513          	addi	a0,a0,-562 # 7398 <malloc+0x171a>
    35d2:	00002097          	auipc	ra,0x2
    35d6:	5ee080e7          	jalr	1518(ra) # 5bc0 <printf>
    exit(1);
    35da:	4505                	li	a0,1
    35dc:	00002097          	auipc	ra,0x2
    35e0:	26c080e7          	jalr	620(ra) # 5848 <exit>
    printf("%s: create dd/ff failed\n", s);
    35e4:	85ca                	mv	a1,s2
    35e6:	00004517          	auipc	a0,0x4
    35ea:	dd250513          	addi	a0,a0,-558 # 73b8 <malloc+0x173a>
    35ee:	00002097          	auipc	ra,0x2
    35f2:	5d2080e7          	jalr	1490(ra) # 5bc0 <printf>
    exit(1);
    35f6:	4505                	li	a0,1
    35f8:	00002097          	auipc	ra,0x2
    35fc:	250080e7          	jalr	592(ra) # 5848 <exit>
    printf("%s: unlink dd (non-empty dir) succeeded!\n", s);
    3600:	85ca                	mv	a1,s2
    3602:	00004517          	auipc	a0,0x4
    3606:	dd650513          	addi	a0,a0,-554 # 73d8 <malloc+0x175a>
    360a:	00002097          	auipc	ra,0x2
    360e:	5b6080e7          	jalr	1462(ra) # 5bc0 <printf>
    exit(1);
    3612:	4505                	li	a0,1
    3614:	00002097          	auipc	ra,0x2
    3618:	234080e7          	jalr	564(ra) # 5848 <exit>
    printf("subdir mkdir dd/dd failed\n", s);
    361c:	85ca                	mv	a1,s2
    361e:	00004517          	auipc	a0,0x4
    3622:	df250513          	addi	a0,a0,-526 # 7410 <malloc+0x1792>
    3626:	00002097          	auipc	ra,0x2
    362a:	59a080e7          	jalr	1434(ra) # 5bc0 <printf>
    exit(1);
    362e:	4505                	li	a0,1
    3630:	00002097          	auipc	ra,0x2
    3634:	218080e7          	jalr	536(ra) # 5848 <exit>
    printf("%s: create dd/dd/ff failed\n", s);
    3638:	85ca                	mv	a1,s2
    363a:	00004517          	auipc	a0,0x4
    363e:	e0650513          	addi	a0,a0,-506 # 7440 <malloc+0x17c2>
    3642:	00002097          	auipc	ra,0x2
    3646:	57e080e7          	jalr	1406(ra) # 5bc0 <printf>
    exit(1);
    364a:	4505                	li	a0,1
    364c:	00002097          	auipc	ra,0x2
    3650:	1fc080e7          	jalr	508(ra) # 5848 <exit>
    printf("%s: open dd/dd/../ff failed\n", s);
    3654:	85ca                	mv	a1,s2
    3656:	00004517          	auipc	a0,0x4
    365a:	e2250513          	addi	a0,a0,-478 # 7478 <malloc+0x17fa>
    365e:	00002097          	auipc	ra,0x2
    3662:	562080e7          	jalr	1378(ra) # 5bc0 <printf>
    exit(1);
    3666:	4505                	li	a0,1
    3668:	00002097          	auipc	ra,0x2
    366c:	1e0080e7          	jalr	480(ra) # 5848 <exit>
    printf("%s: dd/dd/../ff wrong content\n", s);
    3670:	85ca                	mv	a1,s2
    3672:	00004517          	auipc	a0,0x4
    3676:	e2650513          	addi	a0,a0,-474 # 7498 <malloc+0x181a>
    367a:	00002097          	auipc	ra,0x2
    367e:	546080e7          	jalr	1350(ra) # 5bc0 <printf>
    exit(1);
    3682:	4505                	li	a0,1
    3684:	00002097          	auipc	ra,0x2
    3688:	1c4080e7          	jalr	452(ra) # 5848 <exit>
    printf("link dd/dd/ff dd/dd/ffff failed\n", s);
    368c:	85ca                	mv	a1,s2
    368e:	00004517          	auipc	a0,0x4
    3692:	e3a50513          	addi	a0,a0,-454 # 74c8 <malloc+0x184a>
    3696:	00002097          	auipc	ra,0x2
    369a:	52a080e7          	jalr	1322(ra) # 5bc0 <printf>
    exit(1);
    369e:	4505                	li	a0,1
    36a0:	00002097          	auipc	ra,0x2
    36a4:	1a8080e7          	jalr	424(ra) # 5848 <exit>
    printf("%s: unlink dd/dd/ff failed\n", s);
    36a8:	85ca                	mv	a1,s2
    36aa:	00004517          	auipc	a0,0x4
    36ae:	e4650513          	addi	a0,a0,-442 # 74f0 <malloc+0x1872>
    36b2:	00002097          	auipc	ra,0x2
    36b6:	50e080e7          	jalr	1294(ra) # 5bc0 <printf>
    exit(1);
    36ba:	4505                	li	a0,1
    36bc:	00002097          	auipc	ra,0x2
    36c0:	18c080e7          	jalr	396(ra) # 5848 <exit>
    printf("%s: open (unlinked) dd/dd/ff succeeded\n", s);
    36c4:	85ca                	mv	a1,s2
    36c6:	00004517          	auipc	a0,0x4
    36ca:	e4a50513          	addi	a0,a0,-438 # 7510 <malloc+0x1892>
    36ce:	00002097          	auipc	ra,0x2
    36d2:	4f2080e7          	jalr	1266(ra) # 5bc0 <printf>
    exit(1);
    36d6:	4505                	li	a0,1
    36d8:	00002097          	auipc	ra,0x2
    36dc:	170080e7          	jalr	368(ra) # 5848 <exit>
    printf("%s: chdir dd failed\n", s);
    36e0:	85ca                	mv	a1,s2
    36e2:	00004517          	auipc	a0,0x4
    36e6:	e5650513          	addi	a0,a0,-426 # 7538 <malloc+0x18ba>
    36ea:	00002097          	auipc	ra,0x2
    36ee:	4d6080e7          	jalr	1238(ra) # 5bc0 <printf>
    exit(1);
    36f2:	4505                	li	a0,1
    36f4:	00002097          	auipc	ra,0x2
    36f8:	154080e7          	jalr	340(ra) # 5848 <exit>
    printf("%s: chdir dd/../../dd failed\n", s);
    36fc:	85ca                	mv	a1,s2
    36fe:	00004517          	auipc	a0,0x4
    3702:	e6250513          	addi	a0,a0,-414 # 7560 <malloc+0x18e2>
    3706:	00002097          	auipc	ra,0x2
    370a:	4ba080e7          	jalr	1210(ra) # 5bc0 <printf>
    exit(1);
    370e:	4505                	li	a0,1
    3710:	00002097          	auipc	ra,0x2
    3714:	138080e7          	jalr	312(ra) # 5848 <exit>
    printf("chdir dd/../../dd failed\n", s);
    3718:	85ca                	mv	a1,s2
    371a:	00004517          	auipc	a0,0x4
    371e:	e7650513          	addi	a0,a0,-394 # 7590 <malloc+0x1912>
    3722:	00002097          	auipc	ra,0x2
    3726:	49e080e7          	jalr	1182(ra) # 5bc0 <printf>
    exit(1);
    372a:	4505                	li	a0,1
    372c:	00002097          	auipc	ra,0x2
    3730:	11c080e7          	jalr	284(ra) # 5848 <exit>
    printf("%s: chdir ./.. failed\n", s);
    3734:	85ca                	mv	a1,s2
    3736:	00004517          	auipc	a0,0x4
    373a:	e8250513          	addi	a0,a0,-382 # 75b8 <malloc+0x193a>
    373e:	00002097          	auipc	ra,0x2
    3742:	482080e7          	jalr	1154(ra) # 5bc0 <printf>
    exit(1);
    3746:	4505                	li	a0,1
    3748:	00002097          	auipc	ra,0x2
    374c:	100080e7          	jalr	256(ra) # 5848 <exit>
    printf("%s: open dd/dd/ffff failed\n", s);
    3750:	85ca                	mv	a1,s2
    3752:	00004517          	auipc	a0,0x4
    3756:	e7e50513          	addi	a0,a0,-386 # 75d0 <malloc+0x1952>
    375a:	00002097          	auipc	ra,0x2
    375e:	466080e7          	jalr	1126(ra) # 5bc0 <printf>
    exit(1);
    3762:	4505                	li	a0,1
    3764:	00002097          	auipc	ra,0x2
    3768:	0e4080e7          	jalr	228(ra) # 5848 <exit>
    printf("%s: read dd/dd/ffff wrong len\n", s);
    376c:	85ca                	mv	a1,s2
    376e:	00004517          	auipc	a0,0x4
    3772:	e8250513          	addi	a0,a0,-382 # 75f0 <malloc+0x1972>
    3776:	00002097          	auipc	ra,0x2
    377a:	44a080e7          	jalr	1098(ra) # 5bc0 <printf>
    exit(1);
    377e:	4505                	li	a0,1
    3780:	00002097          	auipc	ra,0x2
    3784:	0c8080e7          	jalr	200(ra) # 5848 <exit>
    printf("%s: open (unlinked) dd/dd/ff succeeded!\n", s);
    3788:	85ca                	mv	a1,s2
    378a:	00004517          	auipc	a0,0x4
    378e:	e8650513          	addi	a0,a0,-378 # 7610 <malloc+0x1992>
    3792:	00002097          	auipc	ra,0x2
    3796:	42e080e7          	jalr	1070(ra) # 5bc0 <printf>
    exit(1);
    379a:	4505                	li	a0,1
    379c:	00002097          	auipc	ra,0x2
    37a0:	0ac080e7          	jalr	172(ra) # 5848 <exit>
    printf("%s: create dd/ff/ff succeeded!\n", s);
    37a4:	85ca                	mv	a1,s2
    37a6:	00004517          	auipc	a0,0x4
    37aa:	eaa50513          	addi	a0,a0,-342 # 7650 <malloc+0x19d2>
    37ae:	00002097          	auipc	ra,0x2
    37b2:	412080e7          	jalr	1042(ra) # 5bc0 <printf>
    exit(1);
    37b6:	4505                	li	a0,1
    37b8:	00002097          	auipc	ra,0x2
    37bc:	090080e7          	jalr	144(ra) # 5848 <exit>
    printf("%s: create dd/xx/ff succeeded!\n", s);
    37c0:	85ca                	mv	a1,s2
    37c2:	00004517          	auipc	a0,0x4
    37c6:	ebe50513          	addi	a0,a0,-322 # 7680 <malloc+0x1a02>
    37ca:	00002097          	auipc	ra,0x2
    37ce:	3f6080e7          	jalr	1014(ra) # 5bc0 <printf>
    exit(1);
    37d2:	4505                	li	a0,1
    37d4:	00002097          	auipc	ra,0x2
    37d8:	074080e7          	jalr	116(ra) # 5848 <exit>
    printf("%s: create dd succeeded!\n", s);
    37dc:	85ca                	mv	a1,s2
    37de:	00004517          	auipc	a0,0x4
    37e2:	ec250513          	addi	a0,a0,-318 # 76a0 <malloc+0x1a22>
    37e6:	00002097          	auipc	ra,0x2
    37ea:	3da080e7          	jalr	986(ra) # 5bc0 <printf>
    exit(1);
    37ee:	4505                	li	a0,1
    37f0:	00002097          	auipc	ra,0x2
    37f4:	058080e7          	jalr	88(ra) # 5848 <exit>
    printf("%s: open dd rdwr succeeded!\n", s);
    37f8:	85ca                	mv	a1,s2
    37fa:	00004517          	auipc	a0,0x4
    37fe:	ec650513          	addi	a0,a0,-314 # 76c0 <malloc+0x1a42>
    3802:	00002097          	auipc	ra,0x2
    3806:	3be080e7          	jalr	958(ra) # 5bc0 <printf>
    exit(1);
    380a:	4505                	li	a0,1
    380c:	00002097          	auipc	ra,0x2
    3810:	03c080e7          	jalr	60(ra) # 5848 <exit>
    printf("%s: open dd wronly succeeded!\n", s);
    3814:	85ca                	mv	a1,s2
    3816:	00004517          	auipc	a0,0x4
    381a:	eca50513          	addi	a0,a0,-310 # 76e0 <malloc+0x1a62>
    381e:	00002097          	auipc	ra,0x2
    3822:	3a2080e7          	jalr	930(ra) # 5bc0 <printf>
    exit(1);
    3826:	4505                	li	a0,1
    3828:	00002097          	auipc	ra,0x2
    382c:	020080e7          	jalr	32(ra) # 5848 <exit>
    printf("%s: link dd/ff/ff dd/dd/xx succeeded!\n", s);
    3830:	85ca                	mv	a1,s2
    3832:	00004517          	auipc	a0,0x4
    3836:	ede50513          	addi	a0,a0,-290 # 7710 <malloc+0x1a92>
    383a:	00002097          	auipc	ra,0x2
    383e:	386080e7          	jalr	902(ra) # 5bc0 <printf>
    exit(1);
    3842:	4505                	li	a0,1
    3844:	00002097          	auipc	ra,0x2
    3848:	004080e7          	jalr	4(ra) # 5848 <exit>
    printf("%s: link dd/xx/ff dd/dd/xx succeeded!\n", s);
    384c:	85ca                	mv	a1,s2
    384e:	00004517          	auipc	a0,0x4
    3852:	eea50513          	addi	a0,a0,-278 # 7738 <malloc+0x1aba>
    3856:	00002097          	auipc	ra,0x2
    385a:	36a080e7          	jalr	874(ra) # 5bc0 <printf>
    exit(1);
    385e:	4505                	li	a0,1
    3860:	00002097          	auipc	ra,0x2
    3864:	fe8080e7          	jalr	-24(ra) # 5848 <exit>
    printf("%s: link dd/ff dd/dd/ffff succeeded!\n", s);
    3868:	85ca                	mv	a1,s2
    386a:	00004517          	auipc	a0,0x4
    386e:	ef650513          	addi	a0,a0,-266 # 7760 <malloc+0x1ae2>
    3872:	00002097          	auipc	ra,0x2
    3876:	34e080e7          	jalr	846(ra) # 5bc0 <printf>
    exit(1);
    387a:	4505                	li	a0,1
    387c:	00002097          	auipc	ra,0x2
    3880:	fcc080e7          	jalr	-52(ra) # 5848 <exit>
    printf("%s: mkdir dd/ff/ff succeeded!\n", s);
    3884:	85ca                	mv	a1,s2
    3886:	00004517          	auipc	a0,0x4
    388a:	f0250513          	addi	a0,a0,-254 # 7788 <malloc+0x1b0a>
    388e:	00002097          	auipc	ra,0x2
    3892:	332080e7          	jalr	818(ra) # 5bc0 <printf>
    exit(1);
    3896:	4505                	li	a0,1
    3898:	00002097          	auipc	ra,0x2
    389c:	fb0080e7          	jalr	-80(ra) # 5848 <exit>
    printf("%s: mkdir dd/xx/ff succeeded!\n", s);
    38a0:	85ca                	mv	a1,s2
    38a2:	00004517          	auipc	a0,0x4
    38a6:	f0650513          	addi	a0,a0,-250 # 77a8 <malloc+0x1b2a>
    38aa:	00002097          	auipc	ra,0x2
    38ae:	316080e7          	jalr	790(ra) # 5bc0 <printf>
    exit(1);
    38b2:	4505                	li	a0,1
    38b4:	00002097          	auipc	ra,0x2
    38b8:	f94080e7          	jalr	-108(ra) # 5848 <exit>
    printf("%s: mkdir dd/dd/ffff succeeded!\n", s);
    38bc:	85ca                	mv	a1,s2
    38be:	00004517          	auipc	a0,0x4
    38c2:	f0a50513          	addi	a0,a0,-246 # 77c8 <malloc+0x1b4a>
    38c6:	00002097          	auipc	ra,0x2
    38ca:	2fa080e7          	jalr	762(ra) # 5bc0 <printf>
    exit(1);
    38ce:	4505                	li	a0,1
    38d0:	00002097          	auipc	ra,0x2
    38d4:	f78080e7          	jalr	-136(ra) # 5848 <exit>
    printf("%s: unlink dd/xx/ff succeeded!\n", s);
    38d8:	85ca                	mv	a1,s2
    38da:	00004517          	auipc	a0,0x4
    38de:	f1650513          	addi	a0,a0,-234 # 77f0 <malloc+0x1b72>
    38e2:	00002097          	auipc	ra,0x2
    38e6:	2de080e7          	jalr	734(ra) # 5bc0 <printf>
    exit(1);
    38ea:	4505                	li	a0,1
    38ec:	00002097          	auipc	ra,0x2
    38f0:	f5c080e7          	jalr	-164(ra) # 5848 <exit>
    printf("%s: unlink dd/ff/ff succeeded!\n", s);
    38f4:	85ca                	mv	a1,s2
    38f6:	00004517          	auipc	a0,0x4
    38fa:	f1a50513          	addi	a0,a0,-230 # 7810 <malloc+0x1b92>
    38fe:	00002097          	auipc	ra,0x2
    3902:	2c2080e7          	jalr	706(ra) # 5bc0 <printf>
    exit(1);
    3906:	4505                	li	a0,1
    3908:	00002097          	auipc	ra,0x2
    390c:	f40080e7          	jalr	-192(ra) # 5848 <exit>
    printf("%s: chdir dd/ff succeeded!\n", s);
    3910:	85ca                	mv	a1,s2
    3912:	00004517          	auipc	a0,0x4
    3916:	f1e50513          	addi	a0,a0,-226 # 7830 <malloc+0x1bb2>
    391a:	00002097          	auipc	ra,0x2
    391e:	2a6080e7          	jalr	678(ra) # 5bc0 <printf>
    exit(1);
    3922:	4505                	li	a0,1
    3924:	00002097          	auipc	ra,0x2
    3928:	f24080e7          	jalr	-220(ra) # 5848 <exit>
    printf("%s: chdir dd/xx succeeded!\n", s);
    392c:	85ca                	mv	a1,s2
    392e:	00004517          	auipc	a0,0x4
    3932:	f2a50513          	addi	a0,a0,-214 # 7858 <malloc+0x1bda>
    3936:	00002097          	auipc	ra,0x2
    393a:	28a080e7          	jalr	650(ra) # 5bc0 <printf>
    exit(1);
    393e:	4505                	li	a0,1
    3940:	00002097          	auipc	ra,0x2
    3944:	f08080e7          	jalr	-248(ra) # 5848 <exit>
    printf("%s: unlink dd/dd/ff failed\n", s);
    3948:	85ca                	mv	a1,s2
    394a:	00004517          	auipc	a0,0x4
    394e:	ba650513          	addi	a0,a0,-1114 # 74f0 <malloc+0x1872>
    3952:	00002097          	auipc	ra,0x2
    3956:	26e080e7          	jalr	622(ra) # 5bc0 <printf>
    exit(1);
    395a:	4505                	li	a0,1
    395c:	00002097          	auipc	ra,0x2
    3960:	eec080e7          	jalr	-276(ra) # 5848 <exit>
    printf("%s: unlink dd/ff failed\n", s);
    3964:	85ca                	mv	a1,s2
    3966:	00004517          	auipc	a0,0x4
    396a:	f1250513          	addi	a0,a0,-238 # 7878 <malloc+0x1bfa>
    396e:	00002097          	auipc	ra,0x2
    3972:	252080e7          	jalr	594(ra) # 5bc0 <printf>
    exit(1);
    3976:	4505                	li	a0,1
    3978:	00002097          	auipc	ra,0x2
    397c:	ed0080e7          	jalr	-304(ra) # 5848 <exit>
    printf("%s: unlink non-empty dd succeeded!\n", s);
    3980:	85ca                	mv	a1,s2
    3982:	00004517          	auipc	a0,0x4
    3986:	f1650513          	addi	a0,a0,-234 # 7898 <malloc+0x1c1a>
    398a:	00002097          	auipc	ra,0x2
    398e:	236080e7          	jalr	566(ra) # 5bc0 <printf>
    exit(1);
    3992:	4505                	li	a0,1
    3994:	00002097          	auipc	ra,0x2
    3998:	eb4080e7          	jalr	-332(ra) # 5848 <exit>
    printf("%s: unlink dd/dd failed\n", s);
    399c:	85ca                	mv	a1,s2
    399e:	00004517          	auipc	a0,0x4
    39a2:	f2a50513          	addi	a0,a0,-214 # 78c8 <malloc+0x1c4a>
    39a6:	00002097          	auipc	ra,0x2
    39aa:	21a080e7          	jalr	538(ra) # 5bc0 <printf>
    exit(1);
    39ae:	4505                	li	a0,1
    39b0:	00002097          	auipc	ra,0x2
    39b4:	e98080e7          	jalr	-360(ra) # 5848 <exit>
    printf("%s: unlink dd failed\n", s);
    39b8:	85ca                	mv	a1,s2
    39ba:	00004517          	auipc	a0,0x4
    39be:	f2e50513          	addi	a0,a0,-210 # 78e8 <malloc+0x1c6a>
    39c2:	00002097          	auipc	ra,0x2
    39c6:	1fe080e7          	jalr	510(ra) # 5bc0 <printf>
    exit(1);
    39ca:	4505                	li	a0,1
    39cc:	00002097          	auipc	ra,0x2
    39d0:	e7c080e7          	jalr	-388(ra) # 5848 <exit>

00000000000039d4 <rmdot>:
{
    39d4:	1101                	addi	sp,sp,-32
    39d6:	ec06                	sd	ra,24(sp)
    39d8:	e822                	sd	s0,16(sp)
    39da:	e426                	sd	s1,8(sp)
    39dc:	1000                	addi	s0,sp,32
    39de:	84aa                	mv	s1,a0
  if(mkdir("dots") != 0){
    39e0:	00004517          	auipc	a0,0x4
    39e4:	f2050513          	addi	a0,a0,-224 # 7900 <malloc+0x1c82>
    39e8:	00002097          	auipc	ra,0x2
    39ec:	ec8080e7          	jalr	-312(ra) # 58b0 <mkdir>
    39f0:	e549                	bnez	a0,3a7a <rmdot+0xa6>
  if(chdir("dots") != 0){
    39f2:	00004517          	auipc	a0,0x4
    39f6:	f0e50513          	addi	a0,a0,-242 # 7900 <malloc+0x1c82>
    39fa:	00002097          	auipc	ra,0x2
    39fe:	ebe080e7          	jalr	-322(ra) # 58b8 <chdir>
    3a02:	e951                	bnez	a0,3a96 <rmdot+0xc2>
  if(unlink(".") == 0){
    3a04:	00003517          	auipc	a0,0x3
    3a08:	d9450513          	addi	a0,a0,-620 # 6798 <malloc+0xb1a>
    3a0c:	00002097          	auipc	ra,0x2
    3a10:	e8c080e7          	jalr	-372(ra) # 5898 <unlink>
    3a14:	cd59                	beqz	a0,3ab2 <rmdot+0xde>
  if(unlink("..") == 0){
    3a16:	00004517          	auipc	a0,0x4
    3a1a:	94250513          	addi	a0,a0,-1726 # 7358 <malloc+0x16da>
    3a1e:	00002097          	auipc	ra,0x2
    3a22:	e7a080e7          	jalr	-390(ra) # 5898 <unlink>
    3a26:	c545                	beqz	a0,3ace <rmdot+0xfa>
  if(chdir("/") != 0){
    3a28:	00004517          	auipc	a0,0x4
    3a2c:	8d850513          	addi	a0,a0,-1832 # 7300 <malloc+0x1682>
    3a30:	00002097          	auipc	ra,0x2
    3a34:	e88080e7          	jalr	-376(ra) # 58b8 <chdir>
    3a38:	e94d                	bnez	a0,3aea <rmdot+0x116>
  if(unlink("dots/.") == 0){
    3a3a:	00004517          	auipc	a0,0x4
    3a3e:	f2e50513          	addi	a0,a0,-210 # 7968 <malloc+0x1cea>
    3a42:	00002097          	auipc	ra,0x2
    3a46:	e56080e7          	jalr	-426(ra) # 5898 <unlink>
    3a4a:	cd55                	beqz	a0,3b06 <rmdot+0x132>
  if(unlink("dots/..") == 0){
    3a4c:	00004517          	auipc	a0,0x4
    3a50:	f4450513          	addi	a0,a0,-188 # 7990 <malloc+0x1d12>
    3a54:	00002097          	auipc	ra,0x2
    3a58:	e44080e7          	jalr	-444(ra) # 5898 <unlink>
    3a5c:	c179                	beqz	a0,3b22 <rmdot+0x14e>
  if(unlink("dots") != 0){
    3a5e:	00004517          	auipc	a0,0x4
    3a62:	ea250513          	addi	a0,a0,-350 # 7900 <malloc+0x1c82>
    3a66:	00002097          	auipc	ra,0x2
    3a6a:	e32080e7          	jalr	-462(ra) # 5898 <unlink>
    3a6e:	e961                	bnez	a0,3b3e <rmdot+0x16a>
}
    3a70:	60e2                	ld	ra,24(sp)
    3a72:	6442                	ld	s0,16(sp)
    3a74:	64a2                	ld	s1,8(sp)
    3a76:	6105                	addi	sp,sp,32
    3a78:	8082                	ret
    printf("%s: mkdir dots failed\n", s);
    3a7a:	85a6                	mv	a1,s1
    3a7c:	00004517          	auipc	a0,0x4
    3a80:	e8c50513          	addi	a0,a0,-372 # 7908 <malloc+0x1c8a>
    3a84:	00002097          	auipc	ra,0x2
    3a88:	13c080e7          	jalr	316(ra) # 5bc0 <printf>
    exit(1);
    3a8c:	4505                	li	a0,1
    3a8e:	00002097          	auipc	ra,0x2
    3a92:	dba080e7          	jalr	-582(ra) # 5848 <exit>
    printf("%s: chdir dots failed\n", s);
    3a96:	85a6                	mv	a1,s1
    3a98:	00004517          	auipc	a0,0x4
    3a9c:	e8850513          	addi	a0,a0,-376 # 7920 <malloc+0x1ca2>
    3aa0:	00002097          	auipc	ra,0x2
    3aa4:	120080e7          	jalr	288(ra) # 5bc0 <printf>
    exit(1);
    3aa8:	4505                	li	a0,1
    3aaa:	00002097          	auipc	ra,0x2
    3aae:	d9e080e7          	jalr	-610(ra) # 5848 <exit>
    printf("%s: rm . worked!\n", s);
    3ab2:	85a6                	mv	a1,s1
    3ab4:	00004517          	auipc	a0,0x4
    3ab8:	e8450513          	addi	a0,a0,-380 # 7938 <malloc+0x1cba>
    3abc:	00002097          	auipc	ra,0x2
    3ac0:	104080e7          	jalr	260(ra) # 5bc0 <printf>
    exit(1);
    3ac4:	4505                	li	a0,1
    3ac6:	00002097          	auipc	ra,0x2
    3aca:	d82080e7          	jalr	-638(ra) # 5848 <exit>
    printf("%s: rm .. worked!\n", s);
    3ace:	85a6                	mv	a1,s1
    3ad0:	00004517          	auipc	a0,0x4
    3ad4:	e8050513          	addi	a0,a0,-384 # 7950 <malloc+0x1cd2>
    3ad8:	00002097          	auipc	ra,0x2
    3adc:	0e8080e7          	jalr	232(ra) # 5bc0 <printf>
    exit(1);
    3ae0:	4505                	li	a0,1
    3ae2:	00002097          	auipc	ra,0x2
    3ae6:	d66080e7          	jalr	-666(ra) # 5848 <exit>
    printf("%s: chdir / failed\n", s);
    3aea:	85a6                	mv	a1,s1
    3aec:	00004517          	auipc	a0,0x4
    3af0:	81c50513          	addi	a0,a0,-2020 # 7308 <malloc+0x168a>
    3af4:	00002097          	auipc	ra,0x2
    3af8:	0cc080e7          	jalr	204(ra) # 5bc0 <printf>
    exit(1);
    3afc:	4505                	li	a0,1
    3afe:	00002097          	auipc	ra,0x2
    3b02:	d4a080e7          	jalr	-694(ra) # 5848 <exit>
    printf("%s: unlink dots/. worked!\n", s);
    3b06:	85a6                	mv	a1,s1
    3b08:	00004517          	auipc	a0,0x4
    3b0c:	e6850513          	addi	a0,a0,-408 # 7970 <malloc+0x1cf2>
    3b10:	00002097          	auipc	ra,0x2
    3b14:	0b0080e7          	jalr	176(ra) # 5bc0 <printf>
    exit(1);
    3b18:	4505                	li	a0,1
    3b1a:	00002097          	auipc	ra,0x2
    3b1e:	d2e080e7          	jalr	-722(ra) # 5848 <exit>
    printf("%s: unlink dots/.. worked!\n", s);
    3b22:	85a6                	mv	a1,s1
    3b24:	00004517          	auipc	a0,0x4
    3b28:	e7450513          	addi	a0,a0,-396 # 7998 <malloc+0x1d1a>
    3b2c:	00002097          	auipc	ra,0x2
    3b30:	094080e7          	jalr	148(ra) # 5bc0 <printf>
    exit(1);
    3b34:	4505                	li	a0,1
    3b36:	00002097          	auipc	ra,0x2
    3b3a:	d12080e7          	jalr	-750(ra) # 5848 <exit>
    printf("%s: unlink dots failed!\n", s);
    3b3e:	85a6                	mv	a1,s1
    3b40:	00004517          	auipc	a0,0x4
    3b44:	e7850513          	addi	a0,a0,-392 # 79b8 <malloc+0x1d3a>
    3b48:	00002097          	auipc	ra,0x2
    3b4c:	078080e7          	jalr	120(ra) # 5bc0 <printf>
    exit(1);
    3b50:	4505                	li	a0,1
    3b52:	00002097          	auipc	ra,0x2
    3b56:	cf6080e7          	jalr	-778(ra) # 5848 <exit>

0000000000003b5a <dirfile>:
{
    3b5a:	1101                	addi	sp,sp,-32
    3b5c:	ec06                	sd	ra,24(sp)
    3b5e:	e822                	sd	s0,16(sp)
    3b60:	e426                	sd	s1,8(sp)
    3b62:	e04a                	sd	s2,0(sp)
    3b64:	1000                	addi	s0,sp,32
    3b66:	892a                	mv	s2,a0
  fd = open("dirfile", O_CREATE);
    3b68:	20000593          	li	a1,512
    3b6c:	00002517          	auipc	a0,0x2
    3b70:	53450513          	addi	a0,a0,1332 # 60a0 <malloc+0x422>
    3b74:	00002097          	auipc	ra,0x2
    3b78:	d14080e7          	jalr	-748(ra) # 5888 <open>
  if(fd < 0){
    3b7c:	0e054d63          	bltz	a0,3c76 <dirfile+0x11c>
  close(fd);
    3b80:	00002097          	auipc	ra,0x2
    3b84:	cf0080e7          	jalr	-784(ra) # 5870 <close>
  if(chdir("dirfile") == 0){
    3b88:	00002517          	auipc	a0,0x2
    3b8c:	51850513          	addi	a0,a0,1304 # 60a0 <malloc+0x422>
    3b90:	00002097          	auipc	ra,0x2
    3b94:	d28080e7          	jalr	-728(ra) # 58b8 <chdir>
    3b98:	cd6d                	beqz	a0,3c92 <dirfile+0x138>
  fd = open("dirfile/xx", 0);
    3b9a:	4581                	li	a1,0
    3b9c:	00004517          	auipc	a0,0x4
    3ba0:	e7c50513          	addi	a0,a0,-388 # 7a18 <malloc+0x1d9a>
    3ba4:	00002097          	auipc	ra,0x2
    3ba8:	ce4080e7          	jalr	-796(ra) # 5888 <open>
  if(fd >= 0){
    3bac:	10055163          	bgez	a0,3cae <dirfile+0x154>
  fd = open("dirfile/xx", O_CREATE);
    3bb0:	20000593          	li	a1,512
    3bb4:	00004517          	auipc	a0,0x4
    3bb8:	e6450513          	addi	a0,a0,-412 # 7a18 <malloc+0x1d9a>
    3bbc:	00002097          	auipc	ra,0x2
    3bc0:	ccc080e7          	jalr	-820(ra) # 5888 <open>
  if(fd >= 0){
    3bc4:	10055363          	bgez	a0,3cca <dirfile+0x170>
  if(mkdir("dirfile/xx") == 0){
    3bc8:	00004517          	auipc	a0,0x4
    3bcc:	e5050513          	addi	a0,a0,-432 # 7a18 <malloc+0x1d9a>
    3bd0:	00002097          	auipc	ra,0x2
    3bd4:	ce0080e7          	jalr	-800(ra) # 58b0 <mkdir>
    3bd8:	10050763          	beqz	a0,3ce6 <dirfile+0x18c>
  if(unlink("dirfile/xx") == 0){
    3bdc:	00004517          	auipc	a0,0x4
    3be0:	e3c50513          	addi	a0,a0,-452 # 7a18 <malloc+0x1d9a>
    3be4:	00002097          	auipc	ra,0x2
    3be8:	cb4080e7          	jalr	-844(ra) # 5898 <unlink>
    3bec:	10050b63          	beqz	a0,3d02 <dirfile+0x1a8>
  if(link("README", "dirfile/xx") == 0){
    3bf0:	00004597          	auipc	a1,0x4
    3bf4:	e2858593          	addi	a1,a1,-472 # 7a18 <malloc+0x1d9a>
    3bf8:	00002517          	auipc	a0,0x2
    3bfc:	6a050513          	addi	a0,a0,1696 # 6298 <malloc+0x61a>
    3c00:	00002097          	auipc	ra,0x2
    3c04:	ca8080e7          	jalr	-856(ra) # 58a8 <link>
    3c08:	10050b63          	beqz	a0,3d1e <dirfile+0x1c4>
  if(unlink("dirfile") != 0){
    3c0c:	00002517          	auipc	a0,0x2
    3c10:	49450513          	addi	a0,a0,1172 # 60a0 <malloc+0x422>
    3c14:	00002097          	auipc	ra,0x2
    3c18:	c84080e7          	jalr	-892(ra) # 5898 <unlink>
    3c1c:	10051f63          	bnez	a0,3d3a <dirfile+0x1e0>
  fd = open(".", O_RDWR);
    3c20:	4589                	li	a1,2
    3c22:	00003517          	auipc	a0,0x3
    3c26:	b7650513          	addi	a0,a0,-1162 # 6798 <malloc+0xb1a>
    3c2a:	00002097          	auipc	ra,0x2
    3c2e:	c5e080e7          	jalr	-930(ra) # 5888 <open>
  if(fd >= 0){
    3c32:	12055263          	bgez	a0,3d56 <dirfile+0x1fc>
  fd = open(".", 0);
    3c36:	4581                	li	a1,0
    3c38:	00003517          	auipc	a0,0x3
    3c3c:	b6050513          	addi	a0,a0,-1184 # 6798 <malloc+0xb1a>
    3c40:	00002097          	auipc	ra,0x2
    3c44:	c48080e7          	jalr	-952(ra) # 5888 <open>
    3c48:	84aa                	mv	s1,a0
  if(write(fd, "x", 1) > 0){
    3c4a:	4605                	li	a2,1
    3c4c:	00002597          	auipc	a1,0x2
    3c50:	52458593          	addi	a1,a1,1316 # 6170 <malloc+0x4f2>
    3c54:	00002097          	auipc	ra,0x2
    3c58:	c14080e7          	jalr	-1004(ra) # 5868 <write>
    3c5c:	10a04b63          	bgtz	a0,3d72 <dirfile+0x218>
  close(fd);
    3c60:	8526                	mv	a0,s1
    3c62:	00002097          	auipc	ra,0x2
    3c66:	c0e080e7          	jalr	-1010(ra) # 5870 <close>
}
    3c6a:	60e2                	ld	ra,24(sp)
    3c6c:	6442                	ld	s0,16(sp)
    3c6e:	64a2                	ld	s1,8(sp)
    3c70:	6902                	ld	s2,0(sp)
    3c72:	6105                	addi	sp,sp,32
    3c74:	8082                	ret
    printf("%s: create dirfile failed\n", s);
    3c76:	85ca                	mv	a1,s2
    3c78:	00004517          	auipc	a0,0x4
    3c7c:	d6050513          	addi	a0,a0,-672 # 79d8 <malloc+0x1d5a>
    3c80:	00002097          	auipc	ra,0x2
    3c84:	f40080e7          	jalr	-192(ra) # 5bc0 <printf>
    exit(1);
    3c88:	4505                	li	a0,1
    3c8a:	00002097          	auipc	ra,0x2
    3c8e:	bbe080e7          	jalr	-1090(ra) # 5848 <exit>
    printf("%s: chdir dirfile succeeded!\n", s);
    3c92:	85ca                	mv	a1,s2
    3c94:	00004517          	auipc	a0,0x4
    3c98:	d6450513          	addi	a0,a0,-668 # 79f8 <malloc+0x1d7a>
    3c9c:	00002097          	auipc	ra,0x2
    3ca0:	f24080e7          	jalr	-220(ra) # 5bc0 <printf>
    exit(1);
    3ca4:	4505                	li	a0,1
    3ca6:	00002097          	auipc	ra,0x2
    3caa:	ba2080e7          	jalr	-1118(ra) # 5848 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    3cae:	85ca                	mv	a1,s2
    3cb0:	00004517          	auipc	a0,0x4
    3cb4:	d7850513          	addi	a0,a0,-648 # 7a28 <malloc+0x1daa>
    3cb8:	00002097          	auipc	ra,0x2
    3cbc:	f08080e7          	jalr	-248(ra) # 5bc0 <printf>
    exit(1);
    3cc0:	4505                	li	a0,1
    3cc2:	00002097          	auipc	ra,0x2
    3cc6:	b86080e7          	jalr	-1146(ra) # 5848 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    3cca:	85ca                	mv	a1,s2
    3ccc:	00004517          	auipc	a0,0x4
    3cd0:	d5c50513          	addi	a0,a0,-676 # 7a28 <malloc+0x1daa>
    3cd4:	00002097          	auipc	ra,0x2
    3cd8:	eec080e7          	jalr	-276(ra) # 5bc0 <printf>
    exit(1);
    3cdc:	4505                	li	a0,1
    3cde:	00002097          	auipc	ra,0x2
    3ce2:	b6a080e7          	jalr	-1174(ra) # 5848 <exit>
    printf("%s: mkdir dirfile/xx succeeded!\n", s);
    3ce6:	85ca                	mv	a1,s2
    3ce8:	00004517          	auipc	a0,0x4
    3cec:	d6850513          	addi	a0,a0,-664 # 7a50 <malloc+0x1dd2>
    3cf0:	00002097          	auipc	ra,0x2
    3cf4:	ed0080e7          	jalr	-304(ra) # 5bc0 <printf>
    exit(1);
    3cf8:	4505                	li	a0,1
    3cfa:	00002097          	auipc	ra,0x2
    3cfe:	b4e080e7          	jalr	-1202(ra) # 5848 <exit>
    printf("%s: unlink dirfile/xx succeeded!\n", s);
    3d02:	85ca                	mv	a1,s2
    3d04:	00004517          	auipc	a0,0x4
    3d08:	d7450513          	addi	a0,a0,-652 # 7a78 <malloc+0x1dfa>
    3d0c:	00002097          	auipc	ra,0x2
    3d10:	eb4080e7          	jalr	-332(ra) # 5bc0 <printf>
    exit(1);
    3d14:	4505                	li	a0,1
    3d16:	00002097          	auipc	ra,0x2
    3d1a:	b32080e7          	jalr	-1230(ra) # 5848 <exit>
    printf("%s: link to dirfile/xx succeeded!\n", s);
    3d1e:	85ca                	mv	a1,s2
    3d20:	00004517          	auipc	a0,0x4
    3d24:	d8050513          	addi	a0,a0,-640 # 7aa0 <malloc+0x1e22>
    3d28:	00002097          	auipc	ra,0x2
    3d2c:	e98080e7          	jalr	-360(ra) # 5bc0 <printf>
    exit(1);
    3d30:	4505                	li	a0,1
    3d32:	00002097          	auipc	ra,0x2
    3d36:	b16080e7          	jalr	-1258(ra) # 5848 <exit>
    printf("%s: unlink dirfile failed!\n", s);
    3d3a:	85ca                	mv	a1,s2
    3d3c:	00004517          	auipc	a0,0x4
    3d40:	d8c50513          	addi	a0,a0,-628 # 7ac8 <malloc+0x1e4a>
    3d44:	00002097          	auipc	ra,0x2
    3d48:	e7c080e7          	jalr	-388(ra) # 5bc0 <printf>
    exit(1);
    3d4c:	4505                	li	a0,1
    3d4e:	00002097          	auipc	ra,0x2
    3d52:	afa080e7          	jalr	-1286(ra) # 5848 <exit>
    printf("%s: open . for writing succeeded!\n", s);
    3d56:	85ca                	mv	a1,s2
    3d58:	00004517          	auipc	a0,0x4
    3d5c:	d9050513          	addi	a0,a0,-624 # 7ae8 <malloc+0x1e6a>
    3d60:	00002097          	auipc	ra,0x2
    3d64:	e60080e7          	jalr	-416(ra) # 5bc0 <printf>
    exit(1);
    3d68:	4505                	li	a0,1
    3d6a:	00002097          	auipc	ra,0x2
    3d6e:	ade080e7          	jalr	-1314(ra) # 5848 <exit>
    printf("%s: write . succeeded!\n", s);
    3d72:	85ca                	mv	a1,s2
    3d74:	00004517          	auipc	a0,0x4
    3d78:	d9c50513          	addi	a0,a0,-612 # 7b10 <malloc+0x1e92>
    3d7c:	00002097          	auipc	ra,0x2
    3d80:	e44080e7          	jalr	-444(ra) # 5bc0 <printf>
    exit(1);
    3d84:	4505                	li	a0,1
    3d86:	00002097          	auipc	ra,0x2
    3d8a:	ac2080e7          	jalr	-1342(ra) # 5848 <exit>

0000000000003d8e <iref>:
{
    3d8e:	7139                	addi	sp,sp,-64
    3d90:	fc06                	sd	ra,56(sp)
    3d92:	f822                	sd	s0,48(sp)
    3d94:	f426                	sd	s1,40(sp)
    3d96:	f04a                	sd	s2,32(sp)
    3d98:	ec4e                	sd	s3,24(sp)
    3d9a:	e852                	sd	s4,16(sp)
    3d9c:	e456                	sd	s5,8(sp)
    3d9e:	e05a                	sd	s6,0(sp)
    3da0:	0080                	addi	s0,sp,64
    3da2:	8b2a                	mv	s6,a0
    3da4:	03300913          	li	s2,51
    if(mkdir("irefd") != 0){
    3da8:	00004a17          	auipc	s4,0x4
    3dac:	d80a0a13          	addi	s4,s4,-640 # 7b28 <malloc+0x1eaa>
    mkdir("");
    3db0:	00004497          	auipc	s1,0x4
    3db4:	88848493          	addi	s1,s1,-1912 # 7638 <malloc+0x19ba>
    link("README", "");
    3db8:	00002a97          	auipc	s5,0x2
    3dbc:	4e0a8a93          	addi	s5,s5,1248 # 6298 <malloc+0x61a>
    fd = open("xx", O_CREATE);
    3dc0:	00004997          	auipc	s3,0x4
    3dc4:	c6098993          	addi	s3,s3,-928 # 7a20 <malloc+0x1da2>
    3dc8:	a891                	j	3e1c <iref+0x8e>
      printf("%s: mkdir irefd failed\n", s);
    3dca:	85da                	mv	a1,s6
    3dcc:	00004517          	auipc	a0,0x4
    3dd0:	d6450513          	addi	a0,a0,-668 # 7b30 <malloc+0x1eb2>
    3dd4:	00002097          	auipc	ra,0x2
    3dd8:	dec080e7          	jalr	-532(ra) # 5bc0 <printf>
      exit(1);
    3ddc:	4505                	li	a0,1
    3dde:	00002097          	auipc	ra,0x2
    3de2:	a6a080e7          	jalr	-1430(ra) # 5848 <exit>
      printf("%s: chdir irefd failed\n", s);
    3de6:	85da                	mv	a1,s6
    3de8:	00004517          	auipc	a0,0x4
    3dec:	d6050513          	addi	a0,a0,-672 # 7b48 <malloc+0x1eca>
    3df0:	00002097          	auipc	ra,0x2
    3df4:	dd0080e7          	jalr	-560(ra) # 5bc0 <printf>
      exit(1);
    3df8:	4505                	li	a0,1
    3dfa:	00002097          	auipc	ra,0x2
    3dfe:	a4e080e7          	jalr	-1458(ra) # 5848 <exit>
      close(fd);
    3e02:	00002097          	auipc	ra,0x2
    3e06:	a6e080e7          	jalr	-1426(ra) # 5870 <close>
    3e0a:	a889                	j	3e5c <iref+0xce>
    unlink("xx");
    3e0c:	854e                	mv	a0,s3
    3e0e:	00002097          	auipc	ra,0x2
    3e12:	a8a080e7          	jalr	-1398(ra) # 5898 <unlink>
  for(i = 0; i < NINODE + 1; i++){
    3e16:	397d                	addiw	s2,s2,-1
    3e18:	06090063          	beqz	s2,3e78 <iref+0xea>
    if(mkdir("irefd") != 0){
    3e1c:	8552                	mv	a0,s4
    3e1e:	00002097          	auipc	ra,0x2
    3e22:	a92080e7          	jalr	-1390(ra) # 58b0 <mkdir>
    3e26:	f155                	bnez	a0,3dca <iref+0x3c>
    if(chdir("irefd") != 0){
    3e28:	8552                	mv	a0,s4
    3e2a:	00002097          	auipc	ra,0x2
    3e2e:	a8e080e7          	jalr	-1394(ra) # 58b8 <chdir>
    3e32:	f955                	bnez	a0,3de6 <iref+0x58>
    mkdir("");
    3e34:	8526                	mv	a0,s1
    3e36:	00002097          	auipc	ra,0x2
    3e3a:	a7a080e7          	jalr	-1414(ra) # 58b0 <mkdir>
    link("README", "");
    3e3e:	85a6                	mv	a1,s1
    3e40:	8556                	mv	a0,s5
    3e42:	00002097          	auipc	ra,0x2
    3e46:	a66080e7          	jalr	-1434(ra) # 58a8 <link>
    fd = open("", O_CREATE);
    3e4a:	20000593          	li	a1,512
    3e4e:	8526                	mv	a0,s1
    3e50:	00002097          	auipc	ra,0x2
    3e54:	a38080e7          	jalr	-1480(ra) # 5888 <open>
    if(fd >= 0)
    3e58:	fa0555e3          	bgez	a0,3e02 <iref+0x74>
    fd = open("xx", O_CREATE);
    3e5c:	20000593          	li	a1,512
    3e60:	854e                	mv	a0,s3
    3e62:	00002097          	auipc	ra,0x2
    3e66:	a26080e7          	jalr	-1498(ra) # 5888 <open>
    if(fd >= 0)
    3e6a:	fa0541e3          	bltz	a0,3e0c <iref+0x7e>
      close(fd);
    3e6e:	00002097          	auipc	ra,0x2
    3e72:	a02080e7          	jalr	-1534(ra) # 5870 <close>
    3e76:	bf59                	j	3e0c <iref+0x7e>
    3e78:	03300493          	li	s1,51
    chdir("..");
    3e7c:	00003997          	auipc	s3,0x3
    3e80:	4dc98993          	addi	s3,s3,1244 # 7358 <malloc+0x16da>
    unlink("irefd");
    3e84:	00004917          	auipc	s2,0x4
    3e88:	ca490913          	addi	s2,s2,-860 # 7b28 <malloc+0x1eaa>
    chdir("..");
    3e8c:	854e                	mv	a0,s3
    3e8e:	00002097          	auipc	ra,0x2
    3e92:	a2a080e7          	jalr	-1494(ra) # 58b8 <chdir>
    unlink("irefd");
    3e96:	854a                	mv	a0,s2
    3e98:	00002097          	auipc	ra,0x2
    3e9c:	a00080e7          	jalr	-1536(ra) # 5898 <unlink>
  for(i = 0; i < NINODE + 1; i++){
    3ea0:	34fd                	addiw	s1,s1,-1
    3ea2:	f4ed                	bnez	s1,3e8c <iref+0xfe>
  chdir("/");
    3ea4:	00003517          	auipc	a0,0x3
    3ea8:	45c50513          	addi	a0,a0,1116 # 7300 <malloc+0x1682>
    3eac:	00002097          	auipc	ra,0x2
    3eb0:	a0c080e7          	jalr	-1524(ra) # 58b8 <chdir>
}
    3eb4:	70e2                	ld	ra,56(sp)
    3eb6:	7442                	ld	s0,48(sp)
    3eb8:	74a2                	ld	s1,40(sp)
    3eba:	7902                	ld	s2,32(sp)
    3ebc:	69e2                	ld	s3,24(sp)
    3ebe:	6a42                	ld	s4,16(sp)
    3ec0:	6aa2                	ld	s5,8(sp)
    3ec2:	6b02                	ld	s6,0(sp)
    3ec4:	6121                	addi	sp,sp,64
    3ec6:	8082                	ret

0000000000003ec8 <openiputtest>:
{
    3ec8:	7179                	addi	sp,sp,-48
    3eca:	f406                	sd	ra,40(sp)
    3ecc:	f022                	sd	s0,32(sp)
    3ece:	ec26                	sd	s1,24(sp)
    3ed0:	1800                	addi	s0,sp,48
    3ed2:	84aa                	mv	s1,a0
  if(mkdir("oidir") < 0){
    3ed4:	00004517          	auipc	a0,0x4
    3ed8:	c8c50513          	addi	a0,a0,-884 # 7b60 <malloc+0x1ee2>
    3edc:	00002097          	auipc	ra,0x2
    3ee0:	9d4080e7          	jalr	-1580(ra) # 58b0 <mkdir>
    3ee4:	04054263          	bltz	a0,3f28 <openiputtest+0x60>
  pid = fork();
    3ee8:	00002097          	auipc	ra,0x2
    3eec:	958080e7          	jalr	-1704(ra) # 5840 <fork>
  if(pid < 0){
    3ef0:	04054a63          	bltz	a0,3f44 <openiputtest+0x7c>
  if(pid == 0){
    3ef4:	e93d                	bnez	a0,3f6a <openiputtest+0xa2>
    int fd = open("oidir", O_RDWR);
    3ef6:	4589                	li	a1,2
    3ef8:	00004517          	auipc	a0,0x4
    3efc:	c6850513          	addi	a0,a0,-920 # 7b60 <malloc+0x1ee2>
    3f00:	00002097          	auipc	ra,0x2
    3f04:	988080e7          	jalr	-1656(ra) # 5888 <open>
    if(fd >= 0){
    3f08:	04054c63          	bltz	a0,3f60 <openiputtest+0x98>
      printf("%s: open directory for write succeeded\n", s);
    3f0c:	85a6                	mv	a1,s1
    3f0e:	00004517          	auipc	a0,0x4
    3f12:	c7250513          	addi	a0,a0,-910 # 7b80 <malloc+0x1f02>
    3f16:	00002097          	auipc	ra,0x2
    3f1a:	caa080e7          	jalr	-854(ra) # 5bc0 <printf>
      exit(1);
    3f1e:	4505                	li	a0,1
    3f20:	00002097          	auipc	ra,0x2
    3f24:	928080e7          	jalr	-1752(ra) # 5848 <exit>
    printf("%s: mkdir oidir failed\n", s);
    3f28:	85a6                	mv	a1,s1
    3f2a:	00004517          	auipc	a0,0x4
    3f2e:	c3e50513          	addi	a0,a0,-962 # 7b68 <malloc+0x1eea>
    3f32:	00002097          	auipc	ra,0x2
    3f36:	c8e080e7          	jalr	-882(ra) # 5bc0 <printf>
    exit(1);
    3f3a:	4505                	li	a0,1
    3f3c:	00002097          	auipc	ra,0x2
    3f40:	90c080e7          	jalr	-1780(ra) # 5848 <exit>
    printf("%s: fork failed\n", s);
    3f44:	85a6                	mv	a1,s1
    3f46:	00003517          	auipc	a0,0x3
    3f4a:	9f250513          	addi	a0,a0,-1550 # 6938 <malloc+0xcba>
    3f4e:	00002097          	auipc	ra,0x2
    3f52:	c72080e7          	jalr	-910(ra) # 5bc0 <printf>
    exit(1);
    3f56:	4505                	li	a0,1
    3f58:	00002097          	auipc	ra,0x2
    3f5c:	8f0080e7          	jalr	-1808(ra) # 5848 <exit>
    exit(0);
    3f60:	4501                	li	a0,0
    3f62:	00002097          	auipc	ra,0x2
    3f66:	8e6080e7          	jalr	-1818(ra) # 5848 <exit>
  sleep(1);
    3f6a:	4505                	li	a0,1
    3f6c:	00002097          	auipc	ra,0x2
    3f70:	96c080e7          	jalr	-1684(ra) # 58d8 <sleep>
  if(unlink("oidir") != 0){
    3f74:	00004517          	auipc	a0,0x4
    3f78:	bec50513          	addi	a0,a0,-1044 # 7b60 <malloc+0x1ee2>
    3f7c:	00002097          	auipc	ra,0x2
    3f80:	91c080e7          	jalr	-1764(ra) # 5898 <unlink>
    3f84:	cd19                	beqz	a0,3fa2 <openiputtest+0xda>
    printf("%s: unlink failed\n", s);
    3f86:	85a6                	mv	a1,s1
    3f88:	00003517          	auipc	a0,0x3
    3f8c:	ba050513          	addi	a0,a0,-1120 # 6b28 <malloc+0xeaa>
    3f90:	00002097          	auipc	ra,0x2
    3f94:	c30080e7          	jalr	-976(ra) # 5bc0 <printf>
    exit(1);
    3f98:	4505                	li	a0,1
    3f9a:	00002097          	auipc	ra,0x2
    3f9e:	8ae080e7          	jalr	-1874(ra) # 5848 <exit>
  wait(&xstatus);
    3fa2:	fdc40513          	addi	a0,s0,-36
    3fa6:	00002097          	auipc	ra,0x2
    3faa:	8aa080e7          	jalr	-1878(ra) # 5850 <wait>
  exit(xstatus);
    3fae:	fdc42503          	lw	a0,-36(s0)
    3fb2:	00002097          	auipc	ra,0x2
    3fb6:	896080e7          	jalr	-1898(ra) # 5848 <exit>

0000000000003fba <forkforkfork>:
{
    3fba:	1101                	addi	sp,sp,-32
    3fbc:	ec06                	sd	ra,24(sp)
    3fbe:	e822                	sd	s0,16(sp)
    3fc0:	e426                	sd	s1,8(sp)
    3fc2:	1000                	addi	s0,sp,32
    3fc4:	84aa                	mv	s1,a0
  unlink("stopforking");
    3fc6:	00004517          	auipc	a0,0x4
    3fca:	be250513          	addi	a0,a0,-1054 # 7ba8 <malloc+0x1f2a>
    3fce:	00002097          	auipc	ra,0x2
    3fd2:	8ca080e7          	jalr	-1846(ra) # 5898 <unlink>
  int pid = fork();
    3fd6:	00002097          	auipc	ra,0x2
    3fda:	86a080e7          	jalr	-1942(ra) # 5840 <fork>
  if(pid < 0){
    3fde:	04054563          	bltz	a0,4028 <forkforkfork+0x6e>
  if(pid == 0){
    3fe2:	c12d                	beqz	a0,4044 <forkforkfork+0x8a>
  sleep(20); // two seconds
    3fe4:	4551                	li	a0,20
    3fe6:	00002097          	auipc	ra,0x2
    3fea:	8f2080e7          	jalr	-1806(ra) # 58d8 <sleep>
  close(open("stopforking", O_CREATE|O_RDWR));
    3fee:	20200593          	li	a1,514
    3ff2:	00004517          	auipc	a0,0x4
    3ff6:	bb650513          	addi	a0,a0,-1098 # 7ba8 <malloc+0x1f2a>
    3ffa:	00002097          	auipc	ra,0x2
    3ffe:	88e080e7          	jalr	-1906(ra) # 5888 <open>
    4002:	00002097          	auipc	ra,0x2
    4006:	86e080e7          	jalr	-1938(ra) # 5870 <close>
  wait(0);
    400a:	4501                	li	a0,0
    400c:	00002097          	auipc	ra,0x2
    4010:	844080e7          	jalr	-1980(ra) # 5850 <wait>
  sleep(10); // one second
    4014:	4529                	li	a0,10
    4016:	00002097          	auipc	ra,0x2
    401a:	8c2080e7          	jalr	-1854(ra) # 58d8 <sleep>
}
    401e:	60e2                	ld	ra,24(sp)
    4020:	6442                	ld	s0,16(sp)
    4022:	64a2                	ld	s1,8(sp)
    4024:	6105                	addi	sp,sp,32
    4026:	8082                	ret
    printf("%s: fork failed", s);
    4028:	85a6                	mv	a1,s1
    402a:	00003517          	auipc	a0,0x3
    402e:	ace50513          	addi	a0,a0,-1330 # 6af8 <malloc+0xe7a>
    4032:	00002097          	auipc	ra,0x2
    4036:	b8e080e7          	jalr	-1138(ra) # 5bc0 <printf>
    exit(1);
    403a:	4505                	li	a0,1
    403c:	00002097          	auipc	ra,0x2
    4040:	80c080e7          	jalr	-2036(ra) # 5848 <exit>
      int fd = open("stopforking", 0);
    4044:	00004497          	auipc	s1,0x4
    4048:	b6448493          	addi	s1,s1,-1180 # 7ba8 <malloc+0x1f2a>
    404c:	4581                	li	a1,0
    404e:	8526                	mv	a0,s1
    4050:	00002097          	auipc	ra,0x2
    4054:	838080e7          	jalr	-1992(ra) # 5888 <open>
      if(fd >= 0){
    4058:	02055463          	bgez	a0,4080 <forkforkfork+0xc6>
      if(fork() < 0){
    405c:	00001097          	auipc	ra,0x1
    4060:	7e4080e7          	jalr	2020(ra) # 5840 <fork>
    4064:	fe0554e3          	bgez	a0,404c <forkforkfork+0x92>
        close(open("stopforking", O_CREATE|O_RDWR));
    4068:	20200593          	li	a1,514
    406c:	8526                	mv	a0,s1
    406e:	00002097          	auipc	ra,0x2
    4072:	81a080e7          	jalr	-2022(ra) # 5888 <open>
    4076:	00001097          	auipc	ra,0x1
    407a:	7fa080e7          	jalr	2042(ra) # 5870 <close>
    407e:	b7f9                	j	404c <forkforkfork+0x92>
        exit(0);
    4080:	4501                	li	a0,0
    4082:	00001097          	auipc	ra,0x1
    4086:	7c6080e7          	jalr	1990(ra) # 5848 <exit>

000000000000408a <killstatus>:
{
    408a:	7139                	addi	sp,sp,-64
    408c:	fc06                	sd	ra,56(sp)
    408e:	f822                	sd	s0,48(sp)
    4090:	f426                	sd	s1,40(sp)
    4092:	f04a                	sd	s2,32(sp)
    4094:	ec4e                	sd	s3,24(sp)
    4096:	e852                	sd	s4,16(sp)
    4098:	0080                	addi	s0,sp,64
    409a:	8a2a                	mv	s4,a0
    409c:	06400913          	li	s2,100
    if(xst != -1) {
    40a0:	59fd                	li	s3,-1
    int pid1 = fork();
    40a2:	00001097          	auipc	ra,0x1
    40a6:	79e080e7          	jalr	1950(ra) # 5840 <fork>
    40aa:	84aa                	mv	s1,a0
    if(pid1 < 0){
    40ac:	02054f63          	bltz	a0,40ea <killstatus+0x60>
    if(pid1 == 0){
    40b0:	c939                	beqz	a0,4106 <killstatus+0x7c>
    sleep(1);
    40b2:	4505                	li	a0,1
    40b4:	00002097          	auipc	ra,0x2
    40b8:	824080e7          	jalr	-2012(ra) # 58d8 <sleep>
    kill(pid1);
    40bc:	8526                	mv	a0,s1
    40be:	00001097          	auipc	ra,0x1
    40c2:	7ba080e7          	jalr	1978(ra) # 5878 <kill>
    wait(&xst);
    40c6:	fcc40513          	addi	a0,s0,-52
    40ca:	00001097          	auipc	ra,0x1
    40ce:	786080e7          	jalr	1926(ra) # 5850 <wait>
    if(xst != -1) {
    40d2:	fcc42783          	lw	a5,-52(s0)
    40d6:	03379d63          	bne	a5,s3,4110 <killstatus+0x86>
  for(int i = 0; i < 100; i++){
    40da:	397d                	addiw	s2,s2,-1
    40dc:	fc0913e3          	bnez	s2,40a2 <killstatus+0x18>
  exit(0);
    40e0:	4501                	li	a0,0
    40e2:	00001097          	auipc	ra,0x1
    40e6:	766080e7          	jalr	1894(ra) # 5848 <exit>
      printf("%s: fork failed\n", s);
    40ea:	85d2                	mv	a1,s4
    40ec:	00003517          	auipc	a0,0x3
    40f0:	84c50513          	addi	a0,a0,-1972 # 6938 <malloc+0xcba>
    40f4:	00002097          	auipc	ra,0x2
    40f8:	acc080e7          	jalr	-1332(ra) # 5bc0 <printf>
      exit(1);
    40fc:	4505                	li	a0,1
    40fe:	00001097          	auipc	ra,0x1
    4102:	74a080e7          	jalr	1866(ra) # 5848 <exit>
        getpid();
    4106:	00001097          	auipc	ra,0x1
    410a:	7c2080e7          	jalr	1986(ra) # 58c8 <getpid>
      while(1) {
    410e:	bfe5                	j	4106 <killstatus+0x7c>
       printf("%s: status should be -1\n", s);
    4110:	85d2                	mv	a1,s4
    4112:	00004517          	auipc	a0,0x4
    4116:	aa650513          	addi	a0,a0,-1370 # 7bb8 <malloc+0x1f3a>
    411a:	00002097          	auipc	ra,0x2
    411e:	aa6080e7          	jalr	-1370(ra) # 5bc0 <printf>
       exit(1);
    4122:	4505                	li	a0,1
    4124:	00001097          	auipc	ra,0x1
    4128:	724080e7          	jalr	1828(ra) # 5848 <exit>

000000000000412c <preempt>:
{
    412c:	7139                	addi	sp,sp,-64
    412e:	fc06                	sd	ra,56(sp)
    4130:	f822                	sd	s0,48(sp)
    4132:	f426                	sd	s1,40(sp)
    4134:	f04a                	sd	s2,32(sp)
    4136:	ec4e                	sd	s3,24(sp)
    4138:	e852                	sd	s4,16(sp)
    413a:	0080                	addi	s0,sp,64
    413c:	892a                	mv	s2,a0
  pid1 = fork();
    413e:	00001097          	auipc	ra,0x1
    4142:	702080e7          	jalr	1794(ra) # 5840 <fork>
  if(pid1 < 0) {
    4146:	00054563          	bltz	a0,4150 <preempt+0x24>
    414a:	84aa                	mv	s1,a0
  if(pid1 == 0)
    414c:	e105                	bnez	a0,416c <preempt+0x40>
    for(;;)
    414e:	a001                	j	414e <preempt+0x22>
    printf("%s: fork failed", s);
    4150:	85ca                	mv	a1,s2
    4152:	00003517          	auipc	a0,0x3
    4156:	9a650513          	addi	a0,a0,-1626 # 6af8 <malloc+0xe7a>
    415a:	00002097          	auipc	ra,0x2
    415e:	a66080e7          	jalr	-1434(ra) # 5bc0 <printf>
    exit(1);
    4162:	4505                	li	a0,1
    4164:	00001097          	auipc	ra,0x1
    4168:	6e4080e7          	jalr	1764(ra) # 5848 <exit>
  pid2 = fork();
    416c:	00001097          	auipc	ra,0x1
    4170:	6d4080e7          	jalr	1748(ra) # 5840 <fork>
    4174:	89aa                	mv	s3,a0
  if(pid2 < 0) {
    4176:	00054463          	bltz	a0,417e <preempt+0x52>
  if(pid2 == 0)
    417a:	e105                	bnez	a0,419a <preempt+0x6e>
    for(;;)
    417c:	a001                	j	417c <preempt+0x50>
    printf("%s: fork failed\n", s);
    417e:	85ca                	mv	a1,s2
    4180:	00002517          	auipc	a0,0x2
    4184:	7b850513          	addi	a0,a0,1976 # 6938 <malloc+0xcba>
    4188:	00002097          	auipc	ra,0x2
    418c:	a38080e7          	jalr	-1480(ra) # 5bc0 <printf>
    exit(1);
    4190:	4505                	li	a0,1
    4192:	00001097          	auipc	ra,0x1
    4196:	6b6080e7          	jalr	1718(ra) # 5848 <exit>
  pipe(pfds);
    419a:	fc840513          	addi	a0,s0,-56
    419e:	00001097          	auipc	ra,0x1
    41a2:	6ba080e7          	jalr	1722(ra) # 5858 <pipe>
  pid3 = fork();
    41a6:	00001097          	auipc	ra,0x1
    41aa:	69a080e7          	jalr	1690(ra) # 5840 <fork>
    41ae:	8a2a                	mv	s4,a0
  if(pid3 < 0) {
    41b0:	02054e63          	bltz	a0,41ec <preempt+0xc0>
  if(pid3 == 0){
    41b4:	e525                	bnez	a0,421c <preempt+0xf0>
    close(pfds[0]);
    41b6:	fc842503          	lw	a0,-56(s0)
    41ba:	00001097          	auipc	ra,0x1
    41be:	6b6080e7          	jalr	1718(ra) # 5870 <close>
    if(write(pfds[1], "x", 1) != 1)
    41c2:	4605                	li	a2,1
    41c4:	00002597          	auipc	a1,0x2
    41c8:	fac58593          	addi	a1,a1,-84 # 6170 <malloc+0x4f2>
    41cc:	fcc42503          	lw	a0,-52(s0)
    41d0:	00001097          	auipc	ra,0x1
    41d4:	698080e7          	jalr	1688(ra) # 5868 <write>
    41d8:	4785                	li	a5,1
    41da:	02f51763          	bne	a0,a5,4208 <preempt+0xdc>
    close(pfds[1]);
    41de:	fcc42503          	lw	a0,-52(s0)
    41e2:	00001097          	auipc	ra,0x1
    41e6:	68e080e7          	jalr	1678(ra) # 5870 <close>
    for(;;)
    41ea:	a001                	j	41ea <preempt+0xbe>
     printf("%s: fork failed\n", s);
    41ec:	85ca                	mv	a1,s2
    41ee:	00002517          	auipc	a0,0x2
    41f2:	74a50513          	addi	a0,a0,1866 # 6938 <malloc+0xcba>
    41f6:	00002097          	auipc	ra,0x2
    41fa:	9ca080e7          	jalr	-1590(ra) # 5bc0 <printf>
     exit(1);
    41fe:	4505                	li	a0,1
    4200:	00001097          	auipc	ra,0x1
    4204:	648080e7          	jalr	1608(ra) # 5848 <exit>
      printf("%s: preempt write error", s);
    4208:	85ca                	mv	a1,s2
    420a:	00004517          	auipc	a0,0x4
    420e:	9ce50513          	addi	a0,a0,-1586 # 7bd8 <malloc+0x1f5a>
    4212:	00002097          	auipc	ra,0x2
    4216:	9ae080e7          	jalr	-1618(ra) # 5bc0 <printf>
    421a:	b7d1                	j	41de <preempt+0xb2>
  close(pfds[1]);
    421c:	fcc42503          	lw	a0,-52(s0)
    4220:	00001097          	auipc	ra,0x1
    4224:	650080e7          	jalr	1616(ra) # 5870 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    4228:	660d                	lui	a2,0x3
    422a:	00008597          	auipc	a1,0x8
    422e:	b5e58593          	addi	a1,a1,-1186 # bd88 <buf>
    4232:	fc842503          	lw	a0,-56(s0)
    4236:	00001097          	auipc	ra,0x1
    423a:	62a080e7          	jalr	1578(ra) # 5860 <read>
    423e:	4785                	li	a5,1
    4240:	02f50363          	beq	a0,a5,4266 <preempt+0x13a>
    printf("%s: preempt read error", s);
    4244:	85ca                	mv	a1,s2
    4246:	00004517          	auipc	a0,0x4
    424a:	9aa50513          	addi	a0,a0,-1622 # 7bf0 <malloc+0x1f72>
    424e:	00002097          	auipc	ra,0x2
    4252:	972080e7          	jalr	-1678(ra) # 5bc0 <printf>
}
    4256:	70e2                	ld	ra,56(sp)
    4258:	7442                	ld	s0,48(sp)
    425a:	74a2                	ld	s1,40(sp)
    425c:	7902                	ld	s2,32(sp)
    425e:	69e2                	ld	s3,24(sp)
    4260:	6a42                	ld	s4,16(sp)
    4262:	6121                	addi	sp,sp,64
    4264:	8082                	ret
  close(pfds[0]);
    4266:	fc842503          	lw	a0,-56(s0)
    426a:	00001097          	auipc	ra,0x1
    426e:	606080e7          	jalr	1542(ra) # 5870 <close>
  printf("kill... ");
    4272:	00004517          	auipc	a0,0x4
    4276:	99650513          	addi	a0,a0,-1642 # 7c08 <malloc+0x1f8a>
    427a:	00002097          	auipc	ra,0x2
    427e:	946080e7          	jalr	-1722(ra) # 5bc0 <printf>
  kill(pid1);
    4282:	8526                	mv	a0,s1
    4284:	00001097          	auipc	ra,0x1
    4288:	5f4080e7          	jalr	1524(ra) # 5878 <kill>
  kill(pid2);
    428c:	854e                	mv	a0,s3
    428e:	00001097          	auipc	ra,0x1
    4292:	5ea080e7          	jalr	1514(ra) # 5878 <kill>
  kill(pid3);
    4296:	8552                	mv	a0,s4
    4298:	00001097          	auipc	ra,0x1
    429c:	5e0080e7          	jalr	1504(ra) # 5878 <kill>
  printf("wait... ");
    42a0:	00004517          	auipc	a0,0x4
    42a4:	97850513          	addi	a0,a0,-1672 # 7c18 <malloc+0x1f9a>
    42a8:	00002097          	auipc	ra,0x2
    42ac:	918080e7          	jalr	-1768(ra) # 5bc0 <printf>
  wait(0);
    42b0:	4501                	li	a0,0
    42b2:	00001097          	auipc	ra,0x1
    42b6:	59e080e7          	jalr	1438(ra) # 5850 <wait>
  wait(0);
    42ba:	4501                	li	a0,0
    42bc:	00001097          	auipc	ra,0x1
    42c0:	594080e7          	jalr	1428(ra) # 5850 <wait>
  wait(0);
    42c4:	4501                	li	a0,0
    42c6:	00001097          	auipc	ra,0x1
    42ca:	58a080e7          	jalr	1418(ra) # 5850 <wait>
    42ce:	b761                	j	4256 <preempt+0x12a>

00000000000042d0 <reparent>:
{
    42d0:	7179                	addi	sp,sp,-48
    42d2:	f406                	sd	ra,40(sp)
    42d4:	f022                	sd	s0,32(sp)
    42d6:	ec26                	sd	s1,24(sp)
    42d8:	e84a                	sd	s2,16(sp)
    42da:	e44e                	sd	s3,8(sp)
    42dc:	e052                	sd	s4,0(sp)
    42de:	1800                	addi	s0,sp,48
    42e0:	89aa                	mv	s3,a0
  int master_pid = getpid();
    42e2:	00001097          	auipc	ra,0x1
    42e6:	5e6080e7          	jalr	1510(ra) # 58c8 <getpid>
    42ea:	8a2a                	mv	s4,a0
    42ec:	0c800913          	li	s2,200
    int pid = fork();
    42f0:	00001097          	auipc	ra,0x1
    42f4:	550080e7          	jalr	1360(ra) # 5840 <fork>
    42f8:	84aa                	mv	s1,a0
    if(pid < 0){
    42fa:	02054263          	bltz	a0,431e <reparent+0x4e>
    if(pid){
    42fe:	cd21                	beqz	a0,4356 <reparent+0x86>
      if(wait(0) != pid){
    4300:	4501                	li	a0,0
    4302:	00001097          	auipc	ra,0x1
    4306:	54e080e7          	jalr	1358(ra) # 5850 <wait>
    430a:	02951863          	bne	a0,s1,433a <reparent+0x6a>
  for(int i = 0; i < 200; i++){
    430e:	397d                	addiw	s2,s2,-1
    4310:	fe0910e3          	bnez	s2,42f0 <reparent+0x20>
  exit(0);
    4314:	4501                	li	a0,0
    4316:	00001097          	auipc	ra,0x1
    431a:	532080e7          	jalr	1330(ra) # 5848 <exit>
      printf("%s: fork failed\n", s);
    431e:	85ce                	mv	a1,s3
    4320:	00002517          	auipc	a0,0x2
    4324:	61850513          	addi	a0,a0,1560 # 6938 <malloc+0xcba>
    4328:	00002097          	auipc	ra,0x2
    432c:	898080e7          	jalr	-1896(ra) # 5bc0 <printf>
      exit(1);
    4330:	4505                	li	a0,1
    4332:	00001097          	auipc	ra,0x1
    4336:	516080e7          	jalr	1302(ra) # 5848 <exit>
        printf("%s: wait wrong pid\n", s);
    433a:	85ce                	mv	a1,s3
    433c:	00002517          	auipc	a0,0x2
    4340:	78450513          	addi	a0,a0,1924 # 6ac0 <malloc+0xe42>
    4344:	00002097          	auipc	ra,0x2
    4348:	87c080e7          	jalr	-1924(ra) # 5bc0 <printf>
        exit(1);
    434c:	4505                	li	a0,1
    434e:	00001097          	auipc	ra,0x1
    4352:	4fa080e7          	jalr	1274(ra) # 5848 <exit>
      int pid2 = fork();
    4356:	00001097          	auipc	ra,0x1
    435a:	4ea080e7          	jalr	1258(ra) # 5840 <fork>
      if(pid2 < 0){
    435e:	00054763          	bltz	a0,436c <reparent+0x9c>
      exit(0);
    4362:	4501                	li	a0,0
    4364:	00001097          	auipc	ra,0x1
    4368:	4e4080e7          	jalr	1252(ra) # 5848 <exit>
        kill(master_pid);
    436c:	8552                	mv	a0,s4
    436e:	00001097          	auipc	ra,0x1
    4372:	50a080e7          	jalr	1290(ra) # 5878 <kill>
        exit(1);
    4376:	4505                	li	a0,1
    4378:	00001097          	auipc	ra,0x1
    437c:	4d0080e7          	jalr	1232(ra) # 5848 <exit>

0000000000004380 <sbrkfail>:
{
    4380:	7119                	addi	sp,sp,-128
    4382:	fc86                	sd	ra,120(sp)
    4384:	f8a2                	sd	s0,112(sp)
    4386:	f4a6                	sd	s1,104(sp)
    4388:	f0ca                	sd	s2,96(sp)
    438a:	ecce                	sd	s3,88(sp)
    438c:	e8d2                	sd	s4,80(sp)
    438e:	e4d6                	sd	s5,72(sp)
    4390:	0100                	addi	s0,sp,128
    4392:	8aaa                	mv	s5,a0
  if(pipe(fds) != 0){
    4394:	fb040513          	addi	a0,s0,-80
    4398:	00001097          	auipc	ra,0x1
    439c:	4c0080e7          	jalr	1216(ra) # 5858 <pipe>
    43a0:	e901                	bnez	a0,43b0 <sbrkfail+0x30>
    43a2:	f8040493          	addi	s1,s0,-128
    43a6:	fa840993          	addi	s3,s0,-88
    43aa:	8926                	mv	s2,s1
    if(pids[i] != -1)
    43ac:	5a7d                	li	s4,-1
    43ae:	a085                	j	440e <sbrkfail+0x8e>
    printf("%s: pipe() failed\n", s);
    43b0:	85d6                	mv	a1,s5
    43b2:	00002517          	auipc	a0,0x2
    43b6:	68e50513          	addi	a0,a0,1678 # 6a40 <malloc+0xdc2>
    43ba:	00002097          	auipc	ra,0x2
    43be:	806080e7          	jalr	-2042(ra) # 5bc0 <printf>
    exit(1);
    43c2:	4505                	li	a0,1
    43c4:	00001097          	auipc	ra,0x1
    43c8:	484080e7          	jalr	1156(ra) # 5848 <exit>
      sbrk(BIG - (uint64)sbrk(0));
    43cc:	00001097          	auipc	ra,0x1
    43d0:	504080e7          	jalr	1284(ra) # 58d0 <sbrk>
    43d4:	064007b7          	lui	a5,0x6400
    43d8:	40a7853b          	subw	a0,a5,a0
    43dc:	00001097          	auipc	ra,0x1
    43e0:	4f4080e7          	jalr	1268(ra) # 58d0 <sbrk>
      write(fds[1], "x", 1);
    43e4:	4605                	li	a2,1
    43e6:	00002597          	auipc	a1,0x2
    43ea:	d8a58593          	addi	a1,a1,-630 # 6170 <malloc+0x4f2>
    43ee:	fb442503          	lw	a0,-76(s0)
    43f2:	00001097          	auipc	ra,0x1
    43f6:	476080e7          	jalr	1142(ra) # 5868 <write>
      for(;;) sleep(1000);
    43fa:	3e800513          	li	a0,1000
    43fe:	00001097          	auipc	ra,0x1
    4402:	4da080e7          	jalr	1242(ra) # 58d8 <sleep>
    4406:	bfd5                	j	43fa <sbrkfail+0x7a>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    4408:	0911                	addi	s2,s2,4
    440a:	03390563          	beq	s2,s3,4434 <sbrkfail+0xb4>
    if((pids[i] = fork()) == 0){
    440e:	00001097          	auipc	ra,0x1
    4412:	432080e7          	jalr	1074(ra) # 5840 <fork>
    4416:	00a92023          	sw	a0,0(s2)
    441a:	d94d                	beqz	a0,43cc <sbrkfail+0x4c>
    if(pids[i] != -1)
    441c:	ff4506e3          	beq	a0,s4,4408 <sbrkfail+0x88>
      read(fds[0], &scratch, 1);
    4420:	4605                	li	a2,1
    4422:	faf40593          	addi	a1,s0,-81
    4426:	fb042503          	lw	a0,-80(s0)
    442a:	00001097          	auipc	ra,0x1
    442e:	436080e7          	jalr	1078(ra) # 5860 <read>
    4432:	bfd9                	j	4408 <sbrkfail+0x88>
  c = sbrk(PGSIZE);
    4434:	6505                	lui	a0,0x1
    4436:	00001097          	auipc	ra,0x1
    443a:	49a080e7          	jalr	1178(ra) # 58d0 <sbrk>
    443e:	8a2a                	mv	s4,a0
    if(pids[i] == -1)
    4440:	597d                	li	s2,-1
    4442:	a021                	j	444a <sbrkfail+0xca>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    4444:	0491                	addi	s1,s1,4
    4446:	01348f63          	beq	s1,s3,4464 <sbrkfail+0xe4>
    if(pids[i] == -1)
    444a:	4088                	lw	a0,0(s1)
    444c:	ff250ce3          	beq	a0,s2,4444 <sbrkfail+0xc4>
    kill(pids[i]);
    4450:	00001097          	auipc	ra,0x1
    4454:	428080e7          	jalr	1064(ra) # 5878 <kill>
    wait(0);
    4458:	4501                	li	a0,0
    445a:	00001097          	auipc	ra,0x1
    445e:	3f6080e7          	jalr	1014(ra) # 5850 <wait>
    4462:	b7cd                	j	4444 <sbrkfail+0xc4>
  if(c == (char*)0xffffffffffffffffL){
    4464:	57fd                	li	a5,-1
    4466:	04fa0163          	beq	s4,a5,44a8 <sbrkfail+0x128>
  pid = fork();
    446a:	00001097          	auipc	ra,0x1
    446e:	3d6080e7          	jalr	982(ra) # 5840 <fork>
    4472:	84aa                	mv	s1,a0
  if(pid < 0){
    4474:	04054863          	bltz	a0,44c4 <sbrkfail+0x144>
  if(pid == 0){
    4478:	c525                	beqz	a0,44e0 <sbrkfail+0x160>
  wait(&xstatus);
    447a:	fbc40513          	addi	a0,s0,-68
    447e:	00001097          	auipc	ra,0x1
    4482:	3d2080e7          	jalr	978(ra) # 5850 <wait>
  if(xstatus != -1 && xstatus != 2)
    4486:	fbc42783          	lw	a5,-68(s0)
    448a:	577d                	li	a4,-1
    448c:	00e78563          	beq	a5,a4,4496 <sbrkfail+0x116>
    4490:	4709                	li	a4,2
    4492:	08e79d63          	bne	a5,a4,452c <sbrkfail+0x1ac>
}
    4496:	70e6                	ld	ra,120(sp)
    4498:	7446                	ld	s0,112(sp)
    449a:	74a6                	ld	s1,104(sp)
    449c:	7906                	ld	s2,96(sp)
    449e:	69e6                	ld	s3,88(sp)
    44a0:	6a46                	ld	s4,80(sp)
    44a2:	6aa6                	ld	s5,72(sp)
    44a4:	6109                	addi	sp,sp,128
    44a6:	8082                	ret
    printf("%s: failed sbrk leaked memory\n", s);
    44a8:	85d6                	mv	a1,s5
    44aa:	00003517          	auipc	a0,0x3
    44ae:	77e50513          	addi	a0,a0,1918 # 7c28 <malloc+0x1faa>
    44b2:	00001097          	auipc	ra,0x1
    44b6:	70e080e7          	jalr	1806(ra) # 5bc0 <printf>
    exit(1);
    44ba:	4505                	li	a0,1
    44bc:	00001097          	auipc	ra,0x1
    44c0:	38c080e7          	jalr	908(ra) # 5848 <exit>
    printf("%s: fork failed\n", s);
    44c4:	85d6                	mv	a1,s5
    44c6:	00002517          	auipc	a0,0x2
    44ca:	47250513          	addi	a0,a0,1138 # 6938 <malloc+0xcba>
    44ce:	00001097          	auipc	ra,0x1
    44d2:	6f2080e7          	jalr	1778(ra) # 5bc0 <printf>
    exit(1);
    44d6:	4505                	li	a0,1
    44d8:	00001097          	auipc	ra,0x1
    44dc:	370080e7          	jalr	880(ra) # 5848 <exit>
    a = sbrk(0);
    44e0:	4501                	li	a0,0
    44e2:	00001097          	auipc	ra,0x1
    44e6:	3ee080e7          	jalr	1006(ra) # 58d0 <sbrk>
    44ea:	892a                	mv	s2,a0
    sbrk(10*BIG);
    44ec:	3e800537          	lui	a0,0x3e800
    44f0:	00001097          	auipc	ra,0x1
    44f4:	3e0080e7          	jalr	992(ra) # 58d0 <sbrk>
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    44f8:	87ca                	mv	a5,s2
    44fa:	3e800737          	lui	a4,0x3e800
    44fe:	993a                	add	s2,s2,a4
    4500:	6705                	lui	a4,0x1
      n += *(a+i);
    4502:	0007c683          	lbu	a3,0(a5) # 6400000 <__BSS_END__+0x63f1268>
    4506:	9cb5                	addw	s1,s1,a3
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    4508:	97ba                	add	a5,a5,a4
    450a:	ff279ce3          	bne	a5,s2,4502 <sbrkfail+0x182>
    printf("%s: allocate a lot of memory succeeded %d\n", s, n);
    450e:	8626                	mv	a2,s1
    4510:	85d6                	mv	a1,s5
    4512:	00003517          	auipc	a0,0x3
    4516:	73650513          	addi	a0,a0,1846 # 7c48 <malloc+0x1fca>
    451a:	00001097          	auipc	ra,0x1
    451e:	6a6080e7          	jalr	1702(ra) # 5bc0 <printf>
    exit(1);
    4522:	4505                	li	a0,1
    4524:	00001097          	auipc	ra,0x1
    4528:	324080e7          	jalr	804(ra) # 5848 <exit>
    exit(1);
    452c:	4505                	li	a0,1
    452e:	00001097          	auipc	ra,0x1
    4532:	31a080e7          	jalr	794(ra) # 5848 <exit>

0000000000004536 <mem>:
{
    4536:	7139                	addi	sp,sp,-64
    4538:	fc06                	sd	ra,56(sp)
    453a:	f822                	sd	s0,48(sp)
    453c:	f426                	sd	s1,40(sp)
    453e:	f04a                	sd	s2,32(sp)
    4540:	ec4e                	sd	s3,24(sp)
    4542:	0080                	addi	s0,sp,64
    4544:	89aa                	mv	s3,a0
  if((pid = fork()) == 0){
    4546:	00001097          	auipc	ra,0x1
    454a:	2fa080e7          	jalr	762(ra) # 5840 <fork>
    m1 = 0;
    454e:	4481                	li	s1,0
    while((m2 = malloc(10001)) != 0){
    4550:	6909                	lui	s2,0x2
    4552:	71190913          	addi	s2,s2,1809 # 2711 <sbrkbasic+0xab>
  if((pid = fork()) == 0){
    4556:	c115                	beqz	a0,457a <mem+0x44>
    wait(&xstatus);
    4558:	fcc40513          	addi	a0,s0,-52
    455c:	00001097          	auipc	ra,0x1
    4560:	2f4080e7          	jalr	756(ra) # 5850 <wait>
    if(xstatus == -1){
    4564:	fcc42503          	lw	a0,-52(s0)
    4568:	57fd                	li	a5,-1
    456a:	06f50363          	beq	a0,a5,45d0 <mem+0x9a>
    exit(xstatus);
    456e:	00001097          	auipc	ra,0x1
    4572:	2da080e7          	jalr	730(ra) # 5848 <exit>
      *(char**)m2 = m1;
    4576:	e104                	sd	s1,0(a0)
      m1 = m2;
    4578:	84aa                	mv	s1,a0
    while((m2 = malloc(10001)) != 0){
    457a:	854a                	mv	a0,s2
    457c:	00001097          	auipc	ra,0x1
    4580:	702080e7          	jalr	1794(ra) # 5c7e <malloc>
    4584:	f96d                	bnez	a0,4576 <mem+0x40>
    while(m1){
    4586:	c881                	beqz	s1,4596 <mem+0x60>
      m2 = *(char**)m1;
    4588:	8526                	mv	a0,s1
    458a:	6084                	ld	s1,0(s1)
      free(m1);
    458c:	00001097          	auipc	ra,0x1
    4590:	66a080e7          	jalr	1642(ra) # 5bf6 <free>
    while(m1){
    4594:	f8f5                	bnez	s1,4588 <mem+0x52>
    m1 = malloc(1024*20);
    4596:	6515                	lui	a0,0x5
    4598:	00001097          	auipc	ra,0x1
    459c:	6e6080e7          	jalr	1766(ra) # 5c7e <malloc>
    if(m1 == 0){
    45a0:	c911                	beqz	a0,45b4 <mem+0x7e>
    free(m1);
    45a2:	00001097          	auipc	ra,0x1
    45a6:	654080e7          	jalr	1620(ra) # 5bf6 <free>
    exit(0);
    45aa:	4501                	li	a0,0
    45ac:	00001097          	auipc	ra,0x1
    45b0:	29c080e7          	jalr	668(ra) # 5848 <exit>
      printf("couldn't allocate mem?!!\n", s);
    45b4:	85ce                	mv	a1,s3
    45b6:	00003517          	auipc	a0,0x3
    45ba:	6c250513          	addi	a0,a0,1730 # 7c78 <malloc+0x1ffa>
    45be:	00001097          	auipc	ra,0x1
    45c2:	602080e7          	jalr	1538(ra) # 5bc0 <printf>
      exit(1);
    45c6:	4505                	li	a0,1
    45c8:	00001097          	auipc	ra,0x1
    45cc:	280080e7          	jalr	640(ra) # 5848 <exit>
      exit(0);
    45d0:	4501                	li	a0,0
    45d2:	00001097          	auipc	ra,0x1
    45d6:	276080e7          	jalr	630(ra) # 5848 <exit>

00000000000045da <sharedfd>:
{
    45da:	7159                	addi	sp,sp,-112
    45dc:	f486                	sd	ra,104(sp)
    45de:	f0a2                	sd	s0,96(sp)
    45e0:	eca6                	sd	s1,88(sp)
    45e2:	e8ca                	sd	s2,80(sp)
    45e4:	e4ce                	sd	s3,72(sp)
    45e6:	e0d2                	sd	s4,64(sp)
    45e8:	fc56                	sd	s5,56(sp)
    45ea:	f85a                	sd	s6,48(sp)
    45ec:	f45e                	sd	s7,40(sp)
    45ee:	1880                	addi	s0,sp,112
    45f0:	8a2a                	mv	s4,a0
  unlink("sharedfd");
    45f2:	00002517          	auipc	a0,0x2
    45f6:	91e50513          	addi	a0,a0,-1762 # 5f10 <malloc+0x292>
    45fa:	00001097          	auipc	ra,0x1
    45fe:	29e080e7          	jalr	670(ra) # 5898 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    4602:	20200593          	li	a1,514
    4606:	00002517          	auipc	a0,0x2
    460a:	90a50513          	addi	a0,a0,-1782 # 5f10 <malloc+0x292>
    460e:	00001097          	auipc	ra,0x1
    4612:	27a080e7          	jalr	634(ra) # 5888 <open>
  if(fd < 0){
    4616:	04054a63          	bltz	a0,466a <sharedfd+0x90>
    461a:	892a                	mv	s2,a0
  pid = fork();
    461c:	00001097          	auipc	ra,0x1
    4620:	224080e7          	jalr	548(ra) # 5840 <fork>
    4624:	89aa                	mv	s3,a0
  memset(buf, pid==0?'c':'p', sizeof(buf));
    4626:	06300593          	li	a1,99
    462a:	c119                	beqz	a0,4630 <sharedfd+0x56>
    462c:	07000593          	li	a1,112
    4630:	4629                	li	a2,10
    4632:	fa040513          	addi	a0,s0,-96
    4636:	00001097          	auipc	ra,0x1
    463a:	016080e7          	jalr	22(ra) # 564c <memset>
    463e:	3e800493          	li	s1,1000
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    4642:	4629                	li	a2,10
    4644:	fa040593          	addi	a1,s0,-96
    4648:	854a                	mv	a0,s2
    464a:	00001097          	auipc	ra,0x1
    464e:	21e080e7          	jalr	542(ra) # 5868 <write>
    4652:	47a9                	li	a5,10
    4654:	02f51963          	bne	a0,a5,4686 <sharedfd+0xac>
  for(i = 0; i < N; i++){
    4658:	34fd                	addiw	s1,s1,-1
    465a:	f4e5                	bnez	s1,4642 <sharedfd+0x68>
  if(pid == 0) {
    465c:	04099363          	bnez	s3,46a2 <sharedfd+0xc8>
    exit(0);
    4660:	4501                	li	a0,0
    4662:	00001097          	auipc	ra,0x1
    4666:	1e6080e7          	jalr	486(ra) # 5848 <exit>
    printf("%s: cannot open sharedfd for writing", s);
    466a:	85d2                	mv	a1,s4
    466c:	00003517          	auipc	a0,0x3
    4670:	62c50513          	addi	a0,a0,1580 # 7c98 <malloc+0x201a>
    4674:	00001097          	auipc	ra,0x1
    4678:	54c080e7          	jalr	1356(ra) # 5bc0 <printf>
    exit(1);
    467c:	4505                	li	a0,1
    467e:	00001097          	auipc	ra,0x1
    4682:	1ca080e7          	jalr	458(ra) # 5848 <exit>
      printf("%s: write sharedfd failed\n", s);
    4686:	85d2                	mv	a1,s4
    4688:	00003517          	auipc	a0,0x3
    468c:	63850513          	addi	a0,a0,1592 # 7cc0 <malloc+0x2042>
    4690:	00001097          	auipc	ra,0x1
    4694:	530080e7          	jalr	1328(ra) # 5bc0 <printf>
      exit(1);
    4698:	4505                	li	a0,1
    469a:	00001097          	auipc	ra,0x1
    469e:	1ae080e7          	jalr	430(ra) # 5848 <exit>
    wait(&xstatus);
    46a2:	f9c40513          	addi	a0,s0,-100
    46a6:	00001097          	auipc	ra,0x1
    46aa:	1aa080e7          	jalr	426(ra) # 5850 <wait>
    if(xstatus != 0)
    46ae:	f9c42983          	lw	s3,-100(s0)
    46b2:	00098763          	beqz	s3,46c0 <sharedfd+0xe6>
      exit(xstatus);
    46b6:	854e                	mv	a0,s3
    46b8:	00001097          	auipc	ra,0x1
    46bc:	190080e7          	jalr	400(ra) # 5848 <exit>
  close(fd);
    46c0:	854a                	mv	a0,s2
    46c2:	00001097          	auipc	ra,0x1
    46c6:	1ae080e7          	jalr	430(ra) # 5870 <close>
  fd = open("sharedfd", 0);
    46ca:	4581                	li	a1,0
    46cc:	00002517          	auipc	a0,0x2
    46d0:	84450513          	addi	a0,a0,-1980 # 5f10 <malloc+0x292>
    46d4:	00001097          	auipc	ra,0x1
    46d8:	1b4080e7          	jalr	436(ra) # 5888 <open>
    46dc:	8baa                	mv	s7,a0
  nc = np = 0;
    46de:	8ace                	mv	s5,s3
  if(fd < 0){
    46e0:	02054563          	bltz	a0,470a <sharedfd+0x130>
    46e4:	faa40913          	addi	s2,s0,-86
      if(buf[i] == 'c')
    46e8:	06300493          	li	s1,99
      if(buf[i] == 'p')
    46ec:	07000b13          	li	s6,112
  while((n = read(fd, buf, sizeof(buf))) > 0){
    46f0:	4629                	li	a2,10
    46f2:	fa040593          	addi	a1,s0,-96
    46f6:	855e                	mv	a0,s7
    46f8:	00001097          	auipc	ra,0x1
    46fc:	168080e7          	jalr	360(ra) # 5860 <read>
    4700:	02a05f63          	blez	a0,473e <sharedfd+0x164>
    4704:	fa040793          	addi	a5,s0,-96
    4708:	a01d                	j	472e <sharedfd+0x154>
    printf("%s: cannot open sharedfd for reading\n", s);
    470a:	85d2                	mv	a1,s4
    470c:	00003517          	auipc	a0,0x3
    4710:	5d450513          	addi	a0,a0,1492 # 7ce0 <malloc+0x2062>
    4714:	00001097          	auipc	ra,0x1
    4718:	4ac080e7          	jalr	1196(ra) # 5bc0 <printf>
    exit(1);
    471c:	4505                	li	a0,1
    471e:	00001097          	auipc	ra,0x1
    4722:	12a080e7          	jalr	298(ra) # 5848 <exit>
        nc++;
    4726:	2985                	addiw	s3,s3,1
    for(i = 0; i < sizeof(buf); i++){
    4728:	0785                	addi	a5,a5,1
    472a:	fd2783e3          	beq	a5,s2,46f0 <sharedfd+0x116>
      if(buf[i] == 'c')
    472e:	0007c703          	lbu	a4,0(a5)
    4732:	fe970ae3          	beq	a4,s1,4726 <sharedfd+0x14c>
      if(buf[i] == 'p')
    4736:	ff6719e3          	bne	a4,s6,4728 <sharedfd+0x14e>
        np++;
    473a:	2a85                	addiw	s5,s5,1
    473c:	b7f5                	j	4728 <sharedfd+0x14e>
  close(fd);
    473e:	855e                	mv	a0,s7
    4740:	00001097          	auipc	ra,0x1
    4744:	130080e7          	jalr	304(ra) # 5870 <close>
  unlink("sharedfd");
    4748:	00001517          	auipc	a0,0x1
    474c:	7c850513          	addi	a0,a0,1992 # 5f10 <malloc+0x292>
    4750:	00001097          	auipc	ra,0x1
    4754:	148080e7          	jalr	328(ra) # 5898 <unlink>
  if(nc == N*SZ && np == N*SZ){
    4758:	6789                	lui	a5,0x2
    475a:	71078793          	addi	a5,a5,1808 # 2710 <sbrkbasic+0xaa>
    475e:	00f99763          	bne	s3,a5,476c <sharedfd+0x192>
    4762:	6789                	lui	a5,0x2
    4764:	71078793          	addi	a5,a5,1808 # 2710 <sbrkbasic+0xaa>
    4768:	02fa8063          	beq	s5,a5,4788 <sharedfd+0x1ae>
    printf("%s: nc/np test fails\n", s);
    476c:	85d2                	mv	a1,s4
    476e:	00003517          	auipc	a0,0x3
    4772:	59a50513          	addi	a0,a0,1434 # 7d08 <malloc+0x208a>
    4776:	00001097          	auipc	ra,0x1
    477a:	44a080e7          	jalr	1098(ra) # 5bc0 <printf>
    exit(1);
    477e:	4505                	li	a0,1
    4780:	00001097          	auipc	ra,0x1
    4784:	0c8080e7          	jalr	200(ra) # 5848 <exit>
    exit(0);
    4788:	4501                	li	a0,0
    478a:	00001097          	auipc	ra,0x1
    478e:	0be080e7          	jalr	190(ra) # 5848 <exit>

0000000000004792 <fourfiles>:
{
    4792:	7171                	addi	sp,sp,-176
    4794:	f506                	sd	ra,168(sp)
    4796:	f122                	sd	s0,160(sp)
    4798:	ed26                	sd	s1,152(sp)
    479a:	e94a                	sd	s2,144(sp)
    479c:	e54e                	sd	s3,136(sp)
    479e:	e152                	sd	s4,128(sp)
    47a0:	fcd6                	sd	s5,120(sp)
    47a2:	f8da                	sd	s6,112(sp)
    47a4:	f4de                	sd	s7,104(sp)
    47a6:	f0e2                	sd	s8,96(sp)
    47a8:	ece6                	sd	s9,88(sp)
    47aa:	e8ea                	sd	s10,80(sp)
    47ac:	e4ee                	sd	s11,72(sp)
    47ae:	1900                	addi	s0,sp,176
    47b0:	f4a43c23          	sd	a0,-168(s0)
  char *names[] = { "f0", "f1", "f2", "f3" };
    47b4:	00001797          	auipc	a5,0x1
    47b8:	5b478793          	addi	a5,a5,1460 # 5d68 <malloc+0xea>
    47bc:	f6f43823          	sd	a5,-144(s0)
    47c0:	00001797          	auipc	a5,0x1
    47c4:	5b078793          	addi	a5,a5,1456 # 5d70 <malloc+0xf2>
    47c8:	f6f43c23          	sd	a5,-136(s0)
    47cc:	00001797          	auipc	a5,0x1
    47d0:	5ac78793          	addi	a5,a5,1452 # 5d78 <malloc+0xfa>
    47d4:	f8f43023          	sd	a5,-128(s0)
    47d8:	00001797          	auipc	a5,0x1
    47dc:	5a878793          	addi	a5,a5,1448 # 5d80 <malloc+0x102>
    47e0:	f8f43423          	sd	a5,-120(s0)
  for(pi = 0; pi < NCHILD; pi++){
    47e4:	f7040c13          	addi	s8,s0,-144
  char *names[] = { "f0", "f1", "f2", "f3" };
    47e8:	8962                	mv	s2,s8
  for(pi = 0; pi < NCHILD; pi++){
    47ea:	4481                	li	s1,0
    47ec:	4a11                	li	s4,4
    fname = names[pi];
    47ee:	00093983          	ld	s3,0(s2)
    unlink(fname);
    47f2:	854e                	mv	a0,s3
    47f4:	00001097          	auipc	ra,0x1
    47f8:	0a4080e7          	jalr	164(ra) # 5898 <unlink>
    pid = fork();
    47fc:	00001097          	auipc	ra,0x1
    4800:	044080e7          	jalr	68(ra) # 5840 <fork>
    if(pid < 0){
    4804:	04054463          	bltz	a0,484c <fourfiles+0xba>
    if(pid == 0){
    4808:	c12d                	beqz	a0,486a <fourfiles+0xd8>
  for(pi = 0; pi < NCHILD; pi++){
    480a:	2485                	addiw	s1,s1,1
    480c:	0921                	addi	s2,s2,8
    480e:	ff4490e3          	bne	s1,s4,47ee <fourfiles+0x5c>
    4812:	4491                	li	s1,4
    wait(&xstatus);
    4814:	f6c40513          	addi	a0,s0,-148
    4818:	00001097          	auipc	ra,0x1
    481c:	038080e7          	jalr	56(ra) # 5850 <wait>
    if(xstatus != 0)
    4820:	f6c42b03          	lw	s6,-148(s0)
    4824:	0c0b1e63          	bnez	s6,4900 <fourfiles+0x16e>
  for(pi = 0; pi < NCHILD; pi++){
    4828:	34fd                	addiw	s1,s1,-1
    482a:	f4ed                	bnez	s1,4814 <fourfiles+0x82>
    482c:	03000b93          	li	s7,48
    while((n = read(fd, buf, sizeof(buf))) > 0){
    4830:	00007a17          	auipc	s4,0x7
    4834:	558a0a13          	addi	s4,s4,1368 # bd88 <buf>
    4838:	00007a97          	auipc	s5,0x7
    483c:	551a8a93          	addi	s5,s5,1361 # bd89 <buf+0x1>
    if(total != N*SZ){
    4840:	6d85                	lui	s11,0x1
    4842:	770d8d93          	addi	s11,s11,1904 # 1770 <pipe1+0x32>
  for(i = 0; i < NCHILD; i++){
    4846:	03400d13          	li	s10,52
    484a:	aa1d                	j	4980 <fourfiles+0x1ee>
      printf("fork failed\n", s);
    484c:	f5843583          	ld	a1,-168(s0)
    4850:	00002517          	auipc	a0,0x2
    4854:	50850513          	addi	a0,a0,1288 # 6d58 <malloc+0x10da>
    4858:	00001097          	auipc	ra,0x1
    485c:	368080e7          	jalr	872(ra) # 5bc0 <printf>
      exit(1);
    4860:	4505                	li	a0,1
    4862:	00001097          	auipc	ra,0x1
    4866:	fe6080e7          	jalr	-26(ra) # 5848 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    486a:	20200593          	li	a1,514
    486e:	854e                	mv	a0,s3
    4870:	00001097          	auipc	ra,0x1
    4874:	018080e7          	jalr	24(ra) # 5888 <open>
    4878:	892a                	mv	s2,a0
      if(fd < 0){
    487a:	04054763          	bltz	a0,48c8 <fourfiles+0x136>
      memset(buf, '0'+pi, SZ);
    487e:	1f400613          	li	a2,500
    4882:	0304859b          	addiw	a1,s1,48
    4886:	00007517          	auipc	a0,0x7
    488a:	50250513          	addi	a0,a0,1282 # bd88 <buf>
    488e:	00001097          	auipc	ra,0x1
    4892:	dbe080e7          	jalr	-578(ra) # 564c <memset>
    4896:	44b1                	li	s1,12
        if((n = write(fd, buf, SZ)) != SZ){
    4898:	00007997          	auipc	s3,0x7
    489c:	4f098993          	addi	s3,s3,1264 # bd88 <buf>
    48a0:	1f400613          	li	a2,500
    48a4:	85ce                	mv	a1,s3
    48a6:	854a                	mv	a0,s2
    48a8:	00001097          	auipc	ra,0x1
    48ac:	fc0080e7          	jalr	-64(ra) # 5868 <write>
    48b0:	85aa                	mv	a1,a0
    48b2:	1f400793          	li	a5,500
    48b6:	02f51863          	bne	a0,a5,48e6 <fourfiles+0x154>
      for(i = 0; i < N; i++){
    48ba:	34fd                	addiw	s1,s1,-1
    48bc:	f0f5                	bnez	s1,48a0 <fourfiles+0x10e>
      exit(0);
    48be:	4501                	li	a0,0
    48c0:	00001097          	auipc	ra,0x1
    48c4:	f88080e7          	jalr	-120(ra) # 5848 <exit>
        printf("create failed\n", s);
    48c8:	f5843583          	ld	a1,-168(s0)
    48cc:	00003517          	auipc	a0,0x3
    48d0:	45450513          	addi	a0,a0,1108 # 7d20 <malloc+0x20a2>
    48d4:	00001097          	auipc	ra,0x1
    48d8:	2ec080e7          	jalr	748(ra) # 5bc0 <printf>
        exit(1);
    48dc:	4505                	li	a0,1
    48de:	00001097          	auipc	ra,0x1
    48e2:	f6a080e7          	jalr	-150(ra) # 5848 <exit>
          printf("write failed %d\n", n);
    48e6:	00003517          	auipc	a0,0x3
    48ea:	44a50513          	addi	a0,a0,1098 # 7d30 <malloc+0x20b2>
    48ee:	00001097          	auipc	ra,0x1
    48f2:	2d2080e7          	jalr	722(ra) # 5bc0 <printf>
          exit(1);
    48f6:	4505                	li	a0,1
    48f8:	00001097          	auipc	ra,0x1
    48fc:	f50080e7          	jalr	-176(ra) # 5848 <exit>
      exit(xstatus);
    4900:	855a                	mv	a0,s6
    4902:	00001097          	auipc	ra,0x1
    4906:	f46080e7          	jalr	-186(ra) # 5848 <exit>
          printf("wrong char\n", s);
    490a:	f5843583          	ld	a1,-168(s0)
    490e:	00003517          	auipc	a0,0x3
    4912:	43a50513          	addi	a0,a0,1082 # 7d48 <malloc+0x20ca>
    4916:	00001097          	auipc	ra,0x1
    491a:	2aa080e7          	jalr	682(ra) # 5bc0 <printf>
          exit(1);
    491e:	4505                	li	a0,1
    4920:	00001097          	auipc	ra,0x1
    4924:	f28080e7          	jalr	-216(ra) # 5848 <exit>
      total += n;
    4928:	00a9093b          	addw	s2,s2,a0
    while((n = read(fd, buf, sizeof(buf))) > 0){
    492c:	660d                	lui	a2,0x3
    492e:	85d2                	mv	a1,s4
    4930:	854e                	mv	a0,s3
    4932:	00001097          	auipc	ra,0x1
    4936:	f2e080e7          	jalr	-210(ra) # 5860 <read>
    493a:	02a05363          	blez	a0,4960 <fourfiles+0x1ce>
    493e:	00007797          	auipc	a5,0x7
    4942:	44a78793          	addi	a5,a5,1098 # bd88 <buf>
    4946:	fff5069b          	addiw	a3,a0,-1
    494a:	1682                	slli	a3,a3,0x20
    494c:	9281                	srli	a3,a3,0x20
    494e:	96d6                	add	a3,a3,s5
        if(buf[j] != '0'+i){
    4950:	0007c703          	lbu	a4,0(a5)
    4954:	fa971be3          	bne	a4,s1,490a <fourfiles+0x178>
      for(j = 0; j < n; j++){
    4958:	0785                	addi	a5,a5,1
    495a:	fed79be3          	bne	a5,a3,4950 <fourfiles+0x1be>
    495e:	b7e9                	j	4928 <fourfiles+0x196>
    close(fd);
    4960:	854e                	mv	a0,s3
    4962:	00001097          	auipc	ra,0x1
    4966:	f0e080e7          	jalr	-242(ra) # 5870 <close>
    if(total != N*SZ){
    496a:	03b91863          	bne	s2,s11,499a <fourfiles+0x208>
    unlink(fname);
    496e:	8566                	mv	a0,s9
    4970:	00001097          	auipc	ra,0x1
    4974:	f28080e7          	jalr	-216(ra) # 5898 <unlink>
  for(i = 0; i < NCHILD; i++){
    4978:	0c21                	addi	s8,s8,8
    497a:	2b85                	addiw	s7,s7,1
    497c:	03ab8d63          	beq	s7,s10,49b6 <fourfiles+0x224>
    fname = names[i];
    4980:	000c3c83          	ld	s9,0(s8)
    fd = open(fname, 0);
    4984:	4581                	li	a1,0
    4986:	8566                	mv	a0,s9
    4988:	00001097          	auipc	ra,0x1
    498c:	f00080e7          	jalr	-256(ra) # 5888 <open>
    4990:	89aa                	mv	s3,a0
    total = 0;
    4992:	895a                	mv	s2,s6
        if(buf[j] != '0'+i){
    4994:	000b849b          	sext.w	s1,s7
    while((n = read(fd, buf, sizeof(buf))) > 0){
    4998:	bf51                	j	492c <fourfiles+0x19a>
      printf("wrong length %d\n", total);
    499a:	85ca                	mv	a1,s2
    499c:	00003517          	auipc	a0,0x3
    49a0:	3bc50513          	addi	a0,a0,956 # 7d58 <malloc+0x20da>
    49a4:	00001097          	auipc	ra,0x1
    49a8:	21c080e7          	jalr	540(ra) # 5bc0 <printf>
      exit(1);
    49ac:	4505                	li	a0,1
    49ae:	00001097          	auipc	ra,0x1
    49b2:	e9a080e7          	jalr	-358(ra) # 5848 <exit>
}
    49b6:	70aa                	ld	ra,168(sp)
    49b8:	740a                	ld	s0,160(sp)
    49ba:	64ea                	ld	s1,152(sp)
    49bc:	694a                	ld	s2,144(sp)
    49be:	69aa                	ld	s3,136(sp)
    49c0:	6a0a                	ld	s4,128(sp)
    49c2:	7ae6                	ld	s5,120(sp)
    49c4:	7b46                	ld	s6,112(sp)
    49c6:	7ba6                	ld	s7,104(sp)
    49c8:	7c06                	ld	s8,96(sp)
    49ca:	6ce6                	ld	s9,88(sp)
    49cc:	6d46                	ld	s10,80(sp)
    49ce:	6da6                	ld	s11,72(sp)
    49d0:	614d                	addi	sp,sp,176
    49d2:	8082                	ret

00000000000049d4 <concreate>:
{
    49d4:	7135                	addi	sp,sp,-160
    49d6:	ed06                	sd	ra,152(sp)
    49d8:	e922                	sd	s0,144(sp)
    49da:	e526                	sd	s1,136(sp)
    49dc:	e14a                	sd	s2,128(sp)
    49de:	fcce                	sd	s3,120(sp)
    49e0:	f8d2                	sd	s4,112(sp)
    49e2:	f4d6                	sd	s5,104(sp)
    49e4:	f0da                	sd	s6,96(sp)
    49e6:	ecde                	sd	s7,88(sp)
    49e8:	1100                	addi	s0,sp,160
    49ea:	89aa                	mv	s3,a0
  file[0] = 'C';
    49ec:	04300793          	li	a5,67
    49f0:	faf40423          	sb	a5,-88(s0)
  file[2] = '\0';
    49f4:	fa040523          	sb	zero,-86(s0)
  for(i = 0; i < N; i++){
    49f8:	4901                	li	s2,0
    if(pid && (i % 3) == 1){
    49fa:	4b0d                	li	s6,3
    49fc:	4a85                	li	s5,1
      link("C0", file);
    49fe:	00003b97          	auipc	s7,0x3
    4a02:	372b8b93          	addi	s7,s7,882 # 7d70 <malloc+0x20f2>
  for(i = 0; i < N; i++){
    4a06:	02800a13          	li	s4,40
    4a0a:	acc1                	j	4cda <concreate+0x306>
      link("C0", file);
    4a0c:	fa840593          	addi	a1,s0,-88
    4a10:	855e                	mv	a0,s7
    4a12:	00001097          	auipc	ra,0x1
    4a16:	e96080e7          	jalr	-362(ra) # 58a8 <link>
    if(pid == 0) {
    4a1a:	a45d                	j	4cc0 <concreate+0x2ec>
    } else if(pid == 0 && (i % 5) == 1){
    4a1c:	4795                	li	a5,5
    4a1e:	02f9693b          	remw	s2,s2,a5
    4a22:	4785                	li	a5,1
    4a24:	02f90b63          	beq	s2,a5,4a5a <concreate+0x86>
      fd = open(file, O_CREATE | O_RDWR);
    4a28:	20200593          	li	a1,514
    4a2c:	fa840513          	addi	a0,s0,-88
    4a30:	00001097          	auipc	ra,0x1
    4a34:	e58080e7          	jalr	-424(ra) # 5888 <open>
      if(fd < 0){
    4a38:	26055b63          	bgez	a0,4cae <concreate+0x2da>
        printf("concreate create %s failed\n", file);
    4a3c:	fa840593          	addi	a1,s0,-88
    4a40:	00003517          	auipc	a0,0x3
    4a44:	33850513          	addi	a0,a0,824 # 7d78 <malloc+0x20fa>
    4a48:	00001097          	auipc	ra,0x1
    4a4c:	178080e7          	jalr	376(ra) # 5bc0 <printf>
        exit(1);
    4a50:	4505                	li	a0,1
    4a52:	00001097          	auipc	ra,0x1
    4a56:	df6080e7          	jalr	-522(ra) # 5848 <exit>
      link("C0", file);
    4a5a:	fa840593          	addi	a1,s0,-88
    4a5e:	00003517          	auipc	a0,0x3
    4a62:	31250513          	addi	a0,a0,786 # 7d70 <malloc+0x20f2>
    4a66:	00001097          	auipc	ra,0x1
    4a6a:	e42080e7          	jalr	-446(ra) # 58a8 <link>
      exit(0);
    4a6e:	4501                	li	a0,0
    4a70:	00001097          	auipc	ra,0x1
    4a74:	dd8080e7          	jalr	-552(ra) # 5848 <exit>
        exit(1);
    4a78:	4505                	li	a0,1
    4a7a:	00001097          	auipc	ra,0x1
    4a7e:	dce080e7          	jalr	-562(ra) # 5848 <exit>
  memset(fa, 0, sizeof(fa));
    4a82:	02800613          	li	a2,40
    4a86:	4581                	li	a1,0
    4a88:	f8040513          	addi	a0,s0,-128
    4a8c:	00001097          	auipc	ra,0x1
    4a90:	bc0080e7          	jalr	-1088(ra) # 564c <memset>
  fd = open(".", 0);
    4a94:	4581                	li	a1,0
    4a96:	00002517          	auipc	a0,0x2
    4a9a:	d0250513          	addi	a0,a0,-766 # 6798 <malloc+0xb1a>
    4a9e:	00001097          	auipc	ra,0x1
    4aa2:	dea080e7          	jalr	-534(ra) # 5888 <open>
    4aa6:	892a                	mv	s2,a0
  n = 0;
    4aa8:	8aa6                	mv	s5,s1
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    4aaa:	04300a13          	li	s4,67
      if(i < 0 || i >= sizeof(fa)){
    4aae:	02700b13          	li	s6,39
      fa[i] = 1;
    4ab2:	4b85                	li	s7,1
  while(read(fd, &de, sizeof(de)) > 0){
    4ab4:	4641                	li	a2,16
    4ab6:	f7040593          	addi	a1,s0,-144
    4aba:	854a                	mv	a0,s2
    4abc:	00001097          	auipc	ra,0x1
    4ac0:	da4080e7          	jalr	-604(ra) # 5860 <read>
    4ac4:	08a05163          	blez	a0,4b46 <concreate+0x172>
    if(de.inum == 0)
    4ac8:	f7045783          	lhu	a5,-144(s0)
    4acc:	d7e5                	beqz	a5,4ab4 <concreate+0xe0>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    4ace:	f7244783          	lbu	a5,-142(s0)
    4ad2:	ff4791e3          	bne	a5,s4,4ab4 <concreate+0xe0>
    4ad6:	f7444783          	lbu	a5,-140(s0)
    4ada:	ffe9                	bnez	a5,4ab4 <concreate+0xe0>
      i = de.name[1] - '0';
    4adc:	f7344783          	lbu	a5,-141(s0)
    4ae0:	fd07879b          	addiw	a5,a5,-48
    4ae4:	0007871b          	sext.w	a4,a5
      if(i < 0 || i >= sizeof(fa)){
    4ae8:	00eb6f63          	bltu	s6,a4,4b06 <concreate+0x132>
      if(fa[i]){
    4aec:	fb040793          	addi	a5,s0,-80
    4af0:	97ba                	add	a5,a5,a4
    4af2:	fd07c783          	lbu	a5,-48(a5)
    4af6:	eb85                	bnez	a5,4b26 <concreate+0x152>
      fa[i] = 1;
    4af8:	fb040793          	addi	a5,s0,-80
    4afc:	973e                	add	a4,a4,a5
    4afe:	fd770823          	sb	s7,-48(a4) # fd0 <bigdir+0x6e>
      n++;
    4b02:	2a85                	addiw	s5,s5,1
    4b04:	bf45                	j	4ab4 <concreate+0xe0>
        printf("%s: concreate weird file %s\n", s, de.name);
    4b06:	f7240613          	addi	a2,s0,-142
    4b0a:	85ce                	mv	a1,s3
    4b0c:	00003517          	auipc	a0,0x3
    4b10:	28c50513          	addi	a0,a0,652 # 7d98 <malloc+0x211a>
    4b14:	00001097          	auipc	ra,0x1
    4b18:	0ac080e7          	jalr	172(ra) # 5bc0 <printf>
        exit(1);
    4b1c:	4505                	li	a0,1
    4b1e:	00001097          	auipc	ra,0x1
    4b22:	d2a080e7          	jalr	-726(ra) # 5848 <exit>
        printf("%s: concreate duplicate file %s\n", s, de.name);
    4b26:	f7240613          	addi	a2,s0,-142
    4b2a:	85ce                	mv	a1,s3
    4b2c:	00003517          	auipc	a0,0x3
    4b30:	28c50513          	addi	a0,a0,652 # 7db8 <malloc+0x213a>
    4b34:	00001097          	auipc	ra,0x1
    4b38:	08c080e7          	jalr	140(ra) # 5bc0 <printf>
        exit(1);
    4b3c:	4505                	li	a0,1
    4b3e:	00001097          	auipc	ra,0x1
    4b42:	d0a080e7          	jalr	-758(ra) # 5848 <exit>
  close(fd);
    4b46:	854a                	mv	a0,s2
    4b48:	00001097          	auipc	ra,0x1
    4b4c:	d28080e7          	jalr	-728(ra) # 5870 <close>
  if(n != N){
    4b50:	02800793          	li	a5,40
    4b54:	00fa9763          	bne	s5,a5,4b62 <concreate+0x18e>
    if(((i % 3) == 0 && pid == 0) ||
    4b58:	4a8d                	li	s5,3
    4b5a:	4b05                	li	s6,1
  for(i = 0; i < N; i++){
    4b5c:	02800a13          	li	s4,40
    4b60:	a8c9                	j	4c32 <concreate+0x25e>
    printf("%s: concreate not enough files in directory listing\n", s);
    4b62:	85ce                	mv	a1,s3
    4b64:	00003517          	auipc	a0,0x3
    4b68:	27c50513          	addi	a0,a0,636 # 7de0 <malloc+0x2162>
    4b6c:	00001097          	auipc	ra,0x1
    4b70:	054080e7          	jalr	84(ra) # 5bc0 <printf>
    exit(1);
    4b74:	4505                	li	a0,1
    4b76:	00001097          	auipc	ra,0x1
    4b7a:	cd2080e7          	jalr	-814(ra) # 5848 <exit>
      printf("%s: fork failed\n", s);
    4b7e:	85ce                	mv	a1,s3
    4b80:	00002517          	auipc	a0,0x2
    4b84:	db850513          	addi	a0,a0,-584 # 6938 <malloc+0xcba>
    4b88:	00001097          	auipc	ra,0x1
    4b8c:	038080e7          	jalr	56(ra) # 5bc0 <printf>
      exit(1);
    4b90:	4505                	li	a0,1
    4b92:	00001097          	auipc	ra,0x1
    4b96:	cb6080e7          	jalr	-842(ra) # 5848 <exit>
      close(open(file, 0));
    4b9a:	4581                	li	a1,0
    4b9c:	fa840513          	addi	a0,s0,-88
    4ba0:	00001097          	auipc	ra,0x1
    4ba4:	ce8080e7          	jalr	-792(ra) # 5888 <open>
    4ba8:	00001097          	auipc	ra,0x1
    4bac:	cc8080e7          	jalr	-824(ra) # 5870 <close>
      close(open(file, 0));
    4bb0:	4581                	li	a1,0
    4bb2:	fa840513          	addi	a0,s0,-88
    4bb6:	00001097          	auipc	ra,0x1
    4bba:	cd2080e7          	jalr	-814(ra) # 5888 <open>
    4bbe:	00001097          	auipc	ra,0x1
    4bc2:	cb2080e7          	jalr	-846(ra) # 5870 <close>
      close(open(file, 0));
    4bc6:	4581                	li	a1,0
    4bc8:	fa840513          	addi	a0,s0,-88
    4bcc:	00001097          	auipc	ra,0x1
    4bd0:	cbc080e7          	jalr	-836(ra) # 5888 <open>
    4bd4:	00001097          	auipc	ra,0x1
    4bd8:	c9c080e7          	jalr	-868(ra) # 5870 <close>
      close(open(file, 0));
    4bdc:	4581                	li	a1,0
    4bde:	fa840513          	addi	a0,s0,-88
    4be2:	00001097          	auipc	ra,0x1
    4be6:	ca6080e7          	jalr	-858(ra) # 5888 <open>
    4bea:	00001097          	auipc	ra,0x1
    4bee:	c86080e7          	jalr	-890(ra) # 5870 <close>
      close(open(file, 0));
    4bf2:	4581                	li	a1,0
    4bf4:	fa840513          	addi	a0,s0,-88
    4bf8:	00001097          	auipc	ra,0x1
    4bfc:	c90080e7          	jalr	-880(ra) # 5888 <open>
    4c00:	00001097          	auipc	ra,0x1
    4c04:	c70080e7          	jalr	-912(ra) # 5870 <close>
      close(open(file, 0));
    4c08:	4581                	li	a1,0
    4c0a:	fa840513          	addi	a0,s0,-88
    4c0e:	00001097          	auipc	ra,0x1
    4c12:	c7a080e7          	jalr	-902(ra) # 5888 <open>
    4c16:	00001097          	auipc	ra,0x1
    4c1a:	c5a080e7          	jalr	-934(ra) # 5870 <close>
    if(pid == 0)
    4c1e:	08090363          	beqz	s2,4ca4 <concreate+0x2d0>
      wait(0);
    4c22:	4501                	li	a0,0
    4c24:	00001097          	auipc	ra,0x1
    4c28:	c2c080e7          	jalr	-980(ra) # 5850 <wait>
  for(i = 0; i < N; i++){
    4c2c:	2485                	addiw	s1,s1,1
    4c2e:	0f448563          	beq	s1,s4,4d18 <concreate+0x344>
    file[1] = '0' + i;
    4c32:	0304879b          	addiw	a5,s1,48
    4c36:	faf404a3          	sb	a5,-87(s0)
    pid = fork();
    4c3a:	00001097          	auipc	ra,0x1
    4c3e:	c06080e7          	jalr	-1018(ra) # 5840 <fork>
    4c42:	892a                	mv	s2,a0
    if(pid < 0){
    4c44:	f2054de3          	bltz	a0,4b7e <concreate+0x1aa>
    if(((i % 3) == 0 && pid == 0) ||
    4c48:	0354e73b          	remw	a4,s1,s5
    4c4c:	00a767b3          	or	a5,a4,a0
    4c50:	2781                	sext.w	a5,a5
    4c52:	d7a1                	beqz	a5,4b9a <concreate+0x1c6>
    4c54:	01671363          	bne	a4,s6,4c5a <concreate+0x286>
       ((i % 3) == 1 && pid != 0)){
    4c58:	f129                	bnez	a0,4b9a <concreate+0x1c6>
      unlink(file);
    4c5a:	fa840513          	addi	a0,s0,-88
    4c5e:	00001097          	auipc	ra,0x1
    4c62:	c3a080e7          	jalr	-966(ra) # 5898 <unlink>
      unlink(file);
    4c66:	fa840513          	addi	a0,s0,-88
    4c6a:	00001097          	auipc	ra,0x1
    4c6e:	c2e080e7          	jalr	-978(ra) # 5898 <unlink>
      unlink(file);
    4c72:	fa840513          	addi	a0,s0,-88
    4c76:	00001097          	auipc	ra,0x1
    4c7a:	c22080e7          	jalr	-990(ra) # 5898 <unlink>
      unlink(file);
    4c7e:	fa840513          	addi	a0,s0,-88
    4c82:	00001097          	auipc	ra,0x1
    4c86:	c16080e7          	jalr	-1002(ra) # 5898 <unlink>
      unlink(file);
    4c8a:	fa840513          	addi	a0,s0,-88
    4c8e:	00001097          	auipc	ra,0x1
    4c92:	c0a080e7          	jalr	-1014(ra) # 5898 <unlink>
      unlink(file);
    4c96:	fa840513          	addi	a0,s0,-88
    4c9a:	00001097          	auipc	ra,0x1
    4c9e:	bfe080e7          	jalr	-1026(ra) # 5898 <unlink>
    4ca2:	bfb5                	j	4c1e <concreate+0x24a>
      exit(0);
    4ca4:	4501                	li	a0,0
    4ca6:	00001097          	auipc	ra,0x1
    4caa:	ba2080e7          	jalr	-1118(ra) # 5848 <exit>
      close(fd);
    4cae:	00001097          	auipc	ra,0x1
    4cb2:	bc2080e7          	jalr	-1086(ra) # 5870 <close>
    if(pid == 0) {
    4cb6:	bb65                	j	4a6e <concreate+0x9a>
      close(fd);
    4cb8:	00001097          	auipc	ra,0x1
    4cbc:	bb8080e7          	jalr	-1096(ra) # 5870 <close>
      wait(&xstatus);
    4cc0:	f6c40513          	addi	a0,s0,-148
    4cc4:	00001097          	auipc	ra,0x1
    4cc8:	b8c080e7          	jalr	-1140(ra) # 5850 <wait>
      if(xstatus != 0)
    4ccc:	f6c42483          	lw	s1,-148(s0)
    4cd0:	da0494e3          	bnez	s1,4a78 <concreate+0xa4>
  for(i = 0; i < N; i++){
    4cd4:	2905                	addiw	s2,s2,1
    4cd6:	db4906e3          	beq	s2,s4,4a82 <concreate+0xae>
    file[1] = '0' + i;
    4cda:	0309079b          	addiw	a5,s2,48
    4cde:	faf404a3          	sb	a5,-87(s0)
    unlink(file);
    4ce2:	fa840513          	addi	a0,s0,-88
    4ce6:	00001097          	auipc	ra,0x1
    4cea:	bb2080e7          	jalr	-1102(ra) # 5898 <unlink>
    pid = fork();
    4cee:	00001097          	auipc	ra,0x1
    4cf2:	b52080e7          	jalr	-1198(ra) # 5840 <fork>
    if(pid && (i % 3) == 1){
    4cf6:	d20503e3          	beqz	a0,4a1c <concreate+0x48>
    4cfa:	036967bb          	remw	a5,s2,s6
    4cfe:	d15787e3          	beq	a5,s5,4a0c <concreate+0x38>
      fd = open(file, O_CREATE | O_RDWR);
    4d02:	20200593          	li	a1,514
    4d06:	fa840513          	addi	a0,s0,-88
    4d0a:	00001097          	auipc	ra,0x1
    4d0e:	b7e080e7          	jalr	-1154(ra) # 5888 <open>
      if(fd < 0){
    4d12:	fa0553e3          	bgez	a0,4cb8 <concreate+0x2e4>
    4d16:	b31d                	j	4a3c <concreate+0x68>
}
    4d18:	60ea                	ld	ra,152(sp)
    4d1a:	644a                	ld	s0,144(sp)
    4d1c:	64aa                	ld	s1,136(sp)
    4d1e:	690a                	ld	s2,128(sp)
    4d20:	79e6                	ld	s3,120(sp)
    4d22:	7a46                	ld	s4,112(sp)
    4d24:	7aa6                	ld	s5,104(sp)
    4d26:	7b06                	ld	s6,96(sp)
    4d28:	6be6                	ld	s7,88(sp)
    4d2a:	610d                	addi	sp,sp,160
    4d2c:	8082                	ret

0000000000004d2e <bigfile>:
{
    4d2e:	7139                	addi	sp,sp,-64
    4d30:	fc06                	sd	ra,56(sp)
    4d32:	f822                	sd	s0,48(sp)
    4d34:	f426                	sd	s1,40(sp)
    4d36:	f04a                	sd	s2,32(sp)
    4d38:	ec4e                	sd	s3,24(sp)
    4d3a:	e852                	sd	s4,16(sp)
    4d3c:	e456                	sd	s5,8(sp)
    4d3e:	0080                	addi	s0,sp,64
    4d40:	8aaa                	mv	s5,a0
  unlink("bigfile.dat");
    4d42:	00003517          	auipc	a0,0x3
    4d46:	0d650513          	addi	a0,a0,214 # 7e18 <malloc+0x219a>
    4d4a:	00001097          	auipc	ra,0x1
    4d4e:	b4e080e7          	jalr	-1202(ra) # 5898 <unlink>
  fd = open("bigfile.dat", O_CREATE | O_RDWR);
    4d52:	20200593          	li	a1,514
    4d56:	00003517          	auipc	a0,0x3
    4d5a:	0c250513          	addi	a0,a0,194 # 7e18 <malloc+0x219a>
    4d5e:	00001097          	auipc	ra,0x1
    4d62:	b2a080e7          	jalr	-1238(ra) # 5888 <open>
    4d66:	89aa                	mv	s3,a0
  for(i = 0; i < N; i++){
    4d68:	4481                	li	s1,0
    memset(buf, i, SZ);
    4d6a:	00007917          	auipc	s2,0x7
    4d6e:	01e90913          	addi	s2,s2,30 # bd88 <buf>
  for(i = 0; i < N; i++){
    4d72:	4a51                	li	s4,20
  if(fd < 0){
    4d74:	0a054063          	bltz	a0,4e14 <bigfile+0xe6>
    memset(buf, i, SZ);
    4d78:	25800613          	li	a2,600
    4d7c:	85a6                	mv	a1,s1
    4d7e:	854a                	mv	a0,s2
    4d80:	00001097          	auipc	ra,0x1
    4d84:	8cc080e7          	jalr	-1844(ra) # 564c <memset>
    if(write(fd, buf, SZ) != SZ){
    4d88:	25800613          	li	a2,600
    4d8c:	85ca                	mv	a1,s2
    4d8e:	854e                	mv	a0,s3
    4d90:	00001097          	auipc	ra,0x1
    4d94:	ad8080e7          	jalr	-1320(ra) # 5868 <write>
    4d98:	25800793          	li	a5,600
    4d9c:	08f51a63          	bne	a0,a5,4e30 <bigfile+0x102>
  for(i = 0; i < N; i++){
    4da0:	2485                	addiw	s1,s1,1
    4da2:	fd449be3          	bne	s1,s4,4d78 <bigfile+0x4a>
  close(fd);
    4da6:	854e                	mv	a0,s3
    4da8:	00001097          	auipc	ra,0x1
    4dac:	ac8080e7          	jalr	-1336(ra) # 5870 <close>
  fd = open("bigfile.dat", 0);
    4db0:	4581                	li	a1,0
    4db2:	00003517          	auipc	a0,0x3
    4db6:	06650513          	addi	a0,a0,102 # 7e18 <malloc+0x219a>
    4dba:	00001097          	auipc	ra,0x1
    4dbe:	ace080e7          	jalr	-1330(ra) # 5888 <open>
    4dc2:	8a2a                	mv	s4,a0
  total = 0;
    4dc4:	4981                	li	s3,0
  for(i = 0; ; i++){
    4dc6:	4481                	li	s1,0
    cc = read(fd, buf, SZ/2);
    4dc8:	00007917          	auipc	s2,0x7
    4dcc:	fc090913          	addi	s2,s2,-64 # bd88 <buf>
  if(fd < 0){
    4dd0:	06054e63          	bltz	a0,4e4c <bigfile+0x11e>
    cc = read(fd, buf, SZ/2);
    4dd4:	12c00613          	li	a2,300
    4dd8:	85ca                	mv	a1,s2
    4dda:	8552                	mv	a0,s4
    4ddc:	00001097          	auipc	ra,0x1
    4de0:	a84080e7          	jalr	-1404(ra) # 5860 <read>
    if(cc < 0){
    4de4:	08054263          	bltz	a0,4e68 <bigfile+0x13a>
    if(cc == 0)
    4de8:	c971                	beqz	a0,4ebc <bigfile+0x18e>
    if(cc != SZ/2){
    4dea:	12c00793          	li	a5,300
    4dee:	08f51b63          	bne	a0,a5,4e84 <bigfile+0x156>
    if(buf[0] != i/2 || buf[SZ/2-1] != i/2){
    4df2:	01f4d79b          	srliw	a5,s1,0x1f
    4df6:	9fa5                	addw	a5,a5,s1
    4df8:	4017d79b          	sraiw	a5,a5,0x1
    4dfc:	00094703          	lbu	a4,0(s2)
    4e00:	0af71063          	bne	a4,a5,4ea0 <bigfile+0x172>
    4e04:	12b94703          	lbu	a4,299(s2)
    4e08:	08f71c63          	bne	a4,a5,4ea0 <bigfile+0x172>
    total += cc;
    4e0c:	12c9899b          	addiw	s3,s3,300
  for(i = 0; ; i++){
    4e10:	2485                	addiw	s1,s1,1
    cc = read(fd, buf, SZ/2);
    4e12:	b7c9                	j	4dd4 <bigfile+0xa6>
    printf("%s: cannot create bigfile", s);
    4e14:	85d6                	mv	a1,s5
    4e16:	00003517          	auipc	a0,0x3
    4e1a:	01250513          	addi	a0,a0,18 # 7e28 <malloc+0x21aa>
    4e1e:	00001097          	auipc	ra,0x1
    4e22:	da2080e7          	jalr	-606(ra) # 5bc0 <printf>
    exit(1);
    4e26:	4505                	li	a0,1
    4e28:	00001097          	auipc	ra,0x1
    4e2c:	a20080e7          	jalr	-1504(ra) # 5848 <exit>
      printf("%s: write bigfile failed\n", s);
    4e30:	85d6                	mv	a1,s5
    4e32:	00003517          	auipc	a0,0x3
    4e36:	01650513          	addi	a0,a0,22 # 7e48 <malloc+0x21ca>
    4e3a:	00001097          	auipc	ra,0x1
    4e3e:	d86080e7          	jalr	-634(ra) # 5bc0 <printf>
      exit(1);
    4e42:	4505                	li	a0,1
    4e44:	00001097          	auipc	ra,0x1
    4e48:	a04080e7          	jalr	-1532(ra) # 5848 <exit>
    printf("%s: cannot open bigfile\n", s);
    4e4c:	85d6                	mv	a1,s5
    4e4e:	00003517          	auipc	a0,0x3
    4e52:	01a50513          	addi	a0,a0,26 # 7e68 <malloc+0x21ea>
    4e56:	00001097          	auipc	ra,0x1
    4e5a:	d6a080e7          	jalr	-662(ra) # 5bc0 <printf>
    exit(1);
    4e5e:	4505                	li	a0,1
    4e60:	00001097          	auipc	ra,0x1
    4e64:	9e8080e7          	jalr	-1560(ra) # 5848 <exit>
      printf("%s: read bigfile failed\n", s);
    4e68:	85d6                	mv	a1,s5
    4e6a:	00003517          	auipc	a0,0x3
    4e6e:	01e50513          	addi	a0,a0,30 # 7e88 <malloc+0x220a>
    4e72:	00001097          	auipc	ra,0x1
    4e76:	d4e080e7          	jalr	-690(ra) # 5bc0 <printf>
      exit(1);
    4e7a:	4505                	li	a0,1
    4e7c:	00001097          	auipc	ra,0x1
    4e80:	9cc080e7          	jalr	-1588(ra) # 5848 <exit>
      printf("%s: short read bigfile\n", s);
    4e84:	85d6                	mv	a1,s5
    4e86:	00003517          	auipc	a0,0x3
    4e8a:	02250513          	addi	a0,a0,34 # 7ea8 <malloc+0x222a>
    4e8e:	00001097          	auipc	ra,0x1
    4e92:	d32080e7          	jalr	-718(ra) # 5bc0 <printf>
      exit(1);
    4e96:	4505                	li	a0,1
    4e98:	00001097          	auipc	ra,0x1
    4e9c:	9b0080e7          	jalr	-1616(ra) # 5848 <exit>
      printf("%s: read bigfile wrong data\n", s);
    4ea0:	85d6                	mv	a1,s5
    4ea2:	00003517          	auipc	a0,0x3
    4ea6:	01e50513          	addi	a0,a0,30 # 7ec0 <malloc+0x2242>
    4eaa:	00001097          	auipc	ra,0x1
    4eae:	d16080e7          	jalr	-746(ra) # 5bc0 <printf>
      exit(1);
    4eb2:	4505                	li	a0,1
    4eb4:	00001097          	auipc	ra,0x1
    4eb8:	994080e7          	jalr	-1644(ra) # 5848 <exit>
  close(fd);
    4ebc:	8552                	mv	a0,s4
    4ebe:	00001097          	auipc	ra,0x1
    4ec2:	9b2080e7          	jalr	-1614(ra) # 5870 <close>
  if(total != N*SZ){
    4ec6:	678d                	lui	a5,0x3
    4ec8:	ee078793          	addi	a5,a5,-288 # 2ee0 <fourteen+0x10a>
    4ecc:	02f99363          	bne	s3,a5,4ef2 <bigfile+0x1c4>
  unlink("bigfile.dat");
    4ed0:	00003517          	auipc	a0,0x3
    4ed4:	f4850513          	addi	a0,a0,-184 # 7e18 <malloc+0x219a>
    4ed8:	00001097          	auipc	ra,0x1
    4edc:	9c0080e7          	jalr	-1600(ra) # 5898 <unlink>
}
    4ee0:	70e2                	ld	ra,56(sp)
    4ee2:	7442                	ld	s0,48(sp)
    4ee4:	74a2                	ld	s1,40(sp)
    4ee6:	7902                	ld	s2,32(sp)
    4ee8:	69e2                	ld	s3,24(sp)
    4eea:	6a42                	ld	s4,16(sp)
    4eec:	6aa2                	ld	s5,8(sp)
    4eee:	6121                	addi	sp,sp,64
    4ef0:	8082                	ret
    printf("%s: read bigfile wrong total\n", s);
    4ef2:	85d6                	mv	a1,s5
    4ef4:	00003517          	auipc	a0,0x3
    4ef8:	fec50513          	addi	a0,a0,-20 # 7ee0 <malloc+0x2262>
    4efc:	00001097          	auipc	ra,0x1
    4f00:	cc4080e7          	jalr	-828(ra) # 5bc0 <printf>
    exit(1);
    4f04:	4505                	li	a0,1
    4f06:	00001097          	auipc	ra,0x1
    4f0a:	942080e7          	jalr	-1726(ra) # 5848 <exit>

0000000000004f0e <fsfull>:
{
    4f0e:	7171                	addi	sp,sp,-176
    4f10:	f506                	sd	ra,168(sp)
    4f12:	f122                	sd	s0,160(sp)
    4f14:	ed26                	sd	s1,152(sp)
    4f16:	e94a                	sd	s2,144(sp)
    4f18:	e54e                	sd	s3,136(sp)
    4f1a:	e152                	sd	s4,128(sp)
    4f1c:	fcd6                	sd	s5,120(sp)
    4f1e:	f8da                	sd	s6,112(sp)
    4f20:	f4de                	sd	s7,104(sp)
    4f22:	f0e2                	sd	s8,96(sp)
    4f24:	ece6                	sd	s9,88(sp)
    4f26:	e8ea                	sd	s10,80(sp)
    4f28:	e4ee                	sd	s11,72(sp)
    4f2a:	1900                	addi	s0,sp,176
  printf("fsfull test\n");
    4f2c:	00003517          	auipc	a0,0x3
    4f30:	fd450513          	addi	a0,a0,-44 # 7f00 <malloc+0x2282>
    4f34:	00001097          	auipc	ra,0x1
    4f38:	c8c080e7          	jalr	-884(ra) # 5bc0 <printf>
  for(nfiles = 0; ; nfiles++){
    4f3c:	4481                	li	s1,0
    name[0] = 'f';
    4f3e:	06600d13          	li	s10,102
    name[1] = '0' + nfiles / 1000;
    4f42:	3e800c13          	li	s8,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    4f46:	06400b93          	li	s7,100
    name[3] = '0' + (nfiles % 100) / 10;
    4f4a:	4b29                	li	s6,10
    printf("writing %s\n", name);
    4f4c:	00003c97          	auipc	s9,0x3
    4f50:	fc4c8c93          	addi	s9,s9,-60 # 7f10 <malloc+0x2292>
    int total = 0;
    4f54:	4d81                	li	s11,0
      int cc = write(fd, buf, BSIZE);
    4f56:	00007a17          	auipc	s4,0x7
    4f5a:	e32a0a13          	addi	s4,s4,-462 # bd88 <buf>
    name[0] = 'f';
    4f5e:	f5a40823          	sb	s10,-176(s0)
    name[1] = '0' + nfiles / 1000;
    4f62:	0384c7bb          	divw	a5,s1,s8
    4f66:	0307879b          	addiw	a5,a5,48
    4f6a:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    4f6e:	0384e7bb          	remw	a5,s1,s8
    4f72:	0377c7bb          	divw	a5,a5,s7
    4f76:	0307879b          	addiw	a5,a5,48
    4f7a:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    4f7e:	0374e7bb          	remw	a5,s1,s7
    4f82:	0367c7bb          	divw	a5,a5,s6
    4f86:	0307879b          	addiw	a5,a5,48
    4f8a:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    4f8e:	0364e7bb          	remw	a5,s1,s6
    4f92:	0307879b          	addiw	a5,a5,48
    4f96:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    4f9a:	f4040aa3          	sb	zero,-171(s0)
    printf("writing %s\n", name);
    4f9e:	f5040593          	addi	a1,s0,-176
    4fa2:	8566                	mv	a0,s9
    4fa4:	00001097          	auipc	ra,0x1
    4fa8:	c1c080e7          	jalr	-996(ra) # 5bc0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    4fac:	20200593          	li	a1,514
    4fb0:	f5040513          	addi	a0,s0,-176
    4fb4:	00001097          	auipc	ra,0x1
    4fb8:	8d4080e7          	jalr	-1836(ra) # 5888 <open>
    4fbc:	892a                	mv	s2,a0
    if(fd < 0){
    4fbe:	0a055663          	bgez	a0,506a <fsfull+0x15c>
      printf("open %s failed\n", name);
    4fc2:	f5040593          	addi	a1,s0,-176
    4fc6:	00003517          	auipc	a0,0x3
    4fca:	f5a50513          	addi	a0,a0,-166 # 7f20 <malloc+0x22a2>
    4fce:	00001097          	auipc	ra,0x1
    4fd2:	bf2080e7          	jalr	-1038(ra) # 5bc0 <printf>
  while(nfiles >= 0){
    4fd6:	0604c363          	bltz	s1,503c <fsfull+0x12e>
    name[0] = 'f';
    4fda:	06600b13          	li	s6,102
    name[1] = '0' + nfiles / 1000;
    4fde:	3e800a13          	li	s4,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    4fe2:	06400993          	li	s3,100
    name[3] = '0' + (nfiles % 100) / 10;
    4fe6:	4929                	li	s2,10
  while(nfiles >= 0){
    4fe8:	5afd                	li	s5,-1
    name[0] = 'f';
    4fea:	f5640823          	sb	s6,-176(s0)
    name[1] = '0' + nfiles / 1000;
    4fee:	0344c7bb          	divw	a5,s1,s4
    4ff2:	0307879b          	addiw	a5,a5,48
    4ff6:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    4ffa:	0344e7bb          	remw	a5,s1,s4
    4ffe:	0337c7bb          	divw	a5,a5,s3
    5002:	0307879b          	addiw	a5,a5,48
    5006:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    500a:	0334e7bb          	remw	a5,s1,s3
    500e:	0327c7bb          	divw	a5,a5,s2
    5012:	0307879b          	addiw	a5,a5,48
    5016:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    501a:	0324e7bb          	remw	a5,s1,s2
    501e:	0307879b          	addiw	a5,a5,48
    5022:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    5026:	f4040aa3          	sb	zero,-171(s0)
    unlink(name);
    502a:	f5040513          	addi	a0,s0,-176
    502e:	00001097          	auipc	ra,0x1
    5032:	86a080e7          	jalr	-1942(ra) # 5898 <unlink>
    nfiles--;
    5036:	34fd                	addiw	s1,s1,-1
  while(nfiles >= 0){
    5038:	fb5499e3          	bne	s1,s5,4fea <fsfull+0xdc>
  printf("fsfull test finished\n");
    503c:	00003517          	auipc	a0,0x3
    5040:	f0450513          	addi	a0,a0,-252 # 7f40 <malloc+0x22c2>
    5044:	00001097          	auipc	ra,0x1
    5048:	b7c080e7          	jalr	-1156(ra) # 5bc0 <printf>
}
    504c:	70aa                	ld	ra,168(sp)
    504e:	740a                	ld	s0,160(sp)
    5050:	64ea                	ld	s1,152(sp)
    5052:	694a                	ld	s2,144(sp)
    5054:	69aa                	ld	s3,136(sp)
    5056:	6a0a                	ld	s4,128(sp)
    5058:	7ae6                	ld	s5,120(sp)
    505a:	7b46                	ld	s6,112(sp)
    505c:	7ba6                	ld	s7,104(sp)
    505e:	7c06                	ld	s8,96(sp)
    5060:	6ce6                	ld	s9,88(sp)
    5062:	6d46                	ld	s10,80(sp)
    5064:	6da6                	ld	s11,72(sp)
    5066:	614d                	addi	sp,sp,176
    5068:	8082                	ret
    int total = 0;
    506a:	89ee                	mv	s3,s11
      if(cc < BSIZE)
    506c:	3ff00a93          	li	s5,1023
      int cc = write(fd, buf, BSIZE);
    5070:	40000613          	li	a2,1024
    5074:	85d2                	mv	a1,s4
    5076:	854a                	mv	a0,s2
    5078:	00000097          	auipc	ra,0x0
    507c:	7f0080e7          	jalr	2032(ra) # 5868 <write>
      if(cc < BSIZE)
    5080:	00aad563          	bge	s5,a0,508a <fsfull+0x17c>
      total += cc;
    5084:	00a989bb          	addw	s3,s3,a0
    while(1){
    5088:	b7e5                	j	5070 <fsfull+0x162>
    printf("wrote %d bytes\n", total);
    508a:	85ce                	mv	a1,s3
    508c:	00003517          	auipc	a0,0x3
    5090:	ea450513          	addi	a0,a0,-348 # 7f30 <malloc+0x22b2>
    5094:	00001097          	auipc	ra,0x1
    5098:	b2c080e7          	jalr	-1236(ra) # 5bc0 <printf>
    close(fd);
    509c:	854a                	mv	a0,s2
    509e:	00000097          	auipc	ra,0x0
    50a2:	7d2080e7          	jalr	2002(ra) # 5870 <close>
    if(total == 0)
    50a6:	f20988e3          	beqz	s3,4fd6 <fsfull+0xc8>
  for(nfiles = 0; ; nfiles++){
    50aa:	2485                	addiw	s1,s1,1
    50ac:	bd4d                	j	4f5e <fsfull+0x50>

00000000000050ae <badwrite>:
{
    50ae:	7179                	addi	sp,sp,-48
    50b0:	f406                	sd	ra,40(sp)
    50b2:	f022                	sd	s0,32(sp)
    50b4:	ec26                	sd	s1,24(sp)
    50b6:	e84a                	sd	s2,16(sp)
    50b8:	e44e                	sd	s3,8(sp)
    50ba:	e052                	sd	s4,0(sp)
    50bc:	1800                	addi	s0,sp,48
  unlink("junk");
    50be:	00003517          	auipc	a0,0x3
    50c2:	e9a50513          	addi	a0,a0,-358 # 7f58 <malloc+0x22da>
    50c6:	00000097          	auipc	ra,0x0
    50ca:	7d2080e7          	jalr	2002(ra) # 5898 <unlink>
    50ce:	25800913          	li	s2,600
    int fd = open("junk", O_CREATE|O_WRONLY);
    50d2:	00003997          	auipc	s3,0x3
    50d6:	e8698993          	addi	s3,s3,-378 # 7f58 <malloc+0x22da>
    write(fd, (char*)0xffffffffffL, 1);
    50da:	5a7d                	li	s4,-1
    50dc:	018a5a13          	srli	s4,s4,0x18
    int fd = open("junk", O_CREATE|O_WRONLY);
    50e0:	20100593          	li	a1,513
    50e4:	854e                	mv	a0,s3
    50e6:	00000097          	auipc	ra,0x0
    50ea:	7a2080e7          	jalr	1954(ra) # 5888 <open>
    50ee:	84aa                	mv	s1,a0
    if(fd < 0){
    50f0:	06054b63          	bltz	a0,5166 <badwrite+0xb8>
    write(fd, (char*)0xffffffffffL, 1);
    50f4:	4605                	li	a2,1
    50f6:	85d2                	mv	a1,s4
    50f8:	00000097          	auipc	ra,0x0
    50fc:	770080e7          	jalr	1904(ra) # 5868 <write>
    close(fd);
    5100:	8526                	mv	a0,s1
    5102:	00000097          	auipc	ra,0x0
    5106:	76e080e7          	jalr	1902(ra) # 5870 <close>
    unlink("junk");
    510a:	854e                	mv	a0,s3
    510c:	00000097          	auipc	ra,0x0
    5110:	78c080e7          	jalr	1932(ra) # 5898 <unlink>
  for(int i = 0; i < assumed_free; i++){
    5114:	397d                	addiw	s2,s2,-1
    5116:	fc0915e3          	bnez	s2,50e0 <badwrite+0x32>
  int fd = open("junk", O_CREATE|O_WRONLY);
    511a:	20100593          	li	a1,513
    511e:	00003517          	auipc	a0,0x3
    5122:	e3a50513          	addi	a0,a0,-454 # 7f58 <malloc+0x22da>
    5126:	00000097          	auipc	ra,0x0
    512a:	762080e7          	jalr	1890(ra) # 5888 <open>
    512e:	84aa                	mv	s1,a0
  if(fd < 0){
    5130:	04054863          	bltz	a0,5180 <badwrite+0xd2>
  if(write(fd, "x", 1) != 1){
    5134:	4605                	li	a2,1
    5136:	00001597          	auipc	a1,0x1
    513a:	03a58593          	addi	a1,a1,58 # 6170 <malloc+0x4f2>
    513e:	00000097          	auipc	ra,0x0
    5142:	72a080e7          	jalr	1834(ra) # 5868 <write>
    5146:	4785                	li	a5,1
    5148:	04f50963          	beq	a0,a5,519a <badwrite+0xec>
    printf("write failed\n");
    514c:	00003517          	auipc	a0,0x3
    5150:	e2c50513          	addi	a0,a0,-468 # 7f78 <malloc+0x22fa>
    5154:	00001097          	auipc	ra,0x1
    5158:	a6c080e7          	jalr	-1428(ra) # 5bc0 <printf>
    exit(1);
    515c:	4505                	li	a0,1
    515e:	00000097          	auipc	ra,0x0
    5162:	6ea080e7          	jalr	1770(ra) # 5848 <exit>
      printf("open junk failed\n");
    5166:	00003517          	auipc	a0,0x3
    516a:	dfa50513          	addi	a0,a0,-518 # 7f60 <malloc+0x22e2>
    516e:	00001097          	auipc	ra,0x1
    5172:	a52080e7          	jalr	-1454(ra) # 5bc0 <printf>
      exit(1);
    5176:	4505                	li	a0,1
    5178:	00000097          	auipc	ra,0x0
    517c:	6d0080e7          	jalr	1744(ra) # 5848 <exit>
    printf("open junk failed\n");
    5180:	00003517          	auipc	a0,0x3
    5184:	de050513          	addi	a0,a0,-544 # 7f60 <malloc+0x22e2>
    5188:	00001097          	auipc	ra,0x1
    518c:	a38080e7          	jalr	-1480(ra) # 5bc0 <printf>
    exit(1);
    5190:	4505                	li	a0,1
    5192:	00000097          	auipc	ra,0x0
    5196:	6b6080e7          	jalr	1718(ra) # 5848 <exit>
  close(fd);
    519a:	8526                	mv	a0,s1
    519c:	00000097          	auipc	ra,0x0
    51a0:	6d4080e7          	jalr	1748(ra) # 5870 <close>
  unlink("junk");
    51a4:	00003517          	auipc	a0,0x3
    51a8:	db450513          	addi	a0,a0,-588 # 7f58 <malloc+0x22da>
    51ac:	00000097          	auipc	ra,0x0
    51b0:	6ec080e7          	jalr	1772(ra) # 5898 <unlink>
  exit(0);
    51b4:	4501                	li	a0,0
    51b6:	00000097          	auipc	ra,0x0
    51ba:	692080e7          	jalr	1682(ra) # 5848 <exit>

00000000000051be <countfree>:
// because out of memory with lazy allocation results in the process
// taking a fault and being killed, fork and report back.
//
int
countfree()
{
    51be:	7139                	addi	sp,sp,-64
    51c0:	fc06                	sd	ra,56(sp)
    51c2:	f822                	sd	s0,48(sp)
    51c4:	f426                	sd	s1,40(sp)
    51c6:	f04a                	sd	s2,32(sp)
    51c8:	ec4e                	sd	s3,24(sp)
    51ca:	0080                	addi	s0,sp,64
  int fds[2];

  if(pipe(fds) < 0){
    51cc:	fc840513          	addi	a0,s0,-56
    51d0:	00000097          	auipc	ra,0x0
    51d4:	688080e7          	jalr	1672(ra) # 5858 <pipe>
    51d8:	06054763          	bltz	a0,5246 <countfree+0x88>
    printf("pipe() failed in countfree()\n");
    exit(1);
  }
  
  int pid = fork();
    51dc:	00000097          	auipc	ra,0x0
    51e0:	664080e7          	jalr	1636(ra) # 5840 <fork>

  if(pid < 0){
    51e4:	06054e63          	bltz	a0,5260 <countfree+0xa2>
    printf("fork failed in countfree()\n");
    exit(1);
  }

  if(pid == 0){
    51e8:	ed51                	bnez	a0,5284 <countfree+0xc6>
    close(fds[0]);
    51ea:	fc842503          	lw	a0,-56(s0)
    51ee:	00000097          	auipc	ra,0x0
    51f2:	682080e7          	jalr	1666(ra) # 5870 <close>
    
    while(1){
      uint64 a = (uint64) sbrk(4096);
      if(a == 0xffffffffffffffff){
    51f6:	597d                	li	s2,-1
        break;
      }

      // modify the memory to make sure it's really allocated.
      *(char *)(a + 4096 - 1) = 1;
    51f8:	4485                	li	s1,1

      // report back one more page.
      if(write(fds[1], "x", 1) != 1){
    51fa:	00001997          	auipc	s3,0x1
    51fe:	f7698993          	addi	s3,s3,-138 # 6170 <malloc+0x4f2>
      uint64 a = (uint64) sbrk(4096);
    5202:	6505                	lui	a0,0x1
    5204:	00000097          	auipc	ra,0x0
    5208:	6cc080e7          	jalr	1740(ra) # 58d0 <sbrk>
      if(a == 0xffffffffffffffff){
    520c:	07250763          	beq	a0,s2,527a <countfree+0xbc>
      *(char *)(a + 4096 - 1) = 1;
    5210:	6785                	lui	a5,0x1
    5212:	953e                	add	a0,a0,a5
    5214:	fe950fa3          	sb	s1,-1(a0) # fff <bigdir+0x9d>
      if(write(fds[1], "x", 1) != 1){
    5218:	8626                	mv	a2,s1
    521a:	85ce                	mv	a1,s3
    521c:	fcc42503          	lw	a0,-52(s0)
    5220:	00000097          	auipc	ra,0x0
    5224:	648080e7          	jalr	1608(ra) # 5868 <write>
    5228:	fc950de3          	beq	a0,s1,5202 <countfree+0x44>
        printf("write() failed in countfree()\n");
    522c:	00003517          	auipc	a0,0x3
    5230:	d9c50513          	addi	a0,a0,-612 # 7fc8 <malloc+0x234a>
    5234:	00001097          	auipc	ra,0x1
    5238:	98c080e7          	jalr	-1652(ra) # 5bc0 <printf>
        exit(1);
    523c:	4505                	li	a0,1
    523e:	00000097          	auipc	ra,0x0
    5242:	60a080e7          	jalr	1546(ra) # 5848 <exit>
    printf("pipe() failed in countfree()\n");
    5246:	00003517          	auipc	a0,0x3
    524a:	d4250513          	addi	a0,a0,-702 # 7f88 <malloc+0x230a>
    524e:	00001097          	auipc	ra,0x1
    5252:	972080e7          	jalr	-1678(ra) # 5bc0 <printf>
    exit(1);
    5256:	4505                	li	a0,1
    5258:	00000097          	auipc	ra,0x0
    525c:	5f0080e7          	jalr	1520(ra) # 5848 <exit>
    printf("fork failed in countfree()\n");
    5260:	00003517          	auipc	a0,0x3
    5264:	d4850513          	addi	a0,a0,-696 # 7fa8 <malloc+0x232a>
    5268:	00001097          	auipc	ra,0x1
    526c:	958080e7          	jalr	-1704(ra) # 5bc0 <printf>
    exit(1);
    5270:	4505                	li	a0,1
    5272:	00000097          	auipc	ra,0x0
    5276:	5d6080e7          	jalr	1494(ra) # 5848 <exit>
      }
    }

    exit(0);
    527a:	4501                	li	a0,0
    527c:	00000097          	auipc	ra,0x0
    5280:	5cc080e7          	jalr	1484(ra) # 5848 <exit>
  }

  close(fds[1]);
    5284:	fcc42503          	lw	a0,-52(s0)
    5288:	00000097          	auipc	ra,0x0
    528c:	5e8080e7          	jalr	1512(ra) # 5870 <close>

  int n = 0;
    5290:	4481                	li	s1,0
  while(1){
    char c;
    int cc = read(fds[0], &c, 1);
    5292:	4605                	li	a2,1
    5294:	fc740593          	addi	a1,s0,-57
    5298:	fc842503          	lw	a0,-56(s0)
    529c:	00000097          	auipc	ra,0x0
    52a0:	5c4080e7          	jalr	1476(ra) # 5860 <read>
    if(cc < 0){
    52a4:	00054563          	bltz	a0,52ae <countfree+0xf0>
      printf("read() failed in countfree()\n");
      exit(1);
    }
    if(cc == 0)
    52a8:	c105                	beqz	a0,52c8 <countfree+0x10a>
      break;
    n += 1;
    52aa:	2485                	addiw	s1,s1,1
  while(1){
    52ac:	b7dd                	j	5292 <countfree+0xd4>
      printf("read() failed in countfree()\n");
    52ae:	00003517          	auipc	a0,0x3
    52b2:	d3a50513          	addi	a0,a0,-710 # 7fe8 <malloc+0x236a>
    52b6:	00001097          	auipc	ra,0x1
    52ba:	90a080e7          	jalr	-1782(ra) # 5bc0 <printf>
      exit(1);
    52be:	4505                	li	a0,1
    52c0:	00000097          	auipc	ra,0x0
    52c4:	588080e7          	jalr	1416(ra) # 5848 <exit>
  }

  close(fds[0]);
    52c8:	fc842503          	lw	a0,-56(s0)
    52cc:	00000097          	auipc	ra,0x0
    52d0:	5a4080e7          	jalr	1444(ra) # 5870 <close>
  wait((int*)0);
    52d4:	4501                	li	a0,0
    52d6:	00000097          	auipc	ra,0x0
    52da:	57a080e7          	jalr	1402(ra) # 5850 <wait>
  
  return n;
}
    52de:	8526                	mv	a0,s1
    52e0:	70e2                	ld	ra,56(sp)
    52e2:	7442                	ld	s0,48(sp)
    52e4:	74a2                	ld	s1,40(sp)
    52e6:	7902                	ld	s2,32(sp)
    52e8:	69e2                	ld	s3,24(sp)
    52ea:	6121                	addi	sp,sp,64
    52ec:	8082                	ret

00000000000052ee <run>:

// run each test in its own process. run returns 1 if child's exit()
// indicates success.
int
run(void f(char *), char *s) {
    52ee:	7179                	addi	sp,sp,-48
    52f0:	f406                	sd	ra,40(sp)
    52f2:	f022                	sd	s0,32(sp)
    52f4:	ec26                	sd	s1,24(sp)
    52f6:	e84a                	sd	s2,16(sp)
    52f8:	1800                	addi	s0,sp,48
    52fa:	84aa                	mv	s1,a0
    52fc:	892e                	mv	s2,a1
  int pid;
  int xstatus;

  printf("test %s: ", s);
    52fe:	00003517          	auipc	a0,0x3
    5302:	d0a50513          	addi	a0,a0,-758 # 8008 <malloc+0x238a>
    5306:	00001097          	auipc	ra,0x1
    530a:	8ba080e7          	jalr	-1862(ra) # 5bc0 <printf>
  if((pid = fork()) < 0) {
    530e:	00000097          	auipc	ra,0x0
    5312:	532080e7          	jalr	1330(ra) # 5840 <fork>
    5316:	02054e63          	bltz	a0,5352 <run+0x64>
    printf("runtest: fork error\n");
    exit(1);
  }
  if(pid == 0) {
    531a:	c929                	beqz	a0,536c <run+0x7e>
    f(s);
    exit(0);
  } else {
    wait(&xstatus);
    531c:	fdc40513          	addi	a0,s0,-36
    5320:	00000097          	auipc	ra,0x0
    5324:	530080e7          	jalr	1328(ra) # 5850 <wait>
    if(xstatus != 0) 
    5328:	fdc42783          	lw	a5,-36(s0)
    532c:	c7b9                	beqz	a5,537a <run+0x8c>
      printf("FAILED\n");
    532e:	00003517          	auipc	a0,0x3
    5332:	d0250513          	addi	a0,a0,-766 # 8030 <malloc+0x23b2>
    5336:	00001097          	auipc	ra,0x1
    533a:	88a080e7          	jalr	-1910(ra) # 5bc0 <printf>
    else
      printf("OK\n");
    return xstatus == 0;
    533e:	fdc42503          	lw	a0,-36(s0)
  }
}
    5342:	00153513          	seqz	a0,a0
    5346:	70a2                	ld	ra,40(sp)
    5348:	7402                	ld	s0,32(sp)
    534a:	64e2                	ld	s1,24(sp)
    534c:	6942                	ld	s2,16(sp)
    534e:	6145                	addi	sp,sp,48
    5350:	8082                	ret
    printf("runtest: fork error\n");
    5352:	00003517          	auipc	a0,0x3
    5356:	cc650513          	addi	a0,a0,-826 # 8018 <malloc+0x239a>
    535a:	00001097          	auipc	ra,0x1
    535e:	866080e7          	jalr	-1946(ra) # 5bc0 <printf>
    exit(1);
    5362:	4505                	li	a0,1
    5364:	00000097          	auipc	ra,0x0
    5368:	4e4080e7          	jalr	1252(ra) # 5848 <exit>
    f(s);
    536c:	854a                	mv	a0,s2
    536e:	9482                	jalr	s1
    exit(0);
    5370:	4501                	li	a0,0
    5372:	00000097          	auipc	ra,0x0
    5376:	4d6080e7          	jalr	1238(ra) # 5848 <exit>
      printf("OK\n");
    537a:	00003517          	auipc	a0,0x3
    537e:	cbe50513          	addi	a0,a0,-834 # 8038 <malloc+0x23ba>
    5382:	00001097          	auipc	ra,0x1
    5386:	83e080e7          	jalr	-1986(ra) # 5bc0 <printf>
    538a:	bf55                	j	533e <run+0x50>

000000000000538c <main>:

int
main(int argc, char *argv[])
{
    538c:	bd010113          	addi	sp,sp,-1072
    5390:	42113423          	sd	ra,1064(sp)
    5394:	42813023          	sd	s0,1056(sp)
    5398:	40913c23          	sd	s1,1048(sp)
    539c:	41213823          	sd	s2,1040(sp)
    53a0:	41313423          	sd	s3,1032(sp)
    53a4:	41413023          	sd	s4,1024(sp)
    53a8:	3f513c23          	sd	s5,1016(sp)
    53ac:	3f613823          	sd	s6,1008(sp)
    53b0:	43010413          	addi	s0,sp,1072
    53b4:	89aa                	mv	s3,a0
  int continuous = 0;
  char *justone = 0;

  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    53b6:	4789                	li	a5,2
    53b8:	08f50f63          	beq	a0,a5,5456 <main+0xca>
    continuous = 1;
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    continuous = 2;
  } else if(argc == 2 && argv[1][0] != '-'){
    justone = argv[1];
  } else if(argc > 1){
    53bc:	4785                	li	a5,1
  char *justone = 0;
    53be:	4901                	li	s2,0
  } else if(argc > 1){
    53c0:	0ca7c963          	blt	a5,a0,5492 <main+0x106>
  }
  
  struct test {
    void (*f)(char *);
    char *s;
  } tests[] = {
    53c4:	00003797          	auipc	a5,0x3
    53c8:	d8c78793          	addi	a5,a5,-628 # 8150 <malloc+0x24d2>
    53cc:	bd040713          	addi	a4,s0,-1072
    53d0:	00003317          	auipc	t1,0x3
    53d4:	17030313          	addi	t1,t1,368 # 8540 <malloc+0x28c2>
    53d8:	0007b883          	ld	a7,0(a5)
    53dc:	0087b803          	ld	a6,8(a5)
    53e0:	6b88                	ld	a0,16(a5)
    53e2:	6f8c                	ld	a1,24(a5)
    53e4:	7390                	ld	a2,32(a5)
    53e6:	7794                	ld	a3,40(a5)
    53e8:	01173023          	sd	a7,0(a4)
    53ec:	01073423          	sd	a6,8(a4)
    53f0:	eb08                	sd	a0,16(a4)
    53f2:	ef0c                	sd	a1,24(a4)
    53f4:	f310                	sd	a2,32(a4)
    53f6:	f714                	sd	a3,40(a4)
    53f8:	03078793          	addi	a5,a5,48
    53fc:	03070713          	addi	a4,a4,48
    5400:	fc679ce3          	bne	a5,t1,53d8 <main+0x4c>
          exit(1);
      }
    }
  }

  printf("usertests starting\n");
    5404:	00003517          	auipc	a0,0x3
    5408:	cec50513          	addi	a0,a0,-788 # 80f0 <malloc+0x2472>
    540c:	00000097          	auipc	ra,0x0
    5410:	7b4080e7          	jalr	1972(ra) # 5bc0 <printf>
  int free0 = countfree();
    5414:	00000097          	auipc	ra,0x0
    5418:	daa080e7          	jalr	-598(ra) # 51be <countfree>
    541c:	8a2a                	mv	s4,a0
  int free1 = 0;
  int fail = 0;
  for (struct test *t = tests; t->s != 0; t++) {
    541e:	bd843503          	ld	a0,-1064(s0)
    5422:	bd040493          	addi	s1,s0,-1072
  int fail = 0;
    5426:	4981                	li	s3,0
    if((justone == 0) || strcmp(t->s, justone) == 0) {
      if(!run(t->f, t->s))
        fail = 1;
    5428:	4a85                	li	s5,1
  for (struct test *t = tests; t->s != 0; t++) {
    542a:	e55d                	bnez	a0,54d8 <main+0x14c>
  }

  if(fail){
    printf("SOME TESTS FAILED\n");
    exit(1);
  } else if((free1 = countfree()) < free0){
    542c:	00000097          	auipc	ra,0x0
    5430:	d92080e7          	jalr	-622(ra) # 51be <countfree>
    5434:	85aa                	mv	a1,a0
    5436:	0f455163          	bge	a0,s4,5518 <main+0x18c>
    printf("FAILED -- lost some free pages %d (out of %d)\n", free1, free0);
    543a:	8652                	mv	a2,s4
    543c:	00003517          	auipc	a0,0x3
    5440:	c6c50513          	addi	a0,a0,-916 # 80a8 <malloc+0x242a>
    5444:	00000097          	auipc	ra,0x0
    5448:	77c080e7          	jalr	1916(ra) # 5bc0 <printf>
    exit(1);
    544c:	4505                	li	a0,1
    544e:	00000097          	auipc	ra,0x0
    5452:	3fa080e7          	jalr	1018(ra) # 5848 <exit>
    5456:	84ae                	mv	s1,a1
  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    5458:	00003597          	auipc	a1,0x3
    545c:	be858593          	addi	a1,a1,-1048 # 8040 <malloc+0x23c2>
    5460:	6488                	ld	a0,8(s1)
    5462:	00000097          	auipc	ra,0x0
    5466:	194080e7          	jalr	404(ra) # 55f6 <strcmp>
    546a:	10050563          	beqz	a0,5574 <main+0x1e8>
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    546e:	00003597          	auipc	a1,0x3
    5472:	cba58593          	addi	a1,a1,-838 # 8128 <malloc+0x24aa>
    5476:	6488                	ld	a0,8(s1)
    5478:	00000097          	auipc	ra,0x0
    547c:	17e080e7          	jalr	382(ra) # 55f6 <strcmp>
    5480:	c97d                	beqz	a0,5576 <main+0x1ea>
  } else if(argc == 2 && argv[1][0] != '-'){
    5482:	0084b903          	ld	s2,8(s1)
    5486:	00094703          	lbu	a4,0(s2)
    548a:	02d00793          	li	a5,45
    548e:	f2f71be3          	bne	a4,a5,53c4 <main+0x38>
    printf("Usage: usertests [-c] [testname]\n");
    5492:	00003517          	auipc	a0,0x3
    5496:	bb650513          	addi	a0,a0,-1098 # 8048 <malloc+0x23ca>
    549a:	00000097          	auipc	ra,0x0
    549e:	726080e7          	jalr	1830(ra) # 5bc0 <printf>
    exit(1);
    54a2:	4505                	li	a0,1
    54a4:	00000097          	auipc	ra,0x0
    54a8:	3a4080e7          	jalr	932(ra) # 5848 <exit>
          exit(1);
    54ac:	4505                	li	a0,1
    54ae:	00000097          	auipc	ra,0x0
    54b2:	39a080e7          	jalr	922(ra) # 5848 <exit>
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    54b6:	40a905bb          	subw	a1,s2,a0
    54ba:	855a                	mv	a0,s6
    54bc:	00000097          	auipc	ra,0x0
    54c0:	704080e7          	jalr	1796(ra) # 5bc0 <printf>
        if(continuous != 2)
    54c4:	09498463          	beq	s3,s4,554c <main+0x1c0>
          exit(1);
    54c8:	4505                	li	a0,1
    54ca:	00000097          	auipc	ra,0x0
    54ce:	37e080e7          	jalr	894(ra) # 5848 <exit>
  for (struct test *t = tests; t->s != 0; t++) {
    54d2:	04c1                	addi	s1,s1,16
    54d4:	6488                	ld	a0,8(s1)
    54d6:	c115                	beqz	a0,54fa <main+0x16e>
    if((justone == 0) || strcmp(t->s, justone) == 0) {
    54d8:	00090863          	beqz	s2,54e8 <main+0x15c>
    54dc:	85ca                	mv	a1,s2
    54de:	00000097          	auipc	ra,0x0
    54e2:	118080e7          	jalr	280(ra) # 55f6 <strcmp>
    54e6:	f575                	bnez	a0,54d2 <main+0x146>
      if(!run(t->f, t->s))
    54e8:	648c                	ld	a1,8(s1)
    54ea:	6088                	ld	a0,0(s1)
    54ec:	00000097          	auipc	ra,0x0
    54f0:	e02080e7          	jalr	-510(ra) # 52ee <run>
    54f4:	fd79                	bnez	a0,54d2 <main+0x146>
        fail = 1;
    54f6:	89d6                	mv	s3,s5
    54f8:	bfe9                	j	54d2 <main+0x146>
  if(fail){
    54fa:	f20989e3          	beqz	s3,542c <main+0xa0>
    printf("SOME TESTS FAILED\n");
    54fe:	00003517          	auipc	a0,0x3
    5502:	b9250513          	addi	a0,a0,-1134 # 8090 <malloc+0x2412>
    5506:	00000097          	auipc	ra,0x0
    550a:	6ba080e7          	jalr	1722(ra) # 5bc0 <printf>
    exit(1);
    550e:	4505                	li	a0,1
    5510:	00000097          	auipc	ra,0x0
    5514:	338080e7          	jalr	824(ra) # 5848 <exit>
  } else {
    printf("ALL TESTS PASSED\n");
    5518:	00003517          	auipc	a0,0x3
    551c:	bc050513          	addi	a0,a0,-1088 # 80d8 <malloc+0x245a>
    5520:	00000097          	auipc	ra,0x0
    5524:	6a0080e7          	jalr	1696(ra) # 5bc0 <printf>
    exit(0);
    5528:	4501                	li	a0,0
    552a:	00000097          	auipc	ra,0x0
    552e:	31e080e7          	jalr	798(ra) # 5848 <exit>
        printf("SOME TESTS FAILED\n");
    5532:	8556                	mv	a0,s5
    5534:	00000097          	auipc	ra,0x0
    5538:	68c080e7          	jalr	1676(ra) # 5bc0 <printf>
        if(continuous != 2)
    553c:	f74998e3          	bne	s3,s4,54ac <main+0x120>
      int free1 = countfree();
    5540:	00000097          	auipc	ra,0x0
    5544:	c7e080e7          	jalr	-898(ra) # 51be <countfree>
      if(free1 < free0){
    5548:	f72547e3          	blt	a0,s2,54b6 <main+0x12a>
      int free0 = countfree();
    554c:	00000097          	auipc	ra,0x0
    5550:	c72080e7          	jalr	-910(ra) # 51be <countfree>
    5554:	892a                	mv	s2,a0
      for (struct test *t = tests; t->s != 0; t++) {
    5556:	bd843583          	ld	a1,-1064(s0)
    555a:	d1fd                	beqz	a1,5540 <main+0x1b4>
    555c:	bd040493          	addi	s1,s0,-1072
        if(!run(t->f, t->s)){
    5560:	6088                	ld	a0,0(s1)
    5562:	00000097          	auipc	ra,0x0
    5566:	d8c080e7          	jalr	-628(ra) # 52ee <run>
    556a:	d561                	beqz	a0,5532 <main+0x1a6>
      for (struct test *t = tests; t->s != 0; t++) {
    556c:	04c1                	addi	s1,s1,16
    556e:	648c                	ld	a1,8(s1)
    5570:	f9e5                	bnez	a1,5560 <main+0x1d4>
    5572:	b7f9                	j	5540 <main+0x1b4>
    continuous = 1;
    5574:	4985                	li	s3,1
  } tests[] = {
    5576:	00003797          	auipc	a5,0x3
    557a:	bda78793          	addi	a5,a5,-1062 # 8150 <malloc+0x24d2>
    557e:	bd040713          	addi	a4,s0,-1072
    5582:	00003317          	auipc	t1,0x3
    5586:	fbe30313          	addi	t1,t1,-66 # 8540 <malloc+0x28c2>
    558a:	0007b883          	ld	a7,0(a5)
    558e:	0087b803          	ld	a6,8(a5)
    5592:	6b88                	ld	a0,16(a5)
    5594:	6f8c                	ld	a1,24(a5)
    5596:	7390                	ld	a2,32(a5)
    5598:	7794                	ld	a3,40(a5)
    559a:	01173023          	sd	a7,0(a4)
    559e:	01073423          	sd	a6,8(a4)
    55a2:	eb08                	sd	a0,16(a4)
    55a4:	ef0c                	sd	a1,24(a4)
    55a6:	f310                	sd	a2,32(a4)
    55a8:	f714                	sd	a3,40(a4)
    55aa:	03078793          	addi	a5,a5,48
    55ae:	03070713          	addi	a4,a4,48
    55b2:	fc679ce3          	bne	a5,t1,558a <main+0x1fe>
    printf("continuous usertests starting\n");
    55b6:	00003517          	auipc	a0,0x3
    55ba:	b5250513          	addi	a0,a0,-1198 # 8108 <malloc+0x248a>
    55be:	00000097          	auipc	ra,0x0
    55c2:	602080e7          	jalr	1538(ra) # 5bc0 <printf>
        printf("SOME TESTS FAILED\n");
    55c6:	00003a97          	auipc	s5,0x3
    55ca:	acaa8a93          	addi	s5,s5,-1334 # 8090 <malloc+0x2412>
        if(continuous != 2)
    55ce:	4a09                	li	s4,2
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    55d0:	00003b17          	auipc	s6,0x3
    55d4:	aa0b0b13          	addi	s6,s6,-1376 # 8070 <malloc+0x23f2>
    55d8:	bf95                	j	554c <main+0x1c0>

00000000000055da <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
    55da:	1141                	addi	sp,sp,-16
    55dc:	e422                	sd	s0,8(sp)
    55de:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    55e0:	87aa                	mv	a5,a0
    55e2:	0585                	addi	a1,a1,1
    55e4:	0785                	addi	a5,a5,1
    55e6:	fff5c703          	lbu	a4,-1(a1)
    55ea:	fee78fa3          	sb	a4,-1(a5)
    55ee:	fb75                	bnez	a4,55e2 <strcpy+0x8>
    ;
  return os;
}
    55f0:	6422                	ld	s0,8(sp)
    55f2:	0141                	addi	sp,sp,16
    55f4:	8082                	ret

00000000000055f6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    55f6:	1141                	addi	sp,sp,-16
    55f8:	e422                	sd	s0,8(sp)
    55fa:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    55fc:	00054783          	lbu	a5,0(a0)
    5600:	cb91                	beqz	a5,5614 <strcmp+0x1e>
    5602:	0005c703          	lbu	a4,0(a1)
    5606:	00f71763          	bne	a4,a5,5614 <strcmp+0x1e>
    p++, q++;
    560a:	0505                	addi	a0,a0,1
    560c:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    560e:	00054783          	lbu	a5,0(a0)
    5612:	fbe5                	bnez	a5,5602 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    5614:	0005c503          	lbu	a0,0(a1)
}
    5618:	40a7853b          	subw	a0,a5,a0
    561c:	6422                	ld	s0,8(sp)
    561e:	0141                	addi	sp,sp,16
    5620:	8082                	ret

0000000000005622 <strlen>:

uint
strlen(const char *s)
{
    5622:	1141                	addi	sp,sp,-16
    5624:	e422                	sd	s0,8(sp)
    5626:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    5628:	00054783          	lbu	a5,0(a0)
    562c:	cf91                	beqz	a5,5648 <strlen+0x26>
    562e:	0505                	addi	a0,a0,1
    5630:	87aa                	mv	a5,a0
    5632:	4685                	li	a3,1
    5634:	9e89                	subw	a3,a3,a0
    5636:	00f6853b          	addw	a0,a3,a5
    563a:	0785                	addi	a5,a5,1
    563c:	fff7c703          	lbu	a4,-1(a5)
    5640:	fb7d                	bnez	a4,5636 <strlen+0x14>
    ;
  return n;
}
    5642:	6422                	ld	s0,8(sp)
    5644:	0141                	addi	sp,sp,16
    5646:	8082                	ret
  for(n = 0; s[n]; n++)
    5648:	4501                	li	a0,0
    564a:	bfe5                	j	5642 <strlen+0x20>

000000000000564c <memset>:

void*
memset(void *dst, int c, uint n)
{
    564c:	1141                	addi	sp,sp,-16
    564e:	e422                	sd	s0,8(sp)
    5650:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    5652:	ca19                	beqz	a2,5668 <memset+0x1c>
    5654:	87aa                	mv	a5,a0
    5656:	1602                	slli	a2,a2,0x20
    5658:	9201                	srli	a2,a2,0x20
    565a:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
    565e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    5662:	0785                	addi	a5,a5,1
    5664:	fee79de3          	bne	a5,a4,565e <memset+0x12>
  }
  return dst;
}
    5668:	6422                	ld	s0,8(sp)
    566a:	0141                	addi	sp,sp,16
    566c:	8082                	ret

000000000000566e <strchr>:

char*
strchr(const char *s, char c)
{
    566e:	1141                	addi	sp,sp,-16
    5670:	e422                	sd	s0,8(sp)
    5672:	0800                	addi	s0,sp,16
  for(; *s; s++)
    5674:	00054783          	lbu	a5,0(a0)
    5678:	cb99                	beqz	a5,568e <strchr+0x20>
    if(*s == c)
    567a:	00f58763          	beq	a1,a5,5688 <strchr+0x1a>
  for(; *s; s++)
    567e:	0505                	addi	a0,a0,1
    5680:	00054783          	lbu	a5,0(a0)
    5684:	fbfd                	bnez	a5,567a <strchr+0xc>
      return (char*)s;
  return 0;
    5686:	4501                	li	a0,0
}
    5688:	6422                	ld	s0,8(sp)
    568a:	0141                	addi	sp,sp,16
    568c:	8082                	ret
  return 0;
    568e:	4501                	li	a0,0
    5690:	bfe5                	j	5688 <strchr+0x1a>

0000000000005692 <gets>:

char*
gets(char *buf, int max)
{
    5692:	711d                	addi	sp,sp,-96
    5694:	ec86                	sd	ra,88(sp)
    5696:	e8a2                	sd	s0,80(sp)
    5698:	e4a6                	sd	s1,72(sp)
    569a:	e0ca                	sd	s2,64(sp)
    569c:	fc4e                	sd	s3,56(sp)
    569e:	f852                	sd	s4,48(sp)
    56a0:	f456                	sd	s5,40(sp)
    56a2:	f05a                	sd	s6,32(sp)
    56a4:	ec5e                	sd	s7,24(sp)
    56a6:	1080                	addi	s0,sp,96
    56a8:	8baa                	mv	s7,a0
    56aa:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    56ac:	892a                	mv	s2,a0
    56ae:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    56b0:	4aa9                	li	s5,10
    56b2:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
    56b4:	89a6                	mv	s3,s1
    56b6:	2485                	addiw	s1,s1,1
    56b8:	0344d863          	bge	s1,s4,56e8 <gets+0x56>
    cc = read(0, &c, 1);
    56bc:	4605                	li	a2,1
    56be:	faf40593          	addi	a1,s0,-81
    56c2:	4501                	li	a0,0
    56c4:	00000097          	auipc	ra,0x0
    56c8:	19c080e7          	jalr	412(ra) # 5860 <read>
    if(cc < 1)
    56cc:	00a05e63          	blez	a0,56e8 <gets+0x56>
    buf[i++] = c;
    56d0:	faf44783          	lbu	a5,-81(s0)
    56d4:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    56d8:	01578763          	beq	a5,s5,56e6 <gets+0x54>
    56dc:	0905                	addi	s2,s2,1
    56de:	fd679be3          	bne	a5,s6,56b4 <gets+0x22>
  for(i=0; i+1 < max; ){
    56e2:	89a6                	mv	s3,s1
    56e4:	a011                	j	56e8 <gets+0x56>
    56e6:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    56e8:	99de                	add	s3,s3,s7
    56ea:	00098023          	sb	zero,0(s3)
  return buf;
}
    56ee:	855e                	mv	a0,s7
    56f0:	60e6                	ld	ra,88(sp)
    56f2:	6446                	ld	s0,80(sp)
    56f4:	64a6                	ld	s1,72(sp)
    56f6:	6906                	ld	s2,64(sp)
    56f8:	79e2                	ld	s3,56(sp)
    56fa:	7a42                	ld	s4,48(sp)
    56fc:	7aa2                	ld	s5,40(sp)
    56fe:	7b02                	ld	s6,32(sp)
    5700:	6be2                	ld	s7,24(sp)
    5702:	6125                	addi	sp,sp,96
    5704:	8082                	ret

0000000000005706 <stat>:

int
stat(const char *n, struct stat *st)
{
    5706:	1101                	addi	sp,sp,-32
    5708:	ec06                	sd	ra,24(sp)
    570a:	e822                	sd	s0,16(sp)
    570c:	e426                	sd	s1,8(sp)
    570e:	e04a                	sd	s2,0(sp)
    5710:	1000                	addi	s0,sp,32
    5712:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    5714:	4581                	li	a1,0
    5716:	00000097          	auipc	ra,0x0
    571a:	172080e7          	jalr	370(ra) # 5888 <open>
  if(fd < 0)
    571e:	02054563          	bltz	a0,5748 <stat+0x42>
    5722:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    5724:	85ca                	mv	a1,s2
    5726:	00000097          	auipc	ra,0x0
    572a:	17a080e7          	jalr	378(ra) # 58a0 <fstat>
    572e:	892a                	mv	s2,a0
  close(fd);
    5730:	8526                	mv	a0,s1
    5732:	00000097          	auipc	ra,0x0
    5736:	13e080e7          	jalr	318(ra) # 5870 <close>
  return r;
}
    573a:	854a                	mv	a0,s2
    573c:	60e2                	ld	ra,24(sp)
    573e:	6442                	ld	s0,16(sp)
    5740:	64a2                	ld	s1,8(sp)
    5742:	6902                	ld	s2,0(sp)
    5744:	6105                	addi	sp,sp,32
    5746:	8082                	ret
    return -1;
    5748:	597d                	li	s2,-1
    574a:	bfc5                	j	573a <stat+0x34>

000000000000574c <atoi>:

int
atoi(const char *s)
{
    574c:	1141                	addi	sp,sp,-16
    574e:	e422                	sd	s0,8(sp)
    5750:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    5752:	00054603          	lbu	a2,0(a0)
    5756:	fd06079b          	addiw	a5,a2,-48
    575a:	0ff7f793          	andi	a5,a5,255
    575e:	4725                	li	a4,9
    5760:	02f76963          	bltu	a4,a5,5792 <atoi+0x46>
    5764:	86aa                	mv	a3,a0
  n = 0;
    5766:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
    5768:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
    576a:	0685                	addi	a3,a3,1
    576c:	0025179b          	slliw	a5,a0,0x2
    5770:	9fa9                	addw	a5,a5,a0
    5772:	0017979b          	slliw	a5,a5,0x1
    5776:	9fb1                	addw	a5,a5,a2
    5778:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
    577c:	0006c603          	lbu	a2,0(a3)
    5780:	fd06071b          	addiw	a4,a2,-48
    5784:	0ff77713          	andi	a4,a4,255
    5788:	fee5f1e3          	bgeu	a1,a4,576a <atoi+0x1e>
  return n;
}
    578c:	6422                	ld	s0,8(sp)
    578e:	0141                	addi	sp,sp,16
    5790:	8082                	ret
  n = 0;
    5792:	4501                	li	a0,0
    5794:	bfe5                	j	578c <atoi+0x40>

0000000000005796 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    5796:	1141                	addi	sp,sp,-16
    5798:	e422                	sd	s0,8(sp)
    579a:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    579c:	02b57463          	bgeu	a0,a1,57c4 <memmove+0x2e>
    while(n-- > 0)
    57a0:	00c05f63          	blez	a2,57be <memmove+0x28>
    57a4:	1602                	slli	a2,a2,0x20
    57a6:	9201                	srli	a2,a2,0x20
    57a8:	00c507b3          	add	a5,a0,a2
  dst = vdst;
    57ac:	872a                	mv	a4,a0
      *dst++ = *src++;
    57ae:	0585                	addi	a1,a1,1
    57b0:	0705                	addi	a4,a4,1
    57b2:	fff5c683          	lbu	a3,-1(a1)
    57b6:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    57ba:	fee79ae3          	bne	a5,a4,57ae <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    57be:	6422                	ld	s0,8(sp)
    57c0:	0141                	addi	sp,sp,16
    57c2:	8082                	ret
    dst += n;
    57c4:	00c50733          	add	a4,a0,a2
    src += n;
    57c8:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    57ca:	fec05ae3          	blez	a2,57be <memmove+0x28>
    57ce:	fff6079b          	addiw	a5,a2,-1
    57d2:	1782                	slli	a5,a5,0x20
    57d4:	9381                	srli	a5,a5,0x20
    57d6:	fff7c793          	not	a5,a5
    57da:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    57dc:	15fd                	addi	a1,a1,-1
    57de:	177d                	addi	a4,a4,-1
    57e0:	0005c683          	lbu	a3,0(a1)
    57e4:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    57e8:	fee79ae3          	bne	a5,a4,57dc <memmove+0x46>
    57ec:	bfc9                	j	57be <memmove+0x28>

00000000000057ee <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    57ee:	1141                	addi	sp,sp,-16
    57f0:	e422                	sd	s0,8(sp)
    57f2:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    57f4:	ca05                	beqz	a2,5824 <memcmp+0x36>
    57f6:	fff6069b          	addiw	a3,a2,-1
    57fa:	1682                	slli	a3,a3,0x20
    57fc:	9281                	srli	a3,a3,0x20
    57fe:	0685                	addi	a3,a3,1
    5800:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
    5802:	00054783          	lbu	a5,0(a0)
    5806:	0005c703          	lbu	a4,0(a1)
    580a:	00e79863          	bne	a5,a4,581a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
    580e:	0505                	addi	a0,a0,1
    p2++;
    5810:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    5812:	fed518e3          	bne	a0,a3,5802 <memcmp+0x14>
  }
  return 0;
    5816:	4501                	li	a0,0
    5818:	a019                	j	581e <memcmp+0x30>
      return *p1 - *p2;
    581a:	40e7853b          	subw	a0,a5,a4
}
    581e:	6422                	ld	s0,8(sp)
    5820:	0141                	addi	sp,sp,16
    5822:	8082                	ret
  return 0;
    5824:	4501                	li	a0,0
    5826:	bfe5                	j	581e <memcmp+0x30>

0000000000005828 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    5828:	1141                	addi	sp,sp,-16
    582a:	e406                	sd	ra,8(sp)
    582c:	e022                	sd	s0,0(sp)
    582e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    5830:	00000097          	auipc	ra,0x0
    5834:	f66080e7          	jalr	-154(ra) # 5796 <memmove>
}
    5838:	60a2                	ld	ra,8(sp)
    583a:	6402                	ld	s0,0(sp)
    583c:	0141                	addi	sp,sp,16
    583e:	8082                	ret

0000000000005840 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    5840:	4885                	li	a7,1
 ecall
    5842:	00000073          	ecall
 ret
    5846:	8082                	ret

0000000000005848 <exit>:
.global exit
exit:
 li a7, SYS_exit
    5848:	4889                	li	a7,2
 ecall
    584a:	00000073          	ecall
 ret
    584e:	8082                	ret

0000000000005850 <wait>:
.global wait
wait:
 li a7, SYS_wait
    5850:	488d                	li	a7,3
 ecall
    5852:	00000073          	ecall
 ret
    5856:	8082                	ret

0000000000005858 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    5858:	4891                	li	a7,4
 ecall
    585a:	00000073          	ecall
 ret
    585e:	8082                	ret

0000000000005860 <read>:
.global read
read:
 li a7, SYS_read
    5860:	4895                	li	a7,5
 ecall
    5862:	00000073          	ecall
 ret
    5866:	8082                	ret

0000000000005868 <write>:
.global write
write:
 li a7, SYS_write
    5868:	48c1                	li	a7,16
 ecall
    586a:	00000073          	ecall
 ret
    586e:	8082                	ret

0000000000005870 <close>:
.global close
close:
 li a7, SYS_close
    5870:	48d5                	li	a7,21
 ecall
    5872:	00000073          	ecall
 ret
    5876:	8082                	ret

0000000000005878 <kill>:
.global kill
kill:
 li a7, SYS_kill
    5878:	4899                	li	a7,6
 ecall
    587a:	00000073          	ecall
 ret
    587e:	8082                	ret

0000000000005880 <exec>:
.global exec
exec:
 li a7, SYS_exec
    5880:	489d                	li	a7,7
 ecall
    5882:	00000073          	ecall
 ret
    5886:	8082                	ret

0000000000005888 <open>:
.global open
open:
 li a7, SYS_open
    5888:	48bd                	li	a7,15
 ecall
    588a:	00000073          	ecall
 ret
    588e:	8082                	ret

0000000000005890 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    5890:	48c5                	li	a7,17
 ecall
    5892:	00000073          	ecall
 ret
    5896:	8082                	ret

0000000000005898 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    5898:	48c9                	li	a7,18
 ecall
    589a:	00000073          	ecall
 ret
    589e:	8082                	ret

00000000000058a0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    58a0:	48a1                	li	a7,8
 ecall
    58a2:	00000073          	ecall
 ret
    58a6:	8082                	ret

00000000000058a8 <link>:
.global link
link:
 li a7, SYS_link
    58a8:	48cd                	li	a7,19
 ecall
    58aa:	00000073          	ecall
 ret
    58ae:	8082                	ret

00000000000058b0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    58b0:	48d1                	li	a7,20
 ecall
    58b2:	00000073          	ecall
 ret
    58b6:	8082                	ret

00000000000058b8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    58b8:	48a5                	li	a7,9
 ecall
    58ba:	00000073          	ecall
 ret
    58be:	8082                	ret

00000000000058c0 <dup>:
.global dup
dup:
 li a7, SYS_dup
    58c0:	48a9                	li	a7,10
 ecall
    58c2:	00000073          	ecall
 ret
    58c6:	8082                	ret

00000000000058c8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    58c8:	48ad                	li	a7,11
 ecall
    58ca:	00000073          	ecall
 ret
    58ce:	8082                	ret

00000000000058d0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    58d0:	48b1                	li	a7,12
 ecall
    58d2:	00000073          	ecall
 ret
    58d6:	8082                	ret

00000000000058d8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    58d8:	48b5                	li	a7,13
 ecall
    58da:	00000073          	ecall
 ret
    58de:	8082                	ret

00000000000058e0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    58e0:	48b9                	li	a7,14
 ecall
    58e2:	00000073          	ecall
 ret
    58e6:	8082                	ret

00000000000058e8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    58e8:	1101                	addi	sp,sp,-32
    58ea:	ec06                	sd	ra,24(sp)
    58ec:	e822                	sd	s0,16(sp)
    58ee:	1000                	addi	s0,sp,32
    58f0:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    58f4:	4605                	li	a2,1
    58f6:	fef40593          	addi	a1,s0,-17
    58fa:	00000097          	auipc	ra,0x0
    58fe:	f6e080e7          	jalr	-146(ra) # 5868 <write>
}
    5902:	60e2                	ld	ra,24(sp)
    5904:	6442                	ld	s0,16(sp)
    5906:	6105                	addi	sp,sp,32
    5908:	8082                	ret

000000000000590a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    590a:	7139                	addi	sp,sp,-64
    590c:	fc06                	sd	ra,56(sp)
    590e:	f822                	sd	s0,48(sp)
    5910:	f426                	sd	s1,40(sp)
    5912:	f04a                	sd	s2,32(sp)
    5914:	ec4e                	sd	s3,24(sp)
    5916:	0080                	addi	s0,sp,64
    5918:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    591a:	c299                	beqz	a3,5920 <printint+0x16>
    591c:	0805c863          	bltz	a1,59ac <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    5920:	2581                	sext.w	a1,a1
  neg = 0;
    5922:	4881                	li	a7,0
    5924:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
    5928:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
    592a:	2601                	sext.w	a2,a2
    592c:	00003517          	auipc	a0,0x3
    5930:	c1c50513          	addi	a0,a0,-996 # 8548 <digits>
    5934:	883a                	mv	a6,a4
    5936:	2705                	addiw	a4,a4,1
    5938:	02c5f7bb          	remuw	a5,a1,a2
    593c:	1782                	slli	a5,a5,0x20
    593e:	9381                	srli	a5,a5,0x20
    5940:	97aa                	add	a5,a5,a0
    5942:	0007c783          	lbu	a5,0(a5)
    5946:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
    594a:	0005879b          	sext.w	a5,a1
    594e:	02c5d5bb          	divuw	a1,a1,a2
    5952:	0685                	addi	a3,a3,1
    5954:	fec7f0e3          	bgeu	a5,a2,5934 <printint+0x2a>
  if(neg)
    5958:	00088b63          	beqz	a7,596e <printint+0x64>
    buf[i++] = '-';
    595c:	fd040793          	addi	a5,s0,-48
    5960:	973e                	add	a4,a4,a5
    5962:	02d00793          	li	a5,45
    5966:	fef70823          	sb	a5,-16(a4)
    596a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    596e:	02e05863          	blez	a4,599e <printint+0x94>
    5972:	fc040793          	addi	a5,s0,-64
    5976:	00e78933          	add	s2,a5,a4
    597a:	fff78993          	addi	s3,a5,-1
    597e:	99ba                	add	s3,s3,a4
    5980:	377d                	addiw	a4,a4,-1
    5982:	1702                	slli	a4,a4,0x20
    5984:	9301                	srli	a4,a4,0x20
    5986:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
    598a:	fff94583          	lbu	a1,-1(s2)
    598e:	8526                	mv	a0,s1
    5990:	00000097          	auipc	ra,0x0
    5994:	f58080e7          	jalr	-168(ra) # 58e8 <putc>
  while(--i >= 0)
    5998:	197d                	addi	s2,s2,-1
    599a:	ff3918e3          	bne	s2,s3,598a <printint+0x80>
}
    599e:	70e2                	ld	ra,56(sp)
    59a0:	7442                	ld	s0,48(sp)
    59a2:	74a2                	ld	s1,40(sp)
    59a4:	7902                	ld	s2,32(sp)
    59a6:	69e2                	ld	s3,24(sp)
    59a8:	6121                	addi	sp,sp,64
    59aa:	8082                	ret
    x = -xx;
    59ac:	40b005bb          	negw	a1,a1
    neg = 1;
    59b0:	4885                	li	a7,1
    x = -xx;
    59b2:	bf8d                	j	5924 <printint+0x1a>

00000000000059b4 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    59b4:	7119                	addi	sp,sp,-128
    59b6:	fc86                	sd	ra,120(sp)
    59b8:	f8a2                	sd	s0,112(sp)
    59ba:	f4a6                	sd	s1,104(sp)
    59bc:	f0ca                	sd	s2,96(sp)
    59be:	ecce                	sd	s3,88(sp)
    59c0:	e8d2                	sd	s4,80(sp)
    59c2:	e4d6                	sd	s5,72(sp)
    59c4:	e0da                	sd	s6,64(sp)
    59c6:	fc5e                	sd	s7,56(sp)
    59c8:	f862                	sd	s8,48(sp)
    59ca:	f466                	sd	s9,40(sp)
    59cc:	f06a                	sd	s10,32(sp)
    59ce:	ec6e                	sd	s11,24(sp)
    59d0:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    59d2:	0005c903          	lbu	s2,0(a1)
    59d6:	18090f63          	beqz	s2,5b74 <vprintf+0x1c0>
    59da:	8aaa                	mv	s5,a0
    59dc:	8b32                	mv	s6,a2
    59de:	00158493          	addi	s1,a1,1
  state = 0;
    59e2:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    59e4:	02500a13          	li	s4,37
      if(c == 'd'){
    59e8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
    59ec:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
    59f0:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
    59f4:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    59f8:	00003b97          	auipc	s7,0x3
    59fc:	b50b8b93          	addi	s7,s7,-1200 # 8548 <digits>
    5a00:	a839                	j	5a1e <vprintf+0x6a>
        putc(fd, c);
    5a02:	85ca                	mv	a1,s2
    5a04:	8556                	mv	a0,s5
    5a06:	00000097          	auipc	ra,0x0
    5a0a:	ee2080e7          	jalr	-286(ra) # 58e8 <putc>
    5a0e:	a019                	j	5a14 <vprintf+0x60>
    } else if(state == '%'){
    5a10:	01498f63          	beq	s3,s4,5a2e <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
    5a14:	0485                	addi	s1,s1,1
    5a16:	fff4c903          	lbu	s2,-1(s1)
    5a1a:	14090d63          	beqz	s2,5b74 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
    5a1e:	0009079b          	sext.w	a5,s2
    if(state == 0){
    5a22:	fe0997e3          	bnez	s3,5a10 <vprintf+0x5c>
      if(c == '%'){
    5a26:	fd479ee3          	bne	a5,s4,5a02 <vprintf+0x4e>
        state = '%';
    5a2a:	89be                	mv	s3,a5
    5a2c:	b7e5                	j	5a14 <vprintf+0x60>
      if(c == 'd'){
    5a2e:	05878063          	beq	a5,s8,5a6e <vprintf+0xba>
      } else if(c == 'l') {
    5a32:	05978c63          	beq	a5,s9,5a8a <vprintf+0xd6>
      } else if(c == 'x') {
    5a36:	07a78863          	beq	a5,s10,5aa6 <vprintf+0xf2>
      } else if(c == 'p') {
    5a3a:	09b78463          	beq	a5,s11,5ac2 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
    5a3e:	07300713          	li	a4,115
    5a42:	0ce78663          	beq	a5,a4,5b0e <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    5a46:	06300713          	li	a4,99
    5a4a:	0ee78e63          	beq	a5,a4,5b46 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
    5a4e:	11478863          	beq	a5,s4,5b5e <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    5a52:	85d2                	mv	a1,s4
    5a54:	8556                	mv	a0,s5
    5a56:	00000097          	auipc	ra,0x0
    5a5a:	e92080e7          	jalr	-366(ra) # 58e8 <putc>
        putc(fd, c);
    5a5e:	85ca                	mv	a1,s2
    5a60:	8556                	mv	a0,s5
    5a62:	00000097          	auipc	ra,0x0
    5a66:	e86080e7          	jalr	-378(ra) # 58e8 <putc>
      }
      state = 0;
    5a6a:	4981                	li	s3,0
    5a6c:	b765                	j	5a14 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
    5a6e:	008b0913          	addi	s2,s6,8
    5a72:	4685                	li	a3,1
    5a74:	4629                	li	a2,10
    5a76:	000b2583          	lw	a1,0(s6)
    5a7a:	8556                	mv	a0,s5
    5a7c:	00000097          	auipc	ra,0x0
    5a80:	e8e080e7          	jalr	-370(ra) # 590a <printint>
    5a84:	8b4a                	mv	s6,s2
      state = 0;
    5a86:	4981                	li	s3,0
    5a88:	b771                	j	5a14 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    5a8a:	008b0913          	addi	s2,s6,8
    5a8e:	4681                	li	a3,0
    5a90:	4629                	li	a2,10
    5a92:	000b2583          	lw	a1,0(s6)
    5a96:	8556                	mv	a0,s5
    5a98:	00000097          	auipc	ra,0x0
    5a9c:	e72080e7          	jalr	-398(ra) # 590a <printint>
    5aa0:	8b4a                	mv	s6,s2
      state = 0;
    5aa2:	4981                	li	s3,0
    5aa4:	bf85                	j	5a14 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    5aa6:	008b0913          	addi	s2,s6,8
    5aaa:	4681                	li	a3,0
    5aac:	4641                	li	a2,16
    5aae:	000b2583          	lw	a1,0(s6)
    5ab2:	8556                	mv	a0,s5
    5ab4:	00000097          	auipc	ra,0x0
    5ab8:	e56080e7          	jalr	-426(ra) # 590a <printint>
    5abc:	8b4a                	mv	s6,s2
      state = 0;
    5abe:	4981                	li	s3,0
    5ac0:	bf91                	j	5a14 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    5ac2:	008b0793          	addi	a5,s6,8
    5ac6:	f8f43423          	sd	a5,-120(s0)
    5aca:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    5ace:	03000593          	li	a1,48
    5ad2:	8556                	mv	a0,s5
    5ad4:	00000097          	auipc	ra,0x0
    5ad8:	e14080e7          	jalr	-492(ra) # 58e8 <putc>
  putc(fd, 'x');
    5adc:	85ea                	mv	a1,s10
    5ade:	8556                	mv	a0,s5
    5ae0:	00000097          	auipc	ra,0x0
    5ae4:	e08080e7          	jalr	-504(ra) # 58e8 <putc>
    5ae8:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    5aea:	03c9d793          	srli	a5,s3,0x3c
    5aee:	97de                	add	a5,a5,s7
    5af0:	0007c583          	lbu	a1,0(a5)
    5af4:	8556                	mv	a0,s5
    5af6:	00000097          	auipc	ra,0x0
    5afa:	df2080e7          	jalr	-526(ra) # 58e8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    5afe:	0992                	slli	s3,s3,0x4
    5b00:	397d                	addiw	s2,s2,-1
    5b02:	fe0914e3          	bnez	s2,5aea <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
    5b06:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    5b0a:	4981                	li	s3,0
    5b0c:	b721                	j	5a14 <vprintf+0x60>
        s = va_arg(ap, char*);
    5b0e:	008b0993          	addi	s3,s6,8
    5b12:	000b3903          	ld	s2,0(s6)
        if(s == 0)
    5b16:	02090163          	beqz	s2,5b38 <vprintf+0x184>
        while(*s != 0){
    5b1a:	00094583          	lbu	a1,0(s2)
    5b1e:	c9a1                	beqz	a1,5b6e <vprintf+0x1ba>
          putc(fd, *s);
    5b20:	8556                	mv	a0,s5
    5b22:	00000097          	auipc	ra,0x0
    5b26:	dc6080e7          	jalr	-570(ra) # 58e8 <putc>
          s++;
    5b2a:	0905                	addi	s2,s2,1
        while(*s != 0){
    5b2c:	00094583          	lbu	a1,0(s2)
    5b30:	f9e5                	bnez	a1,5b20 <vprintf+0x16c>
        s = va_arg(ap, char*);
    5b32:	8b4e                	mv	s6,s3
      state = 0;
    5b34:	4981                	li	s3,0
    5b36:	bdf9                	j	5a14 <vprintf+0x60>
          s = "(null)";
    5b38:	00003917          	auipc	s2,0x3
    5b3c:	a0890913          	addi	s2,s2,-1528 # 8540 <malloc+0x28c2>
        while(*s != 0){
    5b40:	02800593          	li	a1,40
    5b44:	bff1                	j	5b20 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
    5b46:	008b0913          	addi	s2,s6,8
    5b4a:	000b4583          	lbu	a1,0(s6)
    5b4e:	8556                	mv	a0,s5
    5b50:	00000097          	auipc	ra,0x0
    5b54:	d98080e7          	jalr	-616(ra) # 58e8 <putc>
    5b58:	8b4a                	mv	s6,s2
      state = 0;
    5b5a:	4981                	li	s3,0
    5b5c:	bd65                	j	5a14 <vprintf+0x60>
        putc(fd, c);
    5b5e:	85d2                	mv	a1,s4
    5b60:	8556                	mv	a0,s5
    5b62:	00000097          	auipc	ra,0x0
    5b66:	d86080e7          	jalr	-634(ra) # 58e8 <putc>
      state = 0;
    5b6a:	4981                	li	s3,0
    5b6c:	b565                	j	5a14 <vprintf+0x60>
        s = va_arg(ap, char*);
    5b6e:	8b4e                	mv	s6,s3
      state = 0;
    5b70:	4981                	li	s3,0
    5b72:	b54d                	j	5a14 <vprintf+0x60>
    }
  }
}
    5b74:	70e6                	ld	ra,120(sp)
    5b76:	7446                	ld	s0,112(sp)
    5b78:	74a6                	ld	s1,104(sp)
    5b7a:	7906                	ld	s2,96(sp)
    5b7c:	69e6                	ld	s3,88(sp)
    5b7e:	6a46                	ld	s4,80(sp)
    5b80:	6aa6                	ld	s5,72(sp)
    5b82:	6b06                	ld	s6,64(sp)
    5b84:	7be2                	ld	s7,56(sp)
    5b86:	7c42                	ld	s8,48(sp)
    5b88:	7ca2                	ld	s9,40(sp)
    5b8a:	7d02                	ld	s10,32(sp)
    5b8c:	6de2                	ld	s11,24(sp)
    5b8e:	6109                	addi	sp,sp,128
    5b90:	8082                	ret

0000000000005b92 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    5b92:	715d                	addi	sp,sp,-80
    5b94:	ec06                	sd	ra,24(sp)
    5b96:	e822                	sd	s0,16(sp)
    5b98:	1000                	addi	s0,sp,32
    5b9a:	e010                	sd	a2,0(s0)
    5b9c:	e414                	sd	a3,8(s0)
    5b9e:	e818                	sd	a4,16(s0)
    5ba0:	ec1c                	sd	a5,24(s0)
    5ba2:	03043023          	sd	a6,32(s0)
    5ba6:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    5baa:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    5bae:	8622                	mv	a2,s0
    5bb0:	00000097          	auipc	ra,0x0
    5bb4:	e04080e7          	jalr	-508(ra) # 59b4 <vprintf>
}
    5bb8:	60e2                	ld	ra,24(sp)
    5bba:	6442                	ld	s0,16(sp)
    5bbc:	6161                	addi	sp,sp,80
    5bbe:	8082                	ret

0000000000005bc0 <printf>:

void
printf(const char *fmt, ...)
{
    5bc0:	711d                	addi	sp,sp,-96
    5bc2:	ec06                	sd	ra,24(sp)
    5bc4:	e822                	sd	s0,16(sp)
    5bc6:	1000                	addi	s0,sp,32
    5bc8:	e40c                	sd	a1,8(s0)
    5bca:	e810                	sd	a2,16(s0)
    5bcc:	ec14                	sd	a3,24(s0)
    5bce:	f018                	sd	a4,32(s0)
    5bd0:	f41c                	sd	a5,40(s0)
    5bd2:	03043823          	sd	a6,48(s0)
    5bd6:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    5bda:	00840613          	addi	a2,s0,8
    5bde:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    5be2:	85aa                	mv	a1,a0
    5be4:	4505                	li	a0,1
    5be6:	00000097          	auipc	ra,0x0
    5bea:	dce080e7          	jalr	-562(ra) # 59b4 <vprintf>
}
    5bee:	60e2                	ld	ra,24(sp)
    5bf0:	6442                	ld	s0,16(sp)
    5bf2:	6125                	addi	sp,sp,96
    5bf4:	8082                	ret

0000000000005bf6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    5bf6:	1141                	addi	sp,sp,-16
    5bf8:	e422                	sd	s0,8(sp)
    5bfa:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    5bfc:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5c00:	00003797          	auipc	a5,0x3
    5c04:	9687b783          	ld	a5,-1688(a5) # 8568 <freep>
    5c08:	a805                	j	5c38 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    5c0a:	4618                	lw	a4,8(a2)
    5c0c:	9db9                	addw	a1,a1,a4
    5c0e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    5c12:	6398                	ld	a4,0(a5)
    5c14:	6318                	ld	a4,0(a4)
    5c16:	fee53823          	sd	a4,-16(a0)
    5c1a:	a091                	j	5c5e <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    5c1c:	ff852703          	lw	a4,-8(a0)
    5c20:	9e39                	addw	a2,a2,a4
    5c22:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    5c24:	ff053703          	ld	a4,-16(a0)
    5c28:	e398                	sd	a4,0(a5)
    5c2a:	a099                	j	5c70 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5c2c:	6398                	ld	a4,0(a5)
    5c2e:	00e7e463          	bltu	a5,a4,5c36 <free+0x40>
    5c32:	00e6ea63          	bltu	a3,a4,5c46 <free+0x50>
{
    5c36:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5c38:	fed7fae3          	bgeu	a5,a3,5c2c <free+0x36>
    5c3c:	6398                	ld	a4,0(a5)
    5c3e:	00e6e463          	bltu	a3,a4,5c46 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5c42:	fee7eae3          	bltu	a5,a4,5c36 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
    5c46:	ff852583          	lw	a1,-8(a0)
    5c4a:	6390                	ld	a2,0(a5)
    5c4c:	02059713          	slli	a4,a1,0x20
    5c50:	9301                	srli	a4,a4,0x20
    5c52:	0712                	slli	a4,a4,0x4
    5c54:	9736                	add	a4,a4,a3
    5c56:	fae60ae3          	beq	a2,a4,5c0a <free+0x14>
    bp->s.ptr = p->s.ptr;
    5c5a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    5c5e:	4790                	lw	a2,8(a5)
    5c60:	02061713          	slli	a4,a2,0x20
    5c64:	9301                	srli	a4,a4,0x20
    5c66:	0712                	slli	a4,a4,0x4
    5c68:	973e                	add	a4,a4,a5
    5c6a:	fae689e3          	beq	a3,a4,5c1c <free+0x26>
  } else
    p->s.ptr = bp;
    5c6e:	e394                	sd	a3,0(a5)
  freep = p;
    5c70:	00003717          	auipc	a4,0x3
    5c74:	8ef73c23          	sd	a5,-1800(a4) # 8568 <freep>
}
    5c78:	6422                	ld	s0,8(sp)
    5c7a:	0141                	addi	sp,sp,16
    5c7c:	8082                	ret

0000000000005c7e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    5c7e:	7139                	addi	sp,sp,-64
    5c80:	fc06                	sd	ra,56(sp)
    5c82:	f822                	sd	s0,48(sp)
    5c84:	f426                	sd	s1,40(sp)
    5c86:	f04a                	sd	s2,32(sp)
    5c88:	ec4e                	sd	s3,24(sp)
    5c8a:	e852                	sd	s4,16(sp)
    5c8c:	e456                	sd	s5,8(sp)
    5c8e:	e05a                	sd	s6,0(sp)
    5c90:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5c92:	02051493          	slli	s1,a0,0x20
    5c96:	9081                	srli	s1,s1,0x20
    5c98:	04bd                	addi	s1,s1,15
    5c9a:	8091                	srli	s1,s1,0x4
    5c9c:	0014899b          	addiw	s3,s1,1
    5ca0:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    5ca2:	00003517          	auipc	a0,0x3
    5ca6:	8c653503          	ld	a0,-1850(a0) # 8568 <freep>
    5caa:	c515                	beqz	a0,5cd6 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5cac:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    5cae:	4798                	lw	a4,8(a5)
    5cb0:	02977f63          	bgeu	a4,s1,5cee <malloc+0x70>
    5cb4:	8a4e                	mv	s4,s3
    5cb6:	0009871b          	sext.w	a4,s3
    5cba:	6685                	lui	a3,0x1
    5cbc:	00d77363          	bgeu	a4,a3,5cc2 <malloc+0x44>
    5cc0:	6a05                	lui	s4,0x1
    5cc2:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    5cc6:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    5cca:	00003917          	auipc	s2,0x3
    5cce:	89e90913          	addi	s2,s2,-1890 # 8568 <freep>
  if(p == (char*)-1)
    5cd2:	5afd                	li	s5,-1
    5cd4:	a88d                	j	5d46 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
    5cd6:	00009797          	auipc	a5,0x9
    5cda:	0b278793          	addi	a5,a5,178 # ed88 <base>
    5cde:	00003717          	auipc	a4,0x3
    5ce2:	88f73523          	sd	a5,-1910(a4) # 8568 <freep>
    5ce6:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    5ce8:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    5cec:	b7e1                	j	5cb4 <malloc+0x36>
      if(p->s.size == nunits)
    5cee:	02e48b63          	beq	s1,a4,5d24 <malloc+0xa6>
        p->s.size -= nunits;
    5cf2:	4137073b          	subw	a4,a4,s3
    5cf6:	c798                	sw	a4,8(a5)
        p += p->s.size;
    5cf8:	1702                	slli	a4,a4,0x20
    5cfa:	9301                	srli	a4,a4,0x20
    5cfc:	0712                	slli	a4,a4,0x4
    5cfe:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    5d00:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    5d04:	00003717          	auipc	a4,0x3
    5d08:	86a73223          	sd	a0,-1948(a4) # 8568 <freep>
      return (void*)(p + 1);
    5d0c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    5d10:	70e2                	ld	ra,56(sp)
    5d12:	7442                	ld	s0,48(sp)
    5d14:	74a2                	ld	s1,40(sp)
    5d16:	7902                	ld	s2,32(sp)
    5d18:	69e2                	ld	s3,24(sp)
    5d1a:	6a42                	ld	s4,16(sp)
    5d1c:	6aa2                	ld	s5,8(sp)
    5d1e:	6b02                	ld	s6,0(sp)
    5d20:	6121                	addi	sp,sp,64
    5d22:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    5d24:	6398                	ld	a4,0(a5)
    5d26:	e118                	sd	a4,0(a0)
    5d28:	bff1                	j	5d04 <malloc+0x86>
  hp->s.size = nu;
    5d2a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    5d2e:	0541                	addi	a0,a0,16
    5d30:	00000097          	auipc	ra,0x0
    5d34:	ec6080e7          	jalr	-314(ra) # 5bf6 <free>
  return freep;
    5d38:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    5d3c:	d971                	beqz	a0,5d10 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5d3e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    5d40:	4798                	lw	a4,8(a5)
    5d42:	fa9776e3          	bgeu	a4,s1,5cee <malloc+0x70>
    if(p == freep)
    5d46:	00093703          	ld	a4,0(s2)
    5d4a:	853e                	mv	a0,a5
    5d4c:	fef719e3          	bne	a4,a5,5d3e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
    5d50:	8552                	mv	a0,s4
    5d52:	00000097          	auipc	ra,0x0
    5d56:	b7e080e7          	jalr	-1154(ra) # 58d0 <sbrk>
  if(p == (char*)-1)
    5d5a:	fd5518e3          	bne	a0,s5,5d2a <malloc+0xac>
        return 0;
    5d5e:	4501                	li	a0,0
    5d60:	bf45                	j	5d10 <malloc+0x92>
