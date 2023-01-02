
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	e426                	sd	s1,8(sp)
       8:	e04a                	sd	s2,0(sp)
       a:	1000                	addi	s0,sp,32
       c:	84aa                	mv	s1,a0
       e:	892e                	mv	s2,a1
  fprintf(2, "$ ");
      10:	00001597          	auipc	a1,0x1
      14:	2f058593          	addi	a1,a1,752 # 1300 <malloc+0xe4>
      18:	4509                	li	a0,2
      1a:	00001097          	auipc	ra,0x1
      1e:	116080e7          	jalr	278(ra) # 1130 <fprintf>
  memset(buf, 0, nbuf);
      22:	864a                	mv	a2,s2
      24:	4581                	li	a1,0
      26:	8526                	mv	a0,s1
      28:	00001097          	auipc	ra,0x1
      2c:	bc2080e7          	jalr	-1086(ra) # bea <memset>
//  gets gets a string including the char '\n'.
  gets(buf, nbuf);
      30:	85ca                	mv	a1,s2
      32:	8526                	mv	a0,s1
      34:	00001097          	auipc	ra,0x1
      38:	bfc080e7          	jalr	-1028(ra) # c30 <gets>
  if(buf[0] == 0) // EOF
      3c:	0004c503          	lbu	a0,0(s1)
      40:	00153513          	seqz	a0,a0
    return -1;
  return 0;
}
      44:	40a00533          	neg	a0,a0
      48:	60e2                	ld	ra,24(sp)
      4a:	6442                	ld	s0,16(sp)
      4c:	64a2                	ld	s1,8(sp)
      4e:	6902                	ld	s2,0(sp)
      50:	6105                	addi	sp,sp,32
      52:	8082                	ret

0000000000000054 <panic>:
  exit(0);
}

void
panic(char *s)
{
      54:	1141                	addi	sp,sp,-16
      56:	e406                	sd	ra,8(sp)
      58:	e022                	sd	s0,0(sp)
      5a:	0800                	addi	s0,sp,16
      5c:	862a                	mv	a2,a0
  fprintf(2, "%s\n", s);
      5e:	00001597          	auipc	a1,0x1
      62:	2aa58593          	addi	a1,a1,682 # 1308 <malloc+0xec>
      66:	4509                	li	a0,2
      68:	00001097          	auipc	ra,0x1
      6c:	0c8080e7          	jalr	200(ra) # 1130 <fprintf>
  exit(1);
      70:	4505                	li	a0,1
      72:	00001097          	auipc	ra,0x1
      76:	d74080e7          	jalr	-652(ra) # de6 <exit>

000000000000007a <debugout>:
}
void
debugout(char *s1,char *s2)
{
      7a:	1141                	addi	sp,sp,-16
      7c:	e406                	sd	ra,8(sp)
      7e:	e022                	sd	s0,0(sp)
      80:	0800                	addi	s0,sp,16
      82:	862a                	mv	a2,a0
      84:	86ae                	mv	a3,a1
//  \e represents converting the  meaning
// [31m represents red
// [0m represents closing the color.
  fprintf(2, "\e[31mdebug:\e[0m%s:%s\n", s1,s2);
      86:	00001597          	auipc	a1,0x1
      8a:	28a58593          	addi	a1,a1,650 # 1310 <malloc+0xf4>
      8e:	4509                	li	a0,2
      90:	00001097          	auipc	ra,0x1
      94:	0a0080e7          	jalr	160(ra) # 1130 <fprintf>
}
      98:	60a2                	ld	ra,8(sp)
      9a:	6402                	ld	s0,0(sp)
      9c:	0141                	addi	sp,sp,16
      9e:	8082                	ret

00000000000000a0 <debugprint>:
void
debugprint(char *s, int i)
{
      a0:	1141                	addi	sp,sp,-16
      a2:	e406                	sd	ra,8(sp)
      a4:	e022                	sd	s0,0(sp)
      a6:	0800                	addi	s0,sp,16
      a8:	862a                	mv	a2,a0
      aa:	86ae                	mv	a3,a1
//  \e represents converting the  meaning
// [31m represents red
// [0m represents closing the color.
  fprintf(2, "\e[31mdebug:\e[0m%s:%d\n", s,i);
      ac:	00001597          	auipc	a1,0x1
      b0:	27c58593          	addi	a1,a1,636 # 1328 <malloc+0x10c>
      b4:	4509                	li	a0,2
      b6:	00001097          	auipc	ra,0x1
      ba:	07a080e7          	jalr	122(ra) # 1130 <fprintf>
}
      be:	60a2                	ld	ra,8(sp)
      c0:	6402                	ld	s0,0(sp)
      c2:	0141                	addi	sp,sp,16
      c4:	8082                	ret

00000000000000c6 <fork1>:

int
fork1(void)
{
      c6:	1141                	addi	sp,sp,-16
      c8:	e406                	sd	ra,8(sp)
      ca:	e022                	sd	s0,0(sp)
      cc:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
      ce:	00001097          	auipc	ra,0x1
      d2:	d10080e7          	jalr	-752(ra) # dde <fork>
  if(pid == -1)
      d6:	57fd                	li	a5,-1
      d8:	00f50663          	beq	a0,a5,e4 <fork1+0x1e>
    panic("fork");
//  panic("fork successfully!");
  return pid;
}
      dc:	60a2                	ld	ra,8(sp)
      de:	6402                	ld	s0,0(sp)
      e0:	0141                	addi	sp,sp,16
      e2:	8082                	ret
    panic("fork");
      e4:	00001517          	auipc	a0,0x1
      e8:	25c50513          	addi	a0,a0,604 # 1340 <malloc+0x124>
      ec:	00000097          	auipc	ra,0x0
      f0:	f68080e7          	jalr	-152(ra) # 54 <panic>

00000000000000f4 <runcmd>:
{
      f4:	7179                	addi	sp,sp,-48
      f6:	f406                	sd	ra,40(sp)
      f8:	f022                	sd	s0,32(sp)
      fa:	ec26                	sd	s1,24(sp)
      fc:	1800                	addi	s0,sp,48
  if(cmd == 0)
      fe:	c10d                	beqz	a0,120 <runcmd+0x2c>
     100:	84aa                	mv	s1,a0
  switch(cmd->type){
     102:	4118                	lw	a4,0(a0)
     104:	4795                	li	a5,5
     106:	02e7e263          	bltu	a5,a4,12a <runcmd+0x36>
     10a:	00056783          	lwu	a5,0(a0)
     10e:	078a                	slli	a5,a5,0x2
     110:	00001717          	auipc	a4,0x1
     114:	33070713          	addi	a4,a4,816 # 1440 <malloc+0x224>
     118:	97ba                	add	a5,a5,a4
     11a:	439c                	lw	a5,0(a5)
     11c:	97ba                	add	a5,a5,a4
     11e:	8782                	jr	a5
    exit(1);
     120:	4505                	li	a0,1
     122:	00001097          	auipc	ra,0x1
     126:	cc4080e7          	jalr	-828(ra) # de6 <exit>
    panic("runcmd");
     12a:	00001517          	auipc	a0,0x1
     12e:	21e50513          	addi	a0,a0,542 # 1348 <malloc+0x12c>
     132:	00000097          	auipc	ra,0x0
     136:	f22080e7          	jalr	-222(ra) # 54 <panic>
    if(ecmd->argv[0] == 0)
     13a:	6508                	ld	a0,8(a0)
     13c:	c515                	beqz	a0,168 <runcmd+0x74>
    exec(ecmd->argv[0], ecmd->argv);
     13e:	00848593          	addi	a1,s1,8
     142:	00001097          	auipc	ra,0x1
     146:	cdc080e7          	jalr	-804(ra) # e1e <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     14a:	6490                	ld	a2,8(s1)
     14c:	00001597          	auipc	a1,0x1
     150:	20458593          	addi	a1,a1,516 # 1350 <malloc+0x134>
     154:	4509                	li	a0,2
     156:	00001097          	auipc	ra,0x1
     15a:	fda080e7          	jalr	-38(ra) # 1130 <fprintf>
  exit(0);
     15e:	4501                	li	a0,0
     160:	00001097          	auipc	ra,0x1
     164:	c86080e7          	jalr	-890(ra) # de6 <exit>
      exit(1);
     168:	4505                	li	a0,1
     16a:	00001097          	auipc	ra,0x1
     16e:	c7c080e7          	jalr	-900(ra) # de6 <exit>
    close(rcmd->fd);
     172:	5148                	lw	a0,36(a0)
     174:	00001097          	auipc	ra,0x1
     178:	c9a080e7          	jalr	-870(ra) # e0e <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     17c:	508c                	lw	a1,32(s1)
     17e:	6888                	ld	a0,16(s1)
     180:	00001097          	auipc	ra,0x1
     184:	ca6080e7          	jalr	-858(ra) # e26 <open>
     188:	00054763          	bltz	a0,196 <runcmd+0xa2>
    runcmd(rcmd->cmd);
     18c:	6488                	ld	a0,8(s1)
     18e:	00000097          	auipc	ra,0x0
     192:	f66080e7          	jalr	-154(ra) # f4 <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     196:	6890                	ld	a2,16(s1)
     198:	00001597          	auipc	a1,0x1
     19c:	1c858593          	addi	a1,a1,456 # 1360 <malloc+0x144>
     1a0:	4509                	li	a0,2
     1a2:	00001097          	auipc	ra,0x1
     1a6:	f8e080e7          	jalr	-114(ra) # 1130 <fprintf>
      exit(1);
     1aa:	4505                	li	a0,1
     1ac:	00001097          	auipc	ra,0x1
     1b0:	c3a080e7          	jalr	-966(ra) # de6 <exit>
    if(fork1() == 0)
     1b4:	00000097          	auipc	ra,0x0
     1b8:	f12080e7          	jalr	-238(ra) # c6 <fork1>
     1bc:	c919                	beqz	a0,1d2 <runcmd+0xde>
    wait(0);
     1be:	4501                	li	a0,0
     1c0:	00001097          	auipc	ra,0x1
     1c4:	c2e080e7          	jalr	-978(ra) # dee <wait>
    runcmd(lcmd->right);
     1c8:	6888                	ld	a0,16(s1)
     1ca:	00000097          	auipc	ra,0x0
     1ce:	f2a080e7          	jalr	-214(ra) # f4 <runcmd>
      runcmd(lcmd->left);
     1d2:	6488                	ld	a0,8(s1)
     1d4:	00000097          	auipc	ra,0x0
     1d8:	f20080e7          	jalr	-224(ra) # f4 <runcmd>
    if(pipe(p) < 0)
     1dc:	fd840513          	addi	a0,s0,-40
     1e0:	00001097          	auipc	ra,0x1
     1e4:	c16080e7          	jalr	-1002(ra) # df6 <pipe>
     1e8:	04054363          	bltz	a0,22e <runcmd+0x13a>
    if(fork1() == 0){
     1ec:	00000097          	auipc	ra,0x0
     1f0:	eda080e7          	jalr	-294(ra) # c6 <fork1>
     1f4:	c529                	beqz	a0,23e <runcmd+0x14a>
    if(fork1() == 0){
     1f6:	00000097          	auipc	ra,0x0
     1fa:	ed0080e7          	jalr	-304(ra) # c6 <fork1>
     1fe:	cd25                	beqz	a0,276 <runcmd+0x182>
    close(p[0]);
     200:	fd842503          	lw	a0,-40(s0)
     204:	00001097          	auipc	ra,0x1
     208:	c0a080e7          	jalr	-1014(ra) # e0e <close>
    close(p[1]);
     20c:	fdc42503          	lw	a0,-36(s0)
     210:	00001097          	auipc	ra,0x1
     214:	bfe080e7          	jalr	-1026(ra) # e0e <close>
    wait(0);
     218:	4501                	li	a0,0
     21a:	00001097          	auipc	ra,0x1
     21e:	bd4080e7          	jalr	-1068(ra) # dee <wait>
    wait(0);
     222:	4501                	li	a0,0
     224:	00001097          	auipc	ra,0x1
     228:	bca080e7          	jalr	-1078(ra) # dee <wait>
    break;
     22c:	bf0d                	j	15e <runcmd+0x6a>
      panic("pipe");
     22e:	00001517          	auipc	a0,0x1
     232:	14250513          	addi	a0,a0,322 # 1370 <malloc+0x154>
     236:	00000097          	auipc	ra,0x0
     23a:	e1e080e7          	jalr	-482(ra) # 54 <panic>
      close(1);
     23e:	4505                	li	a0,1
     240:	00001097          	auipc	ra,0x1
     244:	bce080e7          	jalr	-1074(ra) # e0e <close>
      dup(p[1]);
     248:	fdc42503          	lw	a0,-36(s0)
     24c:	00001097          	auipc	ra,0x1
     250:	c12080e7          	jalr	-1006(ra) # e5e <dup>
      close(p[0]);
     254:	fd842503          	lw	a0,-40(s0)
     258:	00001097          	auipc	ra,0x1
     25c:	bb6080e7          	jalr	-1098(ra) # e0e <close>
      close(p[1]);
     260:	fdc42503          	lw	a0,-36(s0)
     264:	00001097          	auipc	ra,0x1
     268:	baa080e7          	jalr	-1110(ra) # e0e <close>
      runcmd(pcmd->left);
     26c:	6488                	ld	a0,8(s1)
     26e:	00000097          	auipc	ra,0x0
     272:	e86080e7          	jalr	-378(ra) # f4 <runcmd>
      close(0);
     276:	00001097          	auipc	ra,0x1
     27a:	b98080e7          	jalr	-1128(ra) # e0e <close>
      dup(p[0]);
     27e:	fd842503          	lw	a0,-40(s0)
     282:	00001097          	auipc	ra,0x1
     286:	bdc080e7          	jalr	-1060(ra) # e5e <dup>
      close(p[0]);
     28a:	fd842503          	lw	a0,-40(s0)
     28e:	00001097          	auipc	ra,0x1
     292:	b80080e7          	jalr	-1152(ra) # e0e <close>
      close(p[1]);
     296:	fdc42503          	lw	a0,-36(s0)
     29a:	00001097          	auipc	ra,0x1
     29e:	b74080e7          	jalr	-1164(ra) # e0e <close>
      runcmd(pcmd->right);
     2a2:	6888                	ld	a0,16(s1)
     2a4:	00000097          	auipc	ra,0x0
     2a8:	e50080e7          	jalr	-432(ra) # f4 <runcmd>
    if(fork1() == 0)
     2ac:	00000097          	auipc	ra,0x0
     2b0:	e1a080e7          	jalr	-486(ra) # c6 <fork1>
     2b4:	ea0515e3          	bnez	a0,15e <runcmd+0x6a>
      runcmd(bcmd->cmd);
     2b8:	6488                	ld	a0,8(s1)
     2ba:	00000097          	auipc	ra,0x0
     2be:	e3a080e7          	jalr	-454(ra) # f4 <runcmd>

00000000000002c2 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2c2:	1101                	addi	sp,sp,-32
     2c4:	ec06                	sd	ra,24(sp)
     2c6:	e822                	sd	s0,16(sp)
     2c8:	e426                	sd	s1,8(sp)
     2ca:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2cc:	0a800513          	li	a0,168
     2d0:	00001097          	auipc	ra,0x1
     2d4:	f4c080e7          	jalr	-180(ra) # 121c <malloc>
     2d8:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     2da:	0a800613          	li	a2,168
     2de:	4581                	li	a1,0
     2e0:	00001097          	auipc	ra,0x1
     2e4:	90a080e7          	jalr	-1782(ra) # bea <memset>
  cmd->type = EXEC;
     2e8:	4785                	li	a5,1
     2ea:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     2ec:	8526                	mv	a0,s1
     2ee:	60e2                	ld	ra,24(sp)
     2f0:	6442                	ld	s0,16(sp)
     2f2:	64a2                	ld	s1,8(sp)
     2f4:	6105                	addi	sp,sp,32
     2f6:	8082                	ret

00000000000002f8 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     2f8:	7139                	addi	sp,sp,-64
     2fa:	fc06                	sd	ra,56(sp)
     2fc:	f822                	sd	s0,48(sp)
     2fe:	f426                	sd	s1,40(sp)
     300:	f04a                	sd	s2,32(sp)
     302:	ec4e                	sd	s3,24(sp)
     304:	e852                	sd	s4,16(sp)
     306:	e456                	sd	s5,8(sp)
     308:	e05a                	sd	s6,0(sp)
     30a:	0080                	addi	s0,sp,64
     30c:	8b2a                	mv	s6,a0
     30e:	8aae                	mv	s5,a1
     310:	8a32                	mv	s4,a2
     312:	89b6                	mv	s3,a3
     314:	893a                	mv	s2,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     316:	02800513          	li	a0,40
     31a:	00001097          	auipc	ra,0x1
     31e:	f02080e7          	jalr	-254(ra) # 121c <malloc>
     322:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     324:	02800613          	li	a2,40
     328:	4581                	li	a1,0
     32a:	00001097          	auipc	ra,0x1
     32e:	8c0080e7          	jalr	-1856(ra) # bea <memset>
  cmd->type = REDIR;
     332:	4789                	li	a5,2
     334:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     336:	0164b423          	sd	s6,8(s1)
  cmd->file = file;
     33a:	0154b823          	sd	s5,16(s1)
  cmd->efile = efile;
     33e:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     342:	0334a023          	sw	s3,32(s1)
  cmd->fd = fd;
     346:	0324a223          	sw	s2,36(s1)
  return (struct cmd*)cmd;
}
     34a:	8526                	mv	a0,s1
     34c:	70e2                	ld	ra,56(sp)
     34e:	7442                	ld	s0,48(sp)
     350:	74a2                	ld	s1,40(sp)
     352:	7902                	ld	s2,32(sp)
     354:	69e2                	ld	s3,24(sp)
     356:	6a42                	ld	s4,16(sp)
     358:	6aa2                	ld	s5,8(sp)
     35a:	6b02                	ld	s6,0(sp)
     35c:	6121                	addi	sp,sp,64
     35e:	8082                	ret

0000000000000360 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     360:	7179                	addi	sp,sp,-48
     362:	f406                	sd	ra,40(sp)
     364:	f022                	sd	s0,32(sp)
     366:	ec26                	sd	s1,24(sp)
     368:	e84a                	sd	s2,16(sp)
     36a:	e44e                	sd	s3,8(sp)
     36c:	1800                	addi	s0,sp,48
     36e:	89aa                	mv	s3,a0
     370:	892e                	mv	s2,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     372:	4561                	li	a0,24
     374:	00001097          	auipc	ra,0x1
     378:	ea8080e7          	jalr	-344(ra) # 121c <malloc>
     37c:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     37e:	4661                	li	a2,24
     380:	4581                	li	a1,0
     382:	00001097          	auipc	ra,0x1
     386:	868080e7          	jalr	-1944(ra) # bea <memset>
  cmd->type = PIPE;
     38a:	478d                	li	a5,3
     38c:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     38e:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     392:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     396:	8526                	mv	a0,s1
     398:	70a2                	ld	ra,40(sp)
     39a:	7402                	ld	s0,32(sp)
     39c:	64e2                	ld	s1,24(sp)
     39e:	6942                	ld	s2,16(sp)
     3a0:	69a2                	ld	s3,8(sp)
     3a2:	6145                	addi	sp,sp,48
     3a4:	8082                	ret

00000000000003a6 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3a6:	7179                	addi	sp,sp,-48
     3a8:	f406                	sd	ra,40(sp)
     3aa:	f022                	sd	s0,32(sp)
     3ac:	ec26                	sd	s1,24(sp)
     3ae:	e84a                	sd	s2,16(sp)
     3b0:	e44e                	sd	s3,8(sp)
     3b2:	1800                	addi	s0,sp,48
     3b4:	89aa                	mv	s3,a0
     3b6:	892e                	mv	s2,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b8:	4561                	li	a0,24
     3ba:	00001097          	auipc	ra,0x1
     3be:	e62080e7          	jalr	-414(ra) # 121c <malloc>
     3c2:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     3c4:	4661                	li	a2,24
     3c6:	4581                	li	a1,0
     3c8:	00001097          	auipc	ra,0x1
     3cc:	822080e7          	jalr	-2014(ra) # bea <memset>
  cmd->type = LIST;
     3d0:	4791                	li	a5,4
     3d2:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     3d4:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     3d8:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     3dc:	8526                	mv	a0,s1
     3de:	70a2                	ld	ra,40(sp)
     3e0:	7402                	ld	s0,32(sp)
     3e2:	64e2                	ld	s1,24(sp)
     3e4:	6942                	ld	s2,16(sp)
     3e6:	69a2                	ld	s3,8(sp)
     3e8:	6145                	addi	sp,sp,48
     3ea:	8082                	ret

00000000000003ec <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     3ec:	1101                	addi	sp,sp,-32
     3ee:	ec06                	sd	ra,24(sp)
     3f0:	e822                	sd	s0,16(sp)
     3f2:	e426                	sd	s1,8(sp)
     3f4:	e04a                	sd	s2,0(sp)
     3f6:	1000                	addi	s0,sp,32
     3f8:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3fa:	4541                	li	a0,16
     3fc:	00001097          	auipc	ra,0x1
     400:	e20080e7          	jalr	-480(ra) # 121c <malloc>
     404:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     406:	4641                	li	a2,16
     408:	4581                	li	a1,0
     40a:	00000097          	auipc	ra,0x0
     40e:	7e0080e7          	jalr	2016(ra) # bea <memset>
  cmd->type = BACK;
     412:	4795                	li	a5,5
     414:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     416:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     41a:	8526                	mv	a0,s1
     41c:	60e2                	ld	ra,24(sp)
     41e:	6442                	ld	s0,16(sp)
     420:	64a2                	ld	s1,8(sp)
     422:	6902                	ld	s2,0(sp)
     424:	6105                	addi	sp,sp,32
     426:	8082                	ret

0000000000000428 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     428:	7139                	addi	sp,sp,-64
     42a:	fc06                	sd	ra,56(sp)
     42c:	f822                	sd	s0,48(sp)
     42e:	f426                	sd	s1,40(sp)
     430:	f04a                	sd	s2,32(sp)
     432:	ec4e                	sd	s3,24(sp)
     434:	e852                	sd	s4,16(sp)
     436:	e456                	sd	s5,8(sp)
     438:	e05a                	sd	s6,0(sp)
     43a:	0080                	addi	s0,sp,64
     43c:	8a2a                	mv	s4,a0
     43e:	892e                	mv	s2,a1
     440:	8ab2                	mv	s5,a2
     442:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     444:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     446:	00001997          	auipc	s3,0x1
     44a:	05298993          	addi	s3,s3,82 # 1498 <whitespace>
     44e:	00b4fd63          	bgeu	s1,a1,468 <gettoken+0x40>
     452:	0004c583          	lbu	a1,0(s1)
     456:	854e                	mv	a0,s3
     458:	00000097          	auipc	ra,0x0
     45c:	7b4080e7          	jalr	1972(ra) # c0c <strchr>
     460:	c501                	beqz	a0,468 <gettoken+0x40>
    s++;
     462:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     464:	fe9917e3          	bne	s2,s1,452 <gettoken+0x2a>
  if(q)
     468:	000a8463          	beqz	s5,470 <gettoken+0x48>
    *q = s;
     46c:	009ab023          	sd	s1,0(s5)
  ret = *s;
     470:	0004c783          	lbu	a5,0(s1)
     474:	00078a9b          	sext.w	s5,a5
  switch(*s){
     478:	03c00713          	li	a4,60
     47c:	06f76563          	bltu	a4,a5,4e6 <gettoken+0xbe>
     480:	03a00713          	li	a4,58
     484:	00f76e63          	bltu	a4,a5,4a0 <gettoken+0x78>
     488:	cf89                	beqz	a5,4a2 <gettoken+0x7a>
     48a:	02600713          	li	a4,38
     48e:	00e78963          	beq	a5,a4,4a0 <gettoken+0x78>
     492:	fd87879b          	addiw	a5,a5,-40
     496:	0ff7f793          	andi	a5,a5,255
     49a:	4705                	li	a4,1
     49c:	06f76c63          	bltu	a4,a5,514 <gettoken+0xec>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     4a0:	0485                	addi	s1,s1,1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4a2:	000b0463          	beqz	s6,4aa <gettoken+0x82>
    *eq = s;
     4a6:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     4aa:	00001997          	auipc	s3,0x1
     4ae:	fee98993          	addi	s3,s3,-18 # 1498 <whitespace>
     4b2:	0124fd63          	bgeu	s1,s2,4cc <gettoken+0xa4>
     4b6:	0004c583          	lbu	a1,0(s1)
     4ba:	854e                	mv	a0,s3
     4bc:	00000097          	auipc	ra,0x0
     4c0:	750080e7          	jalr	1872(ra) # c0c <strchr>
     4c4:	c501                	beqz	a0,4cc <gettoken+0xa4>
    s++;
     4c6:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     4c8:	fe9917e3          	bne	s2,s1,4b6 <gettoken+0x8e>
  *ps = s;
     4cc:	009a3023          	sd	s1,0(s4)
  return ret;
}
     4d0:	8556                	mv	a0,s5
     4d2:	70e2                	ld	ra,56(sp)
     4d4:	7442                	ld	s0,48(sp)
     4d6:	74a2                	ld	s1,40(sp)
     4d8:	7902                	ld	s2,32(sp)
     4da:	69e2                	ld	s3,24(sp)
     4dc:	6a42                	ld	s4,16(sp)
     4de:	6aa2                	ld	s5,8(sp)
     4e0:	6b02                	ld	s6,0(sp)
     4e2:	6121                	addi	sp,sp,64
     4e4:	8082                	ret
  switch(*s){
     4e6:	03e00713          	li	a4,62
     4ea:	02e79163          	bne	a5,a4,50c <gettoken+0xe4>
    s++;
     4ee:	00148693          	addi	a3,s1,1
    if(*s == '>'){
     4f2:	0014c703          	lbu	a4,1(s1)
     4f6:	03e00793          	li	a5,62
      s++;
     4fa:	0489                	addi	s1,s1,2
      ret = '+';
     4fc:	02b00a93          	li	s5,43
    if(*s == '>'){
     500:	faf701e3          	beq	a4,a5,4a2 <gettoken+0x7a>
    s++;
     504:	84b6                	mv	s1,a3
  ret = *s;
     506:	03e00a93          	li	s5,62
     50a:	bf61                	j	4a2 <gettoken+0x7a>
  switch(*s){
     50c:	07c00713          	li	a4,124
     510:	f8e788e3          	beq	a5,a4,4a0 <gettoken+0x78>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     514:	00001997          	auipc	s3,0x1
     518:	f8498993          	addi	s3,s3,-124 # 1498 <whitespace>
     51c:	00001a97          	auipc	s5,0x1
     520:	f74a8a93          	addi	s5,s5,-140 # 1490 <symbols>
     524:	0324f563          	bgeu	s1,s2,54e <gettoken+0x126>
     528:	0004c583          	lbu	a1,0(s1)
     52c:	854e                	mv	a0,s3
     52e:	00000097          	auipc	ra,0x0
     532:	6de080e7          	jalr	1758(ra) # c0c <strchr>
     536:	e505                	bnez	a0,55e <gettoken+0x136>
     538:	0004c583          	lbu	a1,0(s1)
     53c:	8556                	mv	a0,s5
     53e:	00000097          	auipc	ra,0x0
     542:	6ce080e7          	jalr	1742(ra) # c0c <strchr>
     546:	e909                	bnez	a0,558 <gettoken+0x130>
      s++;
     548:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     54a:	fc991fe3          	bne	s2,s1,528 <gettoken+0x100>
  if(eq)
     54e:	06100a93          	li	s5,97
     552:	f40b1ae3          	bnez	s6,4a6 <gettoken+0x7e>
     556:	bf9d                	j	4cc <gettoken+0xa4>
    ret = 'a';
     558:	06100a93          	li	s5,97
     55c:	b799                	j	4a2 <gettoken+0x7a>
     55e:	06100a93          	li	s5,97
     562:	b781                	j	4a2 <gettoken+0x7a>

0000000000000564 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     564:	7139                	addi	sp,sp,-64
     566:	fc06                	sd	ra,56(sp)
     568:	f822                	sd	s0,48(sp)
     56a:	f426                	sd	s1,40(sp)
     56c:	f04a                	sd	s2,32(sp)
     56e:	ec4e                	sd	s3,24(sp)
     570:	e852                	sd	s4,16(sp)
     572:	e456                	sd	s5,8(sp)
     574:	0080                	addi	s0,sp,64
     576:	8a2a                	mv	s4,a0
     578:	892e                	mv	s2,a1
     57a:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     57c:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     57e:	00001997          	auipc	s3,0x1
     582:	f1a98993          	addi	s3,s3,-230 # 1498 <whitespace>
     586:	00b4fd63          	bgeu	s1,a1,5a0 <peek+0x3c>
     58a:	0004c583          	lbu	a1,0(s1)
     58e:	854e                	mv	a0,s3
     590:	00000097          	auipc	ra,0x0
     594:	67c080e7          	jalr	1660(ra) # c0c <strchr>
     598:	c501                	beqz	a0,5a0 <peek+0x3c>
    s++;
     59a:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     59c:	fe9917e3          	bne	s2,s1,58a <peek+0x26>
  *ps = s;
     5a0:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     5a4:	0004c583          	lbu	a1,0(s1)
     5a8:	4501                	li	a0,0
     5aa:	e991                	bnez	a1,5be <peek+0x5a>
}
     5ac:	70e2                	ld	ra,56(sp)
     5ae:	7442                	ld	s0,48(sp)
     5b0:	74a2                	ld	s1,40(sp)
     5b2:	7902                	ld	s2,32(sp)
     5b4:	69e2                	ld	s3,24(sp)
     5b6:	6a42                	ld	s4,16(sp)
     5b8:	6aa2                	ld	s5,8(sp)
     5ba:	6121                	addi	sp,sp,64
     5bc:	8082                	ret
  return *s && strchr(toks, *s);
     5be:	8556                	mv	a0,s5
     5c0:	00000097          	auipc	ra,0x0
     5c4:	64c080e7          	jalr	1612(ra) # c0c <strchr>
     5c8:	00a03533          	snez	a0,a0
     5cc:	b7c5                	j	5ac <peek+0x48>

00000000000005ce <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5ce:	711d                	addi	sp,sp,-96
     5d0:	ec86                	sd	ra,88(sp)
     5d2:	e8a2                	sd	s0,80(sp)
     5d4:	e4a6                	sd	s1,72(sp)
     5d6:	e0ca                	sd	s2,64(sp)
     5d8:	fc4e                	sd	s3,56(sp)
     5da:	f852                	sd	s4,48(sp)
     5dc:	f456                	sd	s5,40(sp)
     5de:	f05a                	sd	s6,32(sp)
     5e0:	ec5e                	sd	s7,24(sp)
     5e2:	e862                	sd	s8,16(sp)
     5e4:	1080                	addi	s0,sp,96
     5e6:	8a2a                	mv	s4,a0
     5e8:	89ae                	mv	s3,a1
     5ea:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     5ec:	00001b17          	auipc	s6,0x1
     5f0:	dacb0b13          	addi	s6,s6,-596 # 1398 <malloc+0x17c>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     5f4:	06100c13          	li	s8,97
      panic("missing file for redirection");
    switch(tok){
     5f8:	02b00b93          	li	s7,43
  while(peek(ps, es, "<>")){
     5fc:	a035                	j	628 <parseredirs+0x5a>
      panic("missing file for redirection");
     5fe:	00001517          	auipc	a0,0x1
     602:	d7a50513          	addi	a0,a0,-646 # 1378 <malloc+0x15c>
     606:	00000097          	auipc	ra,0x0
     60a:	a4e080e7          	jalr	-1458(ra) # 54 <panic>
        case '>':
      break;
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     60e:	4705                	li	a4,1
     610:	20100693          	li	a3,513
     614:	fa043603          	ld	a2,-96(s0)
     618:	fa843583          	ld	a1,-88(s0)
     61c:	8552                	mv	a0,s4
     61e:	00000097          	auipc	ra,0x0
     622:	cda080e7          	jalr	-806(ra) # 2f8 <redircmd>
     626:	8a2a                	mv	s4,a0
    switch(tok){
     628:	03c00a93          	li	s5,60
  while(peek(ps, es, "<>")){
     62c:	865a                	mv	a2,s6
     62e:	85ca                	mv	a1,s2
     630:	854e                	mv	a0,s3
     632:	00000097          	auipc	ra,0x0
     636:	f32080e7          	jalr	-206(ra) # 564 <peek>
     63a:	c539                	beqz	a0,688 <parseredirs+0xba>
    tok = gettoken(ps, es, 0, 0);
     63c:	4681                	li	a3,0
     63e:	4601                	li	a2,0
     640:	85ca                	mv	a1,s2
     642:	854e                	mv	a0,s3
     644:	00000097          	auipc	ra,0x0
     648:	de4080e7          	jalr	-540(ra) # 428 <gettoken>
     64c:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     64e:	fa040693          	addi	a3,s0,-96
     652:	fa840613          	addi	a2,s0,-88
     656:	85ca                	mv	a1,s2
     658:	854e                	mv	a0,s3
     65a:	00000097          	auipc	ra,0x0
     65e:	dce080e7          	jalr	-562(ra) # 428 <gettoken>
     662:	f9851ee3          	bne	a0,s8,5fe <parseredirs+0x30>
    switch(tok){
     666:	fb7484e3          	beq	s1,s7,60e <parseredirs+0x40>
     66a:	fd5491e3          	bne	s1,s5,62c <parseredirs+0x5e>
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     66e:	4701                	li	a4,0
     670:	4681                	li	a3,0
     672:	fa043603          	ld	a2,-96(s0)
     676:	fa843583          	ld	a1,-88(s0)
     67a:	8552                	mv	a0,s4
     67c:	00000097          	auipc	ra,0x0
     680:	c7c080e7          	jalr	-900(ra) # 2f8 <redircmd>
     684:	8a2a                	mv	s4,a0
     686:	b74d                	j	628 <parseredirs+0x5a>
      break;
    }
  }
  return cmd;
}
     688:	8552                	mv	a0,s4
     68a:	60e6                	ld	ra,88(sp)
     68c:	6446                	ld	s0,80(sp)
     68e:	64a6                	ld	s1,72(sp)
     690:	6906                	ld	s2,64(sp)
     692:	79e2                	ld	s3,56(sp)
     694:	7a42                	ld	s4,48(sp)
     696:	7aa2                	ld	s5,40(sp)
     698:	7b02                	ld	s6,32(sp)
     69a:	6be2                	ld	s7,24(sp)
     69c:	6c42                	ld	s8,16(sp)
     69e:	6125                	addi	sp,sp,96
     6a0:	8082                	ret

00000000000006a2 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6a2:	7159                	addi	sp,sp,-112
     6a4:	f486                	sd	ra,104(sp)
     6a6:	f0a2                	sd	s0,96(sp)
     6a8:	eca6                	sd	s1,88(sp)
     6aa:	e8ca                	sd	s2,80(sp)
     6ac:	e4ce                	sd	s3,72(sp)
     6ae:	e0d2                	sd	s4,64(sp)
     6b0:	fc56                	sd	s5,56(sp)
     6b2:	f85a                	sd	s6,48(sp)
     6b4:	f45e                	sd	s7,40(sp)
     6b6:	f062                	sd	s8,32(sp)
     6b8:	ec66                	sd	s9,24(sp)
     6ba:	1880                	addi	s0,sp,112
     6bc:	8a2a                	mv	s4,a0
     6be:	8aae                	mv	s5,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     6c0:	00001617          	auipc	a2,0x1
     6c4:	ce060613          	addi	a2,a2,-800 # 13a0 <malloc+0x184>
     6c8:	00000097          	auipc	ra,0x0
     6cc:	e9c080e7          	jalr	-356(ra) # 564 <peek>
     6d0:	e905                	bnez	a0,700 <parseexec+0x5e>
     6d2:	89aa                	mv	s3,a0
    return parseblock(ps, es);

  ret = execcmd();
     6d4:	00000097          	auipc	ra,0x0
     6d8:	bee080e7          	jalr	-1042(ra) # 2c2 <execcmd>
     6dc:	8c2a                	mv	s8,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     6de:	8656                	mv	a2,s5
     6e0:	85d2                	mv	a1,s4
     6e2:	00000097          	auipc	ra,0x0
     6e6:	eec080e7          	jalr	-276(ra) # 5ce <parseredirs>
     6ea:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     6ec:	008c0913          	addi	s2,s8,8
     6f0:	00001b17          	auipc	s6,0x1
     6f4:	cd0b0b13          	addi	s6,s6,-816 # 13c0 <malloc+0x1a4>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
     6f8:	06100c93          	li	s9,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     6fc:	4ba9                	li	s7,10
  while(!peek(ps, es, "|)&;")){
     6fe:	a0b1                	j	74a <parseexec+0xa8>
    return parseblock(ps, es);
     700:	85d6                	mv	a1,s5
     702:	8552                	mv	a0,s4
     704:	00000097          	auipc	ra,0x0
     708:	1bc080e7          	jalr	444(ra) # 8c0 <parseblock>
     70c:	84aa                	mv	s1,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     70e:	8526                	mv	a0,s1
     710:	70a6                	ld	ra,104(sp)
     712:	7406                	ld	s0,96(sp)
     714:	64e6                	ld	s1,88(sp)
     716:	6946                	ld	s2,80(sp)
     718:	69a6                	ld	s3,72(sp)
     71a:	6a06                	ld	s4,64(sp)
     71c:	7ae2                	ld	s5,56(sp)
     71e:	7b42                	ld	s6,48(sp)
     720:	7ba2                	ld	s7,40(sp)
     722:	7c02                	ld	s8,32(sp)
     724:	6ce2                	ld	s9,24(sp)
     726:	6165                	addi	sp,sp,112
     728:	8082                	ret
      panic("syntax");
     72a:	00001517          	auipc	a0,0x1
     72e:	c7e50513          	addi	a0,a0,-898 # 13a8 <malloc+0x18c>
     732:	00000097          	auipc	ra,0x0
     736:	922080e7          	jalr	-1758(ra) # 54 <panic>
    ret = parseredirs(ret, ps, es);
     73a:	8656                	mv	a2,s5
     73c:	85d2                	mv	a1,s4
     73e:	8526                	mv	a0,s1
     740:	00000097          	auipc	ra,0x0
     744:	e8e080e7          	jalr	-370(ra) # 5ce <parseredirs>
     748:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     74a:	865a                	mv	a2,s6
     74c:	85d6                	mv	a1,s5
     74e:	8552                	mv	a0,s4
     750:	00000097          	auipc	ra,0x0
     754:	e14080e7          	jalr	-492(ra) # 564 <peek>
     758:	e131                	bnez	a0,79c <parseexec+0xfa>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     75a:	f9040693          	addi	a3,s0,-112
     75e:	f9840613          	addi	a2,s0,-104
     762:	85d6                	mv	a1,s5
     764:	8552                	mv	a0,s4
     766:	00000097          	auipc	ra,0x0
     76a:	cc2080e7          	jalr	-830(ra) # 428 <gettoken>
     76e:	c51d                	beqz	a0,79c <parseexec+0xfa>
    if(tok != 'a')
     770:	fb951de3          	bne	a0,s9,72a <parseexec+0x88>
    cmd->argv[argc] = q;
     774:	f9843783          	ld	a5,-104(s0)
     778:	00f93023          	sd	a5,0(s2)
    cmd->eargv[argc] = eq;
     77c:	f9043783          	ld	a5,-112(s0)
     780:	04f93823          	sd	a5,80(s2)
    argc++;
     784:	2985                	addiw	s3,s3,1
    if(argc >= MAXARGS)
     786:	0921                	addi	s2,s2,8
     788:	fb7999e3          	bne	s3,s7,73a <parseexec+0x98>
      panic("too many args");
     78c:	00001517          	auipc	a0,0x1
     790:	c2450513          	addi	a0,a0,-988 # 13b0 <malloc+0x194>
     794:	00000097          	auipc	ra,0x0
     798:	8c0080e7          	jalr	-1856(ra) # 54 <panic>
  cmd->argv[argc] = 0;
     79c:	098e                	slli	s3,s3,0x3
     79e:	99e2                	add	s3,s3,s8
     7a0:	0009b423          	sd	zero,8(s3)
  cmd->eargv[argc] = 0;
     7a4:	0409bc23          	sd	zero,88(s3)
  return ret;
     7a8:	b79d                	j	70e <parseexec+0x6c>

00000000000007aa <parsepipe>:
{
     7aa:	7179                	addi	sp,sp,-48
     7ac:	f406                	sd	ra,40(sp)
     7ae:	f022                	sd	s0,32(sp)
     7b0:	ec26                	sd	s1,24(sp)
     7b2:	e84a                	sd	s2,16(sp)
     7b4:	e44e                	sd	s3,8(sp)
     7b6:	1800                	addi	s0,sp,48
     7b8:	892a                	mv	s2,a0
     7ba:	89ae                	mv	s3,a1
  cmd = parseexec(ps, es);
     7bc:	00000097          	auipc	ra,0x0
     7c0:	ee6080e7          	jalr	-282(ra) # 6a2 <parseexec>
     7c4:	84aa                	mv	s1,a0
  if(peek(ps, es, "|")){
     7c6:	00001617          	auipc	a2,0x1
     7ca:	c0260613          	addi	a2,a2,-1022 # 13c8 <malloc+0x1ac>
     7ce:	85ce                	mv	a1,s3
     7d0:	854a                	mv	a0,s2
     7d2:	00000097          	auipc	ra,0x0
     7d6:	d92080e7          	jalr	-622(ra) # 564 <peek>
     7da:	e909                	bnez	a0,7ec <parsepipe+0x42>
}
     7dc:	8526                	mv	a0,s1
     7de:	70a2                	ld	ra,40(sp)
     7e0:	7402                	ld	s0,32(sp)
     7e2:	64e2                	ld	s1,24(sp)
     7e4:	6942                	ld	s2,16(sp)
     7e6:	69a2                	ld	s3,8(sp)
     7e8:	6145                	addi	sp,sp,48
     7ea:	8082                	ret
    gettoken(ps, es, 0, 0);
     7ec:	4681                	li	a3,0
     7ee:	4601                	li	a2,0
     7f0:	85ce                	mv	a1,s3
     7f2:	854a                	mv	a0,s2
     7f4:	00000097          	auipc	ra,0x0
     7f8:	c34080e7          	jalr	-972(ra) # 428 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     7fc:	85ce                	mv	a1,s3
     7fe:	854a                	mv	a0,s2
     800:	00000097          	auipc	ra,0x0
     804:	faa080e7          	jalr	-86(ra) # 7aa <parsepipe>
     808:	85aa                	mv	a1,a0
     80a:	8526                	mv	a0,s1
     80c:	00000097          	auipc	ra,0x0
     810:	b54080e7          	jalr	-1196(ra) # 360 <pipecmd>
     814:	84aa                	mv	s1,a0
  return cmd;
     816:	b7d9                	j	7dc <parsepipe+0x32>

0000000000000818 <parseline>:
{
     818:	7179                	addi	sp,sp,-48
     81a:	f406                	sd	ra,40(sp)
     81c:	f022                	sd	s0,32(sp)
     81e:	ec26                	sd	s1,24(sp)
     820:	e84a                	sd	s2,16(sp)
     822:	e44e                	sd	s3,8(sp)
     824:	e052                	sd	s4,0(sp)
     826:	1800                	addi	s0,sp,48
     828:	892a                	mv	s2,a0
     82a:	89ae                	mv	s3,a1
  cmd = parsepipe(ps, es);
     82c:	00000097          	auipc	ra,0x0
     830:	f7e080e7          	jalr	-130(ra) # 7aa <parsepipe>
     834:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     836:	00001a17          	auipc	s4,0x1
     83a:	b9aa0a13          	addi	s4,s4,-1126 # 13d0 <malloc+0x1b4>
     83e:	a839                	j	85c <parseline+0x44>
    gettoken(ps, es, 0, 0);
     840:	4681                	li	a3,0
     842:	4601                	li	a2,0
     844:	85ce                	mv	a1,s3
     846:	854a                	mv	a0,s2
     848:	00000097          	auipc	ra,0x0
     84c:	be0080e7          	jalr	-1056(ra) # 428 <gettoken>
    cmd = backcmd(cmd);
     850:	8526                	mv	a0,s1
     852:	00000097          	auipc	ra,0x0
     856:	b9a080e7          	jalr	-1126(ra) # 3ec <backcmd>
     85a:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     85c:	8652                	mv	a2,s4
     85e:	85ce                	mv	a1,s3
     860:	854a                	mv	a0,s2
     862:	00000097          	auipc	ra,0x0
     866:	d02080e7          	jalr	-766(ra) # 564 <peek>
     86a:	f979                	bnez	a0,840 <parseline+0x28>
  if(peek(ps, es, ";")){
     86c:	00001617          	auipc	a2,0x1
     870:	b6c60613          	addi	a2,a2,-1172 # 13d8 <malloc+0x1bc>
     874:	85ce                	mv	a1,s3
     876:	854a                	mv	a0,s2
     878:	00000097          	auipc	ra,0x0
     87c:	cec080e7          	jalr	-788(ra) # 564 <peek>
     880:	e911                	bnez	a0,894 <parseline+0x7c>
}
     882:	8526                	mv	a0,s1
     884:	70a2                	ld	ra,40(sp)
     886:	7402                	ld	s0,32(sp)
     888:	64e2                	ld	s1,24(sp)
     88a:	6942                	ld	s2,16(sp)
     88c:	69a2                	ld	s3,8(sp)
     88e:	6a02                	ld	s4,0(sp)
     890:	6145                	addi	sp,sp,48
     892:	8082                	ret
    gettoken(ps, es, 0, 0);
     894:	4681                	li	a3,0
     896:	4601                	li	a2,0
     898:	85ce                	mv	a1,s3
     89a:	854a                	mv	a0,s2
     89c:	00000097          	auipc	ra,0x0
     8a0:	b8c080e7          	jalr	-1140(ra) # 428 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     8a4:	85ce                	mv	a1,s3
     8a6:	854a                	mv	a0,s2
     8a8:	00000097          	auipc	ra,0x0
     8ac:	f70080e7          	jalr	-144(ra) # 818 <parseline>
     8b0:	85aa                	mv	a1,a0
     8b2:	8526                	mv	a0,s1
     8b4:	00000097          	auipc	ra,0x0
     8b8:	af2080e7          	jalr	-1294(ra) # 3a6 <listcmd>
     8bc:	84aa                	mv	s1,a0
  return cmd;
     8be:	b7d1                	j	882 <parseline+0x6a>

00000000000008c0 <parseblock>:
{
     8c0:	7179                	addi	sp,sp,-48
     8c2:	f406                	sd	ra,40(sp)
     8c4:	f022                	sd	s0,32(sp)
     8c6:	ec26                	sd	s1,24(sp)
     8c8:	e84a                	sd	s2,16(sp)
     8ca:	e44e                	sd	s3,8(sp)
     8cc:	1800                	addi	s0,sp,48
     8ce:	84aa                	mv	s1,a0
     8d0:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     8d2:	00001617          	auipc	a2,0x1
     8d6:	ace60613          	addi	a2,a2,-1330 # 13a0 <malloc+0x184>
     8da:	00000097          	auipc	ra,0x0
     8de:	c8a080e7          	jalr	-886(ra) # 564 <peek>
     8e2:	c12d                	beqz	a0,944 <parseblock+0x84>
  gettoken(ps, es, 0, 0);
     8e4:	4681                	li	a3,0
     8e6:	4601                	li	a2,0
     8e8:	85ca                	mv	a1,s2
     8ea:	8526                	mv	a0,s1
     8ec:	00000097          	auipc	ra,0x0
     8f0:	b3c080e7          	jalr	-1220(ra) # 428 <gettoken>
  cmd = parseline(ps, es);
     8f4:	85ca                	mv	a1,s2
     8f6:	8526                	mv	a0,s1
     8f8:	00000097          	auipc	ra,0x0
     8fc:	f20080e7          	jalr	-224(ra) # 818 <parseline>
     900:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     902:	00001617          	auipc	a2,0x1
     906:	aee60613          	addi	a2,a2,-1298 # 13f0 <malloc+0x1d4>
     90a:	85ca                	mv	a1,s2
     90c:	8526                	mv	a0,s1
     90e:	00000097          	auipc	ra,0x0
     912:	c56080e7          	jalr	-938(ra) # 564 <peek>
     916:	cd1d                	beqz	a0,954 <parseblock+0x94>
  gettoken(ps, es, 0, 0);
     918:	4681                	li	a3,0
     91a:	4601                	li	a2,0
     91c:	85ca                	mv	a1,s2
     91e:	8526                	mv	a0,s1
     920:	00000097          	auipc	ra,0x0
     924:	b08080e7          	jalr	-1272(ra) # 428 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     928:	864a                	mv	a2,s2
     92a:	85a6                	mv	a1,s1
     92c:	854e                	mv	a0,s3
     92e:	00000097          	auipc	ra,0x0
     932:	ca0080e7          	jalr	-864(ra) # 5ce <parseredirs>
}
     936:	70a2                	ld	ra,40(sp)
     938:	7402                	ld	s0,32(sp)
     93a:	64e2                	ld	s1,24(sp)
     93c:	6942                	ld	s2,16(sp)
     93e:	69a2                	ld	s3,8(sp)
     940:	6145                	addi	sp,sp,48
     942:	8082                	ret
    panic("parseblock");
     944:	00001517          	auipc	a0,0x1
     948:	a9c50513          	addi	a0,a0,-1380 # 13e0 <malloc+0x1c4>
     94c:	fffff097          	auipc	ra,0xfffff
     950:	708080e7          	jalr	1800(ra) # 54 <panic>
    panic("syntax - missing )");
     954:	00001517          	auipc	a0,0x1
     958:	aa450513          	addi	a0,a0,-1372 # 13f8 <malloc+0x1dc>
     95c:	fffff097          	auipc	ra,0xfffff
     960:	6f8080e7          	jalr	1784(ra) # 54 <panic>

0000000000000964 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     964:	1101                	addi	sp,sp,-32
     966:	ec06                	sd	ra,24(sp)
     968:	e822                	sd	s0,16(sp)
     96a:	e426                	sd	s1,8(sp)
     96c:	1000                	addi	s0,sp,32
     96e:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     970:	c521                	beqz	a0,9b8 <nulterminate+0x54>
    return 0;

  switch(cmd->type){
     972:	4118                	lw	a4,0(a0)
     974:	4795                	li	a5,5
     976:	04e7e163          	bltu	a5,a4,9b8 <nulterminate+0x54>
     97a:	00056783          	lwu	a5,0(a0)
     97e:	078a                	slli	a5,a5,0x2
     980:	00001717          	auipc	a4,0x1
     984:	ad870713          	addi	a4,a4,-1320 # 1458 <malloc+0x23c>
     988:	97ba                	add	a5,a5,a4
     98a:	439c                	lw	a5,0(a5)
     98c:	97ba                	add	a5,a5,a4
     98e:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     990:	651c                	ld	a5,8(a0)
     992:	c39d                	beqz	a5,9b8 <nulterminate+0x54>
     994:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     998:	67b8                	ld	a4,72(a5)
     99a:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     99e:	07a1                	addi	a5,a5,8
     9a0:	ff87b703          	ld	a4,-8(a5)
     9a4:	fb75                	bnez	a4,998 <nulterminate+0x34>
     9a6:	a809                	j	9b8 <nulterminate+0x54>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     9a8:	6508                	ld	a0,8(a0)
     9aa:	00000097          	auipc	ra,0x0
     9ae:	fba080e7          	jalr	-70(ra) # 964 <nulterminate>
    *rcmd->efile = 0;
     9b2:	6c9c                	ld	a5,24(s1)
     9b4:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     9b8:	8526                	mv	a0,s1
     9ba:	60e2                	ld	ra,24(sp)
     9bc:	6442                	ld	s0,16(sp)
     9be:	64a2                	ld	s1,8(sp)
     9c0:	6105                	addi	sp,sp,32
     9c2:	8082                	ret
    nulterminate(pcmd->left);
     9c4:	6508                	ld	a0,8(a0)
     9c6:	00000097          	auipc	ra,0x0
     9ca:	f9e080e7          	jalr	-98(ra) # 964 <nulterminate>
    nulterminate(pcmd->right);
     9ce:	6888                	ld	a0,16(s1)
     9d0:	00000097          	auipc	ra,0x0
     9d4:	f94080e7          	jalr	-108(ra) # 964 <nulterminate>
    break;
     9d8:	b7c5                	j	9b8 <nulterminate+0x54>
    nulterminate(lcmd->left);
     9da:	6508                	ld	a0,8(a0)
     9dc:	00000097          	auipc	ra,0x0
     9e0:	f88080e7          	jalr	-120(ra) # 964 <nulterminate>
    nulterminate(lcmd->right);
     9e4:	6888                	ld	a0,16(s1)
     9e6:	00000097          	auipc	ra,0x0
     9ea:	f7e080e7          	jalr	-130(ra) # 964 <nulterminate>
    break;
     9ee:	b7e9                	j	9b8 <nulterminate+0x54>
    nulterminate(bcmd->cmd);
     9f0:	6508                	ld	a0,8(a0)
     9f2:	00000097          	auipc	ra,0x0
     9f6:	f72080e7          	jalr	-142(ra) # 964 <nulterminate>
    break;
     9fa:	bf7d                	j	9b8 <nulterminate+0x54>

00000000000009fc <parsecmd>:
{
     9fc:	7179                	addi	sp,sp,-48
     9fe:	f406                	sd	ra,40(sp)
     a00:	f022                	sd	s0,32(sp)
     a02:	ec26                	sd	s1,24(sp)
     a04:	e84a                	sd	s2,16(sp)
     a06:	1800                	addi	s0,sp,48
     a08:	fca43c23          	sd	a0,-40(s0)
  es = s + strlen(s);
     a0c:	84aa                	mv	s1,a0
     a0e:	00000097          	auipc	ra,0x0
     a12:	1b2080e7          	jalr	434(ra) # bc0 <strlen>
     a16:	1502                	slli	a0,a0,0x20
     a18:	9101                	srli	a0,a0,0x20
     a1a:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     a1c:	85a6                	mv	a1,s1
     a1e:	fd840513          	addi	a0,s0,-40
     a22:	00000097          	auipc	ra,0x0
     a26:	df6080e7          	jalr	-522(ra) # 818 <parseline>
     a2a:	892a                	mv	s2,a0
  peek(&s, es, "");
     a2c:	00001617          	auipc	a2,0x1
     a30:	9e460613          	addi	a2,a2,-1564 # 1410 <malloc+0x1f4>
     a34:	85a6                	mv	a1,s1
     a36:	fd840513          	addi	a0,s0,-40
     a3a:	00000097          	auipc	ra,0x0
     a3e:	b2a080e7          	jalr	-1238(ra) # 564 <peek>
  if(s != es){
     a42:	fd843603          	ld	a2,-40(s0)
     a46:	00961e63          	bne	a2,s1,a62 <parsecmd+0x66>
  nulterminate(cmd);
     a4a:	854a                	mv	a0,s2
     a4c:	00000097          	auipc	ra,0x0
     a50:	f18080e7          	jalr	-232(ra) # 964 <nulterminate>
}
     a54:	854a                	mv	a0,s2
     a56:	70a2                	ld	ra,40(sp)
     a58:	7402                	ld	s0,32(sp)
     a5a:	64e2                	ld	s1,24(sp)
     a5c:	6942                	ld	s2,16(sp)
     a5e:	6145                	addi	sp,sp,48
     a60:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     a62:	00001597          	auipc	a1,0x1
     a66:	9b658593          	addi	a1,a1,-1610 # 1418 <malloc+0x1fc>
     a6a:	4509                	li	a0,2
     a6c:	00000097          	auipc	ra,0x0
     a70:	6c4080e7          	jalr	1732(ra) # 1130 <fprintf>
    panic("syntax");
     a74:	00001517          	auipc	a0,0x1
     a78:	93450513          	addi	a0,a0,-1740 # 13a8 <malloc+0x18c>
     a7c:	fffff097          	auipc	ra,0xfffff
     a80:	5d8080e7          	jalr	1496(ra) # 54 <panic>

0000000000000a84 <main>:
{
     a84:	7139                	addi	sp,sp,-64
     a86:	fc06                	sd	ra,56(sp)
     a88:	f822                	sd	s0,48(sp)
     a8a:	f426                	sd	s1,40(sp)
     a8c:	f04a                	sd	s2,32(sp)
     a8e:	ec4e                	sd	s3,24(sp)
     a90:	e852                	sd	s4,16(sp)
     a92:	e456                	sd	s5,8(sp)
     a94:	0080                	addi	s0,sp,64
  while((fd = open("console", O_RDWR)) >= 0){
     a96:	00001497          	auipc	s1,0x1
     a9a:	99248493          	addi	s1,s1,-1646 # 1428 <malloc+0x20c>
     a9e:	4589                	li	a1,2
     aa0:	8526                	mv	a0,s1
     aa2:	00000097          	auipc	ra,0x0
     aa6:	384080e7          	jalr	900(ra) # e26 <open>
     aaa:	00054963          	bltz	a0,abc <main+0x38>
    if(fd >= 3){
     aae:	4789                	li	a5,2
     ab0:	fea7d7e3          	bge	a5,a0,a9e <main+0x1a>
      close(fd);
     ab4:	00000097          	auipc	ra,0x0
     ab8:	35a080e7          	jalr	858(ra) # e0e <close>
  while(getcmd(buf, sizeof(buf)) >= 0){
     abc:	00001497          	auipc	s1,0x1
     ac0:	9ec48493          	addi	s1,s1,-1556 # 14a8 <buf.0>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     ac4:	06300913          	li	s2,99
     ac8:	02000993          	li	s3,32
      if(chdir(buf+3) < 0)
     acc:	00001a17          	auipc	s4,0x1
     ad0:	9dfa0a13          	addi	s4,s4,-1569 # 14ab <buf.0+0x3>
        fprintf(2, "cannot cd %s\n", buf+3);
     ad4:	00001a97          	auipc	s5,0x1
     ad8:	95ca8a93          	addi	s5,s5,-1700 # 1430 <malloc+0x214>
     adc:	a819                	j	af2 <main+0x6e>
    if(fork1() == 0)
     ade:	fffff097          	auipc	ra,0xfffff
     ae2:	5e8080e7          	jalr	1512(ra) # c6 <fork1>
     ae6:	c925                	beqz	a0,b56 <main+0xd2>
    wait(0);
     ae8:	4501                	li	a0,0
     aea:	00000097          	auipc	ra,0x0
     aee:	304080e7          	jalr	772(ra) # dee <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     af2:	06400593          	li	a1,100
     af6:	8526                	mv	a0,s1
     af8:	fffff097          	auipc	ra,0xfffff
     afc:	508080e7          	jalr	1288(ra) # 0 <getcmd>
     b00:	06054763          	bltz	a0,b6e <main+0xea>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     b04:	0004c783          	lbu	a5,0(s1)
     b08:	fd279be3          	bne	a5,s2,ade <main+0x5a>
     b0c:	0014c703          	lbu	a4,1(s1)
     b10:	06400793          	li	a5,100
     b14:	fcf715e3          	bne	a4,a5,ade <main+0x5a>
     b18:	0024c783          	lbu	a5,2(s1)
     b1c:	fd3791e3          	bne	a5,s3,ade <main+0x5a>
      buf[strlen(buf)-1] = 0;  // chop \n
     b20:	8526                	mv	a0,s1
     b22:	00000097          	auipc	ra,0x0
     b26:	09e080e7          	jalr	158(ra) # bc0 <strlen>
     b2a:	fff5079b          	addiw	a5,a0,-1
     b2e:	1782                	slli	a5,a5,0x20
     b30:	9381                	srli	a5,a5,0x20
     b32:	97a6                	add	a5,a5,s1
     b34:	00078023          	sb	zero,0(a5)
      if(chdir(buf+3) < 0)
     b38:	8552                	mv	a0,s4
     b3a:	00000097          	auipc	ra,0x0
     b3e:	31c080e7          	jalr	796(ra) # e56 <chdir>
     b42:	fa0558e3          	bgez	a0,af2 <main+0x6e>
        fprintf(2, "cannot cd %s\n", buf+3);
     b46:	8652                	mv	a2,s4
     b48:	85d6                	mv	a1,s5
     b4a:	4509                	li	a0,2
     b4c:	00000097          	auipc	ra,0x0
     b50:	5e4080e7          	jalr	1508(ra) # 1130 <fprintf>
     b54:	bf79                	j	af2 <main+0x6e>
      runcmd(parsecmd(buf));
     b56:	00001517          	auipc	a0,0x1
     b5a:	95250513          	addi	a0,a0,-1710 # 14a8 <buf.0>
     b5e:	00000097          	auipc	ra,0x0
     b62:	e9e080e7          	jalr	-354(ra) # 9fc <parsecmd>
     b66:	fffff097          	auipc	ra,0xfffff
     b6a:	58e080e7          	jalr	1422(ra) # f4 <runcmd>
  exit(0);
     b6e:	4501                	li	a0,0
     b70:	00000097          	auipc	ra,0x0
     b74:	276080e7          	jalr	630(ra) # de6 <exit>

0000000000000b78 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     b78:	1141                	addi	sp,sp,-16
     b7a:	e422                	sd	s0,8(sp)
     b7c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b7e:	87aa                	mv	a5,a0
     b80:	0585                	addi	a1,a1,1
     b82:	0785                	addi	a5,a5,1
     b84:	fff5c703          	lbu	a4,-1(a1)
     b88:	fee78fa3          	sb	a4,-1(a5)
     b8c:	fb75                	bnez	a4,b80 <strcpy+0x8>
    ;
  return os;
}
     b8e:	6422                	ld	s0,8(sp)
     b90:	0141                	addi	sp,sp,16
     b92:	8082                	ret

0000000000000b94 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b94:	1141                	addi	sp,sp,-16
     b96:	e422                	sd	s0,8(sp)
     b98:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
     b9a:	00054783          	lbu	a5,0(a0)
     b9e:	cb91                	beqz	a5,bb2 <strcmp+0x1e>
     ba0:	0005c703          	lbu	a4,0(a1)
     ba4:	00f71763          	bne	a4,a5,bb2 <strcmp+0x1e>
    p++, q++;
     ba8:	0505                	addi	a0,a0,1
     baa:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
     bac:	00054783          	lbu	a5,0(a0)
     bb0:	fbe5                	bnez	a5,ba0 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     bb2:	0005c503          	lbu	a0,0(a1)
}
     bb6:	40a7853b          	subw	a0,a5,a0
     bba:	6422                	ld	s0,8(sp)
     bbc:	0141                	addi	sp,sp,16
     bbe:	8082                	ret

0000000000000bc0 <strlen>:

uint
strlen(const char *s)
{
     bc0:	1141                	addi	sp,sp,-16
     bc2:	e422                	sd	s0,8(sp)
     bc4:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
     bc6:	00054783          	lbu	a5,0(a0)
     bca:	cf91                	beqz	a5,be6 <strlen+0x26>
     bcc:	0505                	addi	a0,a0,1
     bce:	87aa                	mv	a5,a0
     bd0:	4685                	li	a3,1
     bd2:	9e89                	subw	a3,a3,a0
     bd4:	00f6853b          	addw	a0,a3,a5
     bd8:	0785                	addi	a5,a5,1
     bda:	fff7c703          	lbu	a4,-1(a5)
     bde:	fb7d                	bnez	a4,bd4 <strlen+0x14>
    ;
  return n;
}
     be0:	6422                	ld	s0,8(sp)
     be2:	0141                	addi	sp,sp,16
     be4:	8082                	ret
  for(n = 0; s[n]; n++)
     be6:	4501                	li	a0,0
     be8:	bfe5                	j	be0 <strlen+0x20>

0000000000000bea <memset>:

void*
memset(void *dst, int c, uint n)
{
     bea:	1141                	addi	sp,sp,-16
     bec:	e422                	sd	s0,8(sp)
     bee:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
     bf0:	ca19                	beqz	a2,c06 <memset+0x1c>
     bf2:	87aa                	mv	a5,a0
     bf4:	1602                	slli	a2,a2,0x20
     bf6:	9201                	srli	a2,a2,0x20
     bf8:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
     bfc:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
     c00:	0785                	addi	a5,a5,1
     c02:	fee79de3          	bne	a5,a4,bfc <memset+0x12>
  }
  return dst;
}
     c06:	6422                	ld	s0,8(sp)
     c08:	0141                	addi	sp,sp,16
     c0a:	8082                	ret

0000000000000c0c <strchr>:

char*
strchr(const char *s, char c)
{
     c0c:	1141                	addi	sp,sp,-16
     c0e:	e422                	sd	s0,8(sp)
     c10:	0800                	addi	s0,sp,16
  for(; *s; s++)
     c12:	00054783          	lbu	a5,0(a0)
     c16:	cb99                	beqz	a5,c2c <strchr+0x20>
    if(*s == c)
     c18:	00f58763          	beq	a1,a5,c26 <strchr+0x1a>
  for(; *s; s++)
     c1c:	0505                	addi	a0,a0,1
     c1e:	00054783          	lbu	a5,0(a0)
     c22:	fbfd                	bnez	a5,c18 <strchr+0xc>
      return (char*)s;
  return 0;
     c24:	4501                	li	a0,0
}
     c26:	6422                	ld	s0,8(sp)
     c28:	0141                	addi	sp,sp,16
     c2a:	8082                	ret
  return 0;
     c2c:	4501                	li	a0,0
     c2e:	bfe5                	j	c26 <strchr+0x1a>

0000000000000c30 <gets>:

char*
gets(char *buf, int max)
{
     c30:	711d                	addi	sp,sp,-96
     c32:	ec86                	sd	ra,88(sp)
     c34:	e8a2                	sd	s0,80(sp)
     c36:	e4a6                	sd	s1,72(sp)
     c38:	e0ca                	sd	s2,64(sp)
     c3a:	fc4e                	sd	s3,56(sp)
     c3c:	f852                	sd	s4,48(sp)
     c3e:	f456                	sd	s5,40(sp)
     c40:	f05a                	sd	s6,32(sp)
     c42:	ec5e                	sd	s7,24(sp)
     c44:	1080                	addi	s0,sp,96
     c46:	8baa                	mv	s7,a0
     c48:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c4a:	892a                	mv	s2,a0
     c4c:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     c4e:	4aa9                	li	s5,10
     c50:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
     c52:	89a6                	mv	s3,s1
     c54:	2485                	addiw	s1,s1,1
     c56:	0344d863          	bge	s1,s4,c86 <gets+0x56>
    cc = read(0, &c, 1);
     c5a:	4605                	li	a2,1
     c5c:	faf40593          	addi	a1,s0,-81
     c60:	4501                	li	a0,0
     c62:	00000097          	auipc	ra,0x0
     c66:	19c080e7          	jalr	412(ra) # dfe <read>
    if(cc < 1)
     c6a:	00a05e63          	blez	a0,c86 <gets+0x56>
    buf[i++] = c;
     c6e:	faf44783          	lbu	a5,-81(s0)
     c72:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
     c76:	01578763          	beq	a5,s5,c84 <gets+0x54>
     c7a:	0905                	addi	s2,s2,1
     c7c:	fd679be3          	bne	a5,s6,c52 <gets+0x22>
  for(i=0; i+1 < max; ){
     c80:	89a6                	mv	s3,s1
     c82:	a011                	j	c86 <gets+0x56>
     c84:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
     c86:	99de                	add	s3,s3,s7
     c88:	00098023          	sb	zero,0(s3)
  return buf;
}
     c8c:	855e                	mv	a0,s7
     c8e:	60e6                	ld	ra,88(sp)
     c90:	6446                	ld	s0,80(sp)
     c92:	64a6                	ld	s1,72(sp)
     c94:	6906                	ld	s2,64(sp)
     c96:	79e2                	ld	s3,56(sp)
     c98:	7a42                	ld	s4,48(sp)
     c9a:	7aa2                	ld	s5,40(sp)
     c9c:	7b02                	ld	s6,32(sp)
     c9e:	6be2                	ld	s7,24(sp)
     ca0:	6125                	addi	sp,sp,96
     ca2:	8082                	ret

0000000000000ca4 <stat>:

int
stat(const char *n, struct stat *st)
{
     ca4:	1101                	addi	sp,sp,-32
     ca6:	ec06                	sd	ra,24(sp)
     ca8:	e822                	sd	s0,16(sp)
     caa:	e426                	sd	s1,8(sp)
     cac:	e04a                	sd	s2,0(sp)
     cae:	1000                	addi	s0,sp,32
     cb0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     cb2:	4581                	li	a1,0
     cb4:	00000097          	auipc	ra,0x0
     cb8:	172080e7          	jalr	370(ra) # e26 <open>
  if(fd < 0)
     cbc:	02054563          	bltz	a0,ce6 <stat+0x42>
     cc0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
     cc2:	85ca                	mv	a1,s2
     cc4:	00000097          	auipc	ra,0x0
     cc8:	17a080e7          	jalr	378(ra) # e3e <fstat>
     ccc:	892a                	mv	s2,a0
  close(fd);
     cce:	8526                	mv	a0,s1
     cd0:	00000097          	auipc	ra,0x0
     cd4:	13e080e7          	jalr	318(ra) # e0e <close>
  return r;
}
     cd8:	854a                	mv	a0,s2
     cda:	60e2                	ld	ra,24(sp)
     cdc:	6442                	ld	s0,16(sp)
     cde:	64a2                	ld	s1,8(sp)
     ce0:	6902                	ld	s2,0(sp)
     ce2:	6105                	addi	sp,sp,32
     ce4:	8082                	ret
    return -1;
     ce6:	597d                	li	s2,-1
     ce8:	bfc5                	j	cd8 <stat+0x34>

0000000000000cea <atoi>:

int
atoi(const char *s)
{
     cea:	1141                	addi	sp,sp,-16
     cec:	e422                	sd	s0,8(sp)
     cee:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     cf0:	00054603          	lbu	a2,0(a0)
     cf4:	fd06079b          	addiw	a5,a2,-48
     cf8:	0ff7f793          	andi	a5,a5,255
     cfc:	4725                	li	a4,9
     cfe:	02f76963          	bltu	a4,a5,d30 <atoi+0x46>
     d02:	86aa                	mv	a3,a0
  n = 0;
     d04:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
     d06:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
     d08:	0685                	addi	a3,a3,1
     d0a:	0025179b          	slliw	a5,a0,0x2
     d0e:	9fa9                	addw	a5,a5,a0
     d10:	0017979b          	slliw	a5,a5,0x1
     d14:	9fb1                	addw	a5,a5,a2
     d16:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
     d1a:	0006c603          	lbu	a2,0(a3)
     d1e:	fd06071b          	addiw	a4,a2,-48
     d22:	0ff77713          	andi	a4,a4,255
     d26:	fee5f1e3          	bgeu	a1,a4,d08 <atoi+0x1e>
  return n;
}
     d2a:	6422                	ld	s0,8(sp)
     d2c:	0141                	addi	sp,sp,16
     d2e:	8082                	ret
  n = 0;
     d30:	4501                	li	a0,0
     d32:	bfe5                	j	d2a <atoi+0x40>

0000000000000d34 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     d34:	1141                	addi	sp,sp,-16
     d36:	e422                	sd	s0,8(sp)
     d38:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
     d3a:	02b57463          	bgeu	a0,a1,d62 <memmove+0x2e>
    while(n-- > 0)
     d3e:	00c05f63          	blez	a2,d5c <memmove+0x28>
     d42:	1602                	slli	a2,a2,0x20
     d44:	9201                	srli	a2,a2,0x20
     d46:	00c507b3          	add	a5,a0,a2
  dst = vdst;
     d4a:	872a                	mv	a4,a0
      *dst++ = *src++;
     d4c:	0585                	addi	a1,a1,1
     d4e:	0705                	addi	a4,a4,1
     d50:	fff5c683          	lbu	a3,-1(a1)
     d54:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
     d58:	fee79ae3          	bne	a5,a4,d4c <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
     d5c:	6422                	ld	s0,8(sp)
     d5e:	0141                	addi	sp,sp,16
     d60:	8082                	ret
    dst += n;
     d62:	00c50733          	add	a4,a0,a2
    src += n;
     d66:	95b2                	add	a1,a1,a2
    while(n-- > 0)
     d68:	fec05ae3          	blez	a2,d5c <memmove+0x28>
     d6c:	fff6079b          	addiw	a5,a2,-1
     d70:	1782                	slli	a5,a5,0x20
     d72:	9381                	srli	a5,a5,0x20
     d74:	fff7c793          	not	a5,a5
     d78:	97ba                	add	a5,a5,a4
      *--dst = *--src;
     d7a:	15fd                	addi	a1,a1,-1
     d7c:	177d                	addi	a4,a4,-1
     d7e:	0005c683          	lbu	a3,0(a1)
     d82:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
     d86:	fee79ae3          	bne	a5,a4,d7a <memmove+0x46>
     d8a:	bfc9                	j	d5c <memmove+0x28>

0000000000000d8c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     d8c:	1141                	addi	sp,sp,-16
     d8e:	e422                	sd	s0,8(sp)
     d90:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
     d92:	ca05                	beqz	a2,dc2 <memcmp+0x36>
     d94:	fff6069b          	addiw	a3,a2,-1
     d98:	1682                	slli	a3,a3,0x20
     d9a:	9281                	srli	a3,a3,0x20
     d9c:	0685                	addi	a3,a3,1
     d9e:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
     da0:	00054783          	lbu	a5,0(a0)
     da4:	0005c703          	lbu	a4,0(a1)
     da8:	00e79863          	bne	a5,a4,db8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
     dac:	0505                	addi	a0,a0,1
    p2++;
     dae:	0585                	addi	a1,a1,1
  while (n-- > 0) {
     db0:	fed518e3          	bne	a0,a3,da0 <memcmp+0x14>
  }
  return 0;
     db4:	4501                	li	a0,0
     db6:	a019                	j	dbc <memcmp+0x30>
      return *p1 - *p2;
     db8:	40e7853b          	subw	a0,a5,a4
}
     dbc:	6422                	ld	s0,8(sp)
     dbe:	0141                	addi	sp,sp,16
     dc0:	8082                	ret
  return 0;
     dc2:	4501                	li	a0,0
     dc4:	bfe5                	j	dbc <memcmp+0x30>

0000000000000dc6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     dc6:	1141                	addi	sp,sp,-16
     dc8:	e406                	sd	ra,8(sp)
     dca:	e022                	sd	s0,0(sp)
     dcc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
     dce:	00000097          	auipc	ra,0x0
     dd2:	f66080e7          	jalr	-154(ra) # d34 <memmove>
}
     dd6:	60a2                	ld	ra,8(sp)
     dd8:	6402                	ld	s0,0(sp)
     dda:	0141                	addi	sp,sp,16
     ddc:	8082                	ret

0000000000000dde <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     dde:	4885                	li	a7,1
 ecall
     de0:	00000073          	ecall
 ret
     de4:	8082                	ret

0000000000000de6 <exit>:
.global exit
exit:
 li a7, SYS_exit
     de6:	4889                	li	a7,2
 ecall
     de8:	00000073          	ecall
 ret
     dec:	8082                	ret

0000000000000dee <wait>:
.global wait
wait:
 li a7, SYS_wait
     dee:	488d                	li	a7,3
 ecall
     df0:	00000073          	ecall
 ret
     df4:	8082                	ret

0000000000000df6 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     df6:	4891                	li	a7,4
 ecall
     df8:	00000073          	ecall
 ret
     dfc:	8082                	ret

0000000000000dfe <read>:
.global read
read:
 li a7, SYS_read
     dfe:	4895                	li	a7,5
 ecall
     e00:	00000073          	ecall
 ret
     e04:	8082                	ret

0000000000000e06 <write>:
.global write
write:
 li a7, SYS_write
     e06:	48c1                	li	a7,16
 ecall
     e08:	00000073          	ecall
 ret
     e0c:	8082                	ret

0000000000000e0e <close>:
.global close
close:
 li a7, SYS_close
     e0e:	48d5                	li	a7,21
 ecall
     e10:	00000073          	ecall
 ret
     e14:	8082                	ret

0000000000000e16 <kill>:
.global kill
kill:
 li a7, SYS_kill
     e16:	4899                	li	a7,6
 ecall
     e18:	00000073          	ecall
 ret
     e1c:	8082                	ret

0000000000000e1e <exec>:
.global exec
exec:
 li a7, SYS_exec
     e1e:	489d                	li	a7,7
 ecall
     e20:	00000073          	ecall
 ret
     e24:	8082                	ret

0000000000000e26 <open>:
.global open
open:
 li a7, SYS_open
     e26:	48bd                	li	a7,15
 ecall
     e28:	00000073          	ecall
 ret
     e2c:	8082                	ret

0000000000000e2e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     e2e:	48c5                	li	a7,17
 ecall
     e30:	00000073          	ecall
 ret
     e34:	8082                	ret

0000000000000e36 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     e36:	48c9                	li	a7,18
 ecall
     e38:	00000073          	ecall
 ret
     e3c:	8082                	ret

0000000000000e3e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     e3e:	48a1                	li	a7,8
 ecall
     e40:	00000073          	ecall
 ret
     e44:	8082                	ret

0000000000000e46 <link>:
.global link
link:
 li a7, SYS_link
     e46:	48cd                	li	a7,19
 ecall
     e48:	00000073          	ecall
 ret
     e4c:	8082                	ret

0000000000000e4e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     e4e:	48d1                	li	a7,20
 ecall
     e50:	00000073          	ecall
 ret
     e54:	8082                	ret

0000000000000e56 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     e56:	48a5                	li	a7,9
 ecall
     e58:	00000073          	ecall
 ret
     e5c:	8082                	ret

0000000000000e5e <dup>:
.global dup
dup:
 li a7, SYS_dup
     e5e:	48a9                	li	a7,10
 ecall
     e60:	00000073          	ecall
 ret
     e64:	8082                	ret

0000000000000e66 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     e66:	48ad                	li	a7,11
 ecall
     e68:	00000073          	ecall
 ret
     e6c:	8082                	ret

0000000000000e6e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     e6e:	48b1                	li	a7,12
 ecall
     e70:	00000073          	ecall
 ret
     e74:	8082                	ret

0000000000000e76 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     e76:	48b5                	li	a7,13
 ecall
     e78:	00000073          	ecall
 ret
     e7c:	8082                	ret

0000000000000e7e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     e7e:	48b9                	li	a7,14
 ecall
     e80:	00000073          	ecall
 ret
     e84:	8082                	ret

0000000000000e86 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     e86:	1101                	addi	sp,sp,-32
     e88:	ec06                	sd	ra,24(sp)
     e8a:	e822                	sd	s0,16(sp)
     e8c:	1000                	addi	s0,sp,32
     e8e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
     e92:	4605                	li	a2,1
     e94:	fef40593          	addi	a1,s0,-17
     e98:	00000097          	auipc	ra,0x0
     e9c:	f6e080e7          	jalr	-146(ra) # e06 <write>
}
     ea0:	60e2                	ld	ra,24(sp)
     ea2:	6442                	ld	s0,16(sp)
     ea4:	6105                	addi	sp,sp,32
     ea6:	8082                	ret

0000000000000ea8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     ea8:	7139                	addi	sp,sp,-64
     eaa:	fc06                	sd	ra,56(sp)
     eac:	f822                	sd	s0,48(sp)
     eae:	f426                	sd	s1,40(sp)
     eb0:	f04a                	sd	s2,32(sp)
     eb2:	ec4e                	sd	s3,24(sp)
     eb4:	0080                	addi	s0,sp,64
     eb6:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     eb8:	c299                	beqz	a3,ebe <printint+0x16>
     eba:	0805c863          	bltz	a1,f4a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     ebe:	2581                	sext.w	a1,a1
  neg = 0;
     ec0:	4881                	li	a7,0
     ec2:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
     ec6:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
     ec8:	2601                	sext.w	a2,a2
     eca:	00000517          	auipc	a0,0x0
     ece:	5ae50513          	addi	a0,a0,1454 # 1478 <digits>
     ed2:	883a                	mv	a6,a4
     ed4:	2705                	addiw	a4,a4,1
     ed6:	02c5f7bb          	remuw	a5,a1,a2
     eda:	1782                	slli	a5,a5,0x20
     edc:	9381                	srli	a5,a5,0x20
     ede:	97aa                	add	a5,a5,a0
     ee0:	0007c783          	lbu	a5,0(a5)
     ee4:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
     ee8:	0005879b          	sext.w	a5,a1
     eec:	02c5d5bb          	divuw	a1,a1,a2
     ef0:	0685                	addi	a3,a3,1
     ef2:	fec7f0e3          	bgeu	a5,a2,ed2 <printint+0x2a>
  if(neg)
     ef6:	00088b63          	beqz	a7,f0c <printint+0x64>
    buf[i++] = '-';
     efa:	fd040793          	addi	a5,s0,-48
     efe:	973e                	add	a4,a4,a5
     f00:	02d00793          	li	a5,45
     f04:	fef70823          	sb	a5,-16(a4)
     f08:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
     f0c:	02e05863          	blez	a4,f3c <printint+0x94>
     f10:	fc040793          	addi	a5,s0,-64
     f14:	00e78933          	add	s2,a5,a4
     f18:	fff78993          	addi	s3,a5,-1
     f1c:	99ba                	add	s3,s3,a4
     f1e:	377d                	addiw	a4,a4,-1
     f20:	1702                	slli	a4,a4,0x20
     f22:	9301                	srli	a4,a4,0x20
     f24:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
     f28:	fff94583          	lbu	a1,-1(s2)
     f2c:	8526                	mv	a0,s1
     f2e:	00000097          	auipc	ra,0x0
     f32:	f58080e7          	jalr	-168(ra) # e86 <putc>
  while(--i >= 0)
     f36:	197d                	addi	s2,s2,-1
     f38:	ff3918e3          	bne	s2,s3,f28 <printint+0x80>
}
     f3c:	70e2                	ld	ra,56(sp)
     f3e:	7442                	ld	s0,48(sp)
     f40:	74a2                	ld	s1,40(sp)
     f42:	7902                	ld	s2,32(sp)
     f44:	69e2                	ld	s3,24(sp)
     f46:	6121                	addi	sp,sp,64
     f48:	8082                	ret
    x = -xx;
     f4a:	40b005bb          	negw	a1,a1
    neg = 1;
     f4e:	4885                	li	a7,1
    x = -xx;
     f50:	bf8d                	j	ec2 <printint+0x1a>

0000000000000f52 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     f52:	7119                	addi	sp,sp,-128
     f54:	fc86                	sd	ra,120(sp)
     f56:	f8a2                	sd	s0,112(sp)
     f58:	f4a6                	sd	s1,104(sp)
     f5a:	f0ca                	sd	s2,96(sp)
     f5c:	ecce                	sd	s3,88(sp)
     f5e:	e8d2                	sd	s4,80(sp)
     f60:	e4d6                	sd	s5,72(sp)
     f62:	e0da                	sd	s6,64(sp)
     f64:	fc5e                	sd	s7,56(sp)
     f66:	f862                	sd	s8,48(sp)
     f68:	f466                	sd	s9,40(sp)
     f6a:	f06a                	sd	s10,32(sp)
     f6c:	ec6e                	sd	s11,24(sp)
     f6e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
     f70:	0005c903          	lbu	s2,0(a1)
     f74:	18090f63          	beqz	s2,1112 <vprintf+0x1c0>
     f78:	8aaa                	mv	s5,a0
     f7a:	8b32                	mv	s6,a2
     f7c:	00158493          	addi	s1,a1,1
  state = 0;
     f80:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     f82:	02500a13          	li	s4,37
      if(c == 'd'){
     f86:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
     f8a:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
     f8e:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
     f92:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     f96:	00000b97          	auipc	s7,0x0
     f9a:	4e2b8b93          	addi	s7,s7,1250 # 1478 <digits>
     f9e:	a839                	j	fbc <vprintf+0x6a>
        putc(fd, c);
     fa0:	85ca                	mv	a1,s2
     fa2:	8556                	mv	a0,s5
     fa4:	00000097          	auipc	ra,0x0
     fa8:	ee2080e7          	jalr	-286(ra) # e86 <putc>
     fac:	a019                	j	fb2 <vprintf+0x60>
    } else if(state == '%'){
     fae:	01498f63          	beq	s3,s4,fcc <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
     fb2:	0485                	addi	s1,s1,1
     fb4:	fff4c903          	lbu	s2,-1(s1)
     fb8:	14090d63          	beqz	s2,1112 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
     fbc:	0009079b          	sext.w	a5,s2
    if(state == 0){
     fc0:	fe0997e3          	bnez	s3,fae <vprintf+0x5c>
      if(c == '%'){
     fc4:	fd479ee3          	bne	a5,s4,fa0 <vprintf+0x4e>
        state = '%';
     fc8:	89be                	mv	s3,a5
     fca:	b7e5                	j	fb2 <vprintf+0x60>
      if(c == 'd'){
     fcc:	05878063          	beq	a5,s8,100c <vprintf+0xba>
      } else if(c == 'l') {
     fd0:	05978c63          	beq	a5,s9,1028 <vprintf+0xd6>
      } else if(c == 'x') {
     fd4:	07a78863          	beq	a5,s10,1044 <vprintf+0xf2>
      } else if(c == 'p') {
     fd8:	09b78463          	beq	a5,s11,1060 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
     fdc:	07300713          	li	a4,115
     fe0:	0ce78663          	beq	a5,a4,10ac <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     fe4:	06300713          	li	a4,99
     fe8:	0ee78e63          	beq	a5,a4,10e4 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
     fec:	11478863          	beq	a5,s4,10fc <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ff0:	85d2                	mv	a1,s4
     ff2:	8556                	mv	a0,s5
     ff4:	00000097          	auipc	ra,0x0
     ff8:	e92080e7          	jalr	-366(ra) # e86 <putc>
        putc(fd, c);
     ffc:	85ca                	mv	a1,s2
     ffe:	8556                	mv	a0,s5
    1000:	00000097          	auipc	ra,0x0
    1004:	e86080e7          	jalr	-378(ra) # e86 <putc>
      }
      state = 0;
    1008:	4981                	li	s3,0
    100a:	b765                	j	fb2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
    100c:	008b0913          	addi	s2,s6,8
    1010:	4685                	li	a3,1
    1012:	4629                	li	a2,10
    1014:	000b2583          	lw	a1,0(s6)
    1018:	8556                	mv	a0,s5
    101a:	00000097          	auipc	ra,0x0
    101e:	e8e080e7          	jalr	-370(ra) # ea8 <printint>
    1022:	8b4a                	mv	s6,s2
      state = 0;
    1024:	4981                	li	s3,0
    1026:	b771                	j	fb2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1028:	008b0913          	addi	s2,s6,8
    102c:	4681                	li	a3,0
    102e:	4629                	li	a2,10
    1030:	000b2583          	lw	a1,0(s6)
    1034:	8556                	mv	a0,s5
    1036:	00000097          	auipc	ra,0x0
    103a:	e72080e7          	jalr	-398(ra) # ea8 <printint>
    103e:	8b4a                	mv	s6,s2
      state = 0;
    1040:	4981                	li	s3,0
    1042:	bf85                	j	fb2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    1044:	008b0913          	addi	s2,s6,8
    1048:	4681                	li	a3,0
    104a:	4641                	li	a2,16
    104c:	000b2583          	lw	a1,0(s6)
    1050:	8556                	mv	a0,s5
    1052:	00000097          	auipc	ra,0x0
    1056:	e56080e7          	jalr	-426(ra) # ea8 <printint>
    105a:	8b4a                	mv	s6,s2
      state = 0;
    105c:	4981                	li	s3,0
    105e:	bf91                	j	fb2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    1060:	008b0793          	addi	a5,s6,8
    1064:	f8f43423          	sd	a5,-120(s0)
    1068:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    106c:	03000593          	li	a1,48
    1070:	8556                	mv	a0,s5
    1072:	00000097          	auipc	ra,0x0
    1076:	e14080e7          	jalr	-492(ra) # e86 <putc>
  putc(fd, 'x');
    107a:	85ea                	mv	a1,s10
    107c:	8556                	mv	a0,s5
    107e:	00000097          	auipc	ra,0x0
    1082:	e08080e7          	jalr	-504(ra) # e86 <putc>
    1086:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    1088:	03c9d793          	srli	a5,s3,0x3c
    108c:	97de                	add	a5,a5,s7
    108e:	0007c583          	lbu	a1,0(a5)
    1092:	8556                	mv	a0,s5
    1094:	00000097          	auipc	ra,0x0
    1098:	df2080e7          	jalr	-526(ra) # e86 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    109c:	0992                	slli	s3,s3,0x4
    109e:	397d                	addiw	s2,s2,-1
    10a0:	fe0914e3          	bnez	s2,1088 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
    10a4:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    10a8:	4981                	li	s3,0
    10aa:	b721                	j	fb2 <vprintf+0x60>
        s = va_arg(ap, char*);
    10ac:	008b0993          	addi	s3,s6,8
    10b0:	000b3903          	ld	s2,0(s6)
        if(s == 0)
    10b4:	02090163          	beqz	s2,10d6 <vprintf+0x184>
        while(*s != 0){
    10b8:	00094583          	lbu	a1,0(s2)
    10bc:	c9a1                	beqz	a1,110c <vprintf+0x1ba>
          putc(fd, *s);
    10be:	8556                	mv	a0,s5
    10c0:	00000097          	auipc	ra,0x0
    10c4:	dc6080e7          	jalr	-570(ra) # e86 <putc>
          s++;
    10c8:	0905                	addi	s2,s2,1
        while(*s != 0){
    10ca:	00094583          	lbu	a1,0(s2)
    10ce:	f9e5                	bnez	a1,10be <vprintf+0x16c>
        s = va_arg(ap, char*);
    10d0:	8b4e                	mv	s6,s3
      state = 0;
    10d2:	4981                	li	s3,0
    10d4:	bdf9                	j	fb2 <vprintf+0x60>
          s = "(null)";
    10d6:	00000917          	auipc	s2,0x0
    10da:	39a90913          	addi	s2,s2,922 # 1470 <malloc+0x254>
        while(*s != 0){
    10de:	02800593          	li	a1,40
    10e2:	bff1                	j	10be <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
    10e4:	008b0913          	addi	s2,s6,8
    10e8:	000b4583          	lbu	a1,0(s6)
    10ec:	8556                	mv	a0,s5
    10ee:	00000097          	auipc	ra,0x0
    10f2:	d98080e7          	jalr	-616(ra) # e86 <putc>
    10f6:	8b4a                	mv	s6,s2
      state = 0;
    10f8:	4981                	li	s3,0
    10fa:	bd65                	j	fb2 <vprintf+0x60>
        putc(fd, c);
    10fc:	85d2                	mv	a1,s4
    10fe:	8556                	mv	a0,s5
    1100:	00000097          	auipc	ra,0x0
    1104:	d86080e7          	jalr	-634(ra) # e86 <putc>
      state = 0;
    1108:	4981                	li	s3,0
    110a:	b565                	j	fb2 <vprintf+0x60>
        s = va_arg(ap, char*);
    110c:	8b4e                	mv	s6,s3
      state = 0;
    110e:	4981                	li	s3,0
    1110:	b54d                	j	fb2 <vprintf+0x60>
    }
  }
}
    1112:	70e6                	ld	ra,120(sp)
    1114:	7446                	ld	s0,112(sp)
    1116:	74a6                	ld	s1,104(sp)
    1118:	7906                	ld	s2,96(sp)
    111a:	69e6                	ld	s3,88(sp)
    111c:	6a46                	ld	s4,80(sp)
    111e:	6aa6                	ld	s5,72(sp)
    1120:	6b06                	ld	s6,64(sp)
    1122:	7be2                	ld	s7,56(sp)
    1124:	7c42                	ld	s8,48(sp)
    1126:	7ca2                	ld	s9,40(sp)
    1128:	7d02                	ld	s10,32(sp)
    112a:	6de2                	ld	s11,24(sp)
    112c:	6109                	addi	sp,sp,128
    112e:	8082                	ret

0000000000001130 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    1130:	715d                	addi	sp,sp,-80
    1132:	ec06                	sd	ra,24(sp)
    1134:	e822                	sd	s0,16(sp)
    1136:	1000                	addi	s0,sp,32
    1138:	e010                	sd	a2,0(s0)
    113a:	e414                	sd	a3,8(s0)
    113c:	e818                	sd	a4,16(s0)
    113e:	ec1c                	sd	a5,24(s0)
    1140:	03043023          	sd	a6,32(s0)
    1144:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    1148:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    114c:	8622                	mv	a2,s0
    114e:	00000097          	auipc	ra,0x0
    1152:	e04080e7          	jalr	-508(ra) # f52 <vprintf>
}
    1156:	60e2                	ld	ra,24(sp)
    1158:	6442                	ld	s0,16(sp)
    115a:	6161                	addi	sp,sp,80
    115c:	8082                	ret

000000000000115e <printf>:

void
printf(const char *fmt, ...)
{
    115e:	711d                	addi	sp,sp,-96
    1160:	ec06                	sd	ra,24(sp)
    1162:	e822                	sd	s0,16(sp)
    1164:	1000                	addi	s0,sp,32
    1166:	e40c                	sd	a1,8(s0)
    1168:	e810                	sd	a2,16(s0)
    116a:	ec14                	sd	a3,24(s0)
    116c:	f018                	sd	a4,32(s0)
    116e:	f41c                	sd	a5,40(s0)
    1170:	03043823          	sd	a6,48(s0)
    1174:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1178:	00840613          	addi	a2,s0,8
    117c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    1180:	85aa                	mv	a1,a0
    1182:	4505                	li	a0,1
    1184:	00000097          	auipc	ra,0x0
    1188:	dce080e7          	jalr	-562(ra) # f52 <vprintf>
}
    118c:	60e2                	ld	ra,24(sp)
    118e:	6442                	ld	s0,16(sp)
    1190:	6125                	addi	sp,sp,96
    1192:	8082                	ret

0000000000001194 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1194:	1141                	addi	sp,sp,-16
    1196:	e422                	sd	s0,8(sp)
    1198:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    119a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    119e:	00000797          	auipc	a5,0x0
    11a2:	3027b783          	ld	a5,770(a5) # 14a0 <freep>
    11a6:	a805                	j	11d6 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    11a8:	4618                	lw	a4,8(a2)
    11aa:	9db9                	addw	a1,a1,a4
    11ac:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    11b0:	6398                	ld	a4,0(a5)
    11b2:	6318                	ld	a4,0(a4)
    11b4:	fee53823          	sd	a4,-16(a0)
    11b8:	a091                	j	11fc <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    11ba:	ff852703          	lw	a4,-8(a0)
    11be:	9e39                	addw	a2,a2,a4
    11c0:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    11c2:	ff053703          	ld	a4,-16(a0)
    11c6:	e398                	sd	a4,0(a5)
    11c8:	a099                	j	120e <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11ca:	6398                	ld	a4,0(a5)
    11cc:	00e7e463          	bltu	a5,a4,11d4 <free+0x40>
    11d0:	00e6ea63          	bltu	a3,a4,11e4 <free+0x50>
{
    11d4:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11d6:	fed7fae3          	bgeu	a5,a3,11ca <free+0x36>
    11da:	6398                	ld	a4,0(a5)
    11dc:	00e6e463          	bltu	a3,a4,11e4 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11e0:	fee7eae3          	bltu	a5,a4,11d4 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
    11e4:	ff852583          	lw	a1,-8(a0)
    11e8:	6390                	ld	a2,0(a5)
    11ea:	02059713          	slli	a4,a1,0x20
    11ee:	9301                	srli	a4,a4,0x20
    11f0:	0712                	slli	a4,a4,0x4
    11f2:	9736                	add	a4,a4,a3
    11f4:	fae60ae3          	beq	a2,a4,11a8 <free+0x14>
    bp->s.ptr = p->s.ptr;
    11f8:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    11fc:	4790                	lw	a2,8(a5)
    11fe:	02061713          	slli	a4,a2,0x20
    1202:	9301                	srli	a4,a4,0x20
    1204:	0712                	slli	a4,a4,0x4
    1206:	973e                	add	a4,a4,a5
    1208:	fae689e3          	beq	a3,a4,11ba <free+0x26>
  } else
    p->s.ptr = bp;
    120c:	e394                	sd	a3,0(a5)
  freep = p;
    120e:	00000717          	auipc	a4,0x0
    1212:	28f73923          	sd	a5,658(a4) # 14a0 <freep>
}
    1216:	6422                	ld	s0,8(sp)
    1218:	0141                	addi	sp,sp,16
    121a:	8082                	ret

000000000000121c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    121c:	7139                	addi	sp,sp,-64
    121e:	fc06                	sd	ra,56(sp)
    1220:	f822                	sd	s0,48(sp)
    1222:	f426                	sd	s1,40(sp)
    1224:	f04a                	sd	s2,32(sp)
    1226:	ec4e                	sd	s3,24(sp)
    1228:	e852                	sd	s4,16(sp)
    122a:	e456                	sd	s5,8(sp)
    122c:	e05a                	sd	s6,0(sp)
    122e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1230:	02051493          	slli	s1,a0,0x20
    1234:	9081                	srli	s1,s1,0x20
    1236:	04bd                	addi	s1,s1,15
    1238:	8091                	srli	s1,s1,0x4
    123a:	0014899b          	addiw	s3,s1,1
    123e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    1240:	00000517          	auipc	a0,0x0
    1244:	26053503          	ld	a0,608(a0) # 14a0 <freep>
    1248:	c515                	beqz	a0,1274 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    124a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    124c:	4798                	lw	a4,8(a5)
    124e:	02977f63          	bgeu	a4,s1,128c <malloc+0x70>
    1252:	8a4e                	mv	s4,s3
    1254:	0009871b          	sext.w	a4,s3
    1258:	6685                	lui	a3,0x1
    125a:	00d77363          	bgeu	a4,a3,1260 <malloc+0x44>
    125e:	6a05                	lui	s4,0x1
    1260:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    1264:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1268:	00000917          	auipc	s2,0x0
    126c:	23890913          	addi	s2,s2,568 # 14a0 <freep>
  if(p == (char*)-1)
    1270:	5afd                	li	s5,-1
    1272:	a88d                	j	12e4 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
    1274:	00000797          	auipc	a5,0x0
    1278:	29c78793          	addi	a5,a5,668 # 1510 <base>
    127c:	00000717          	auipc	a4,0x0
    1280:	22f73223          	sd	a5,548(a4) # 14a0 <freep>
    1284:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    1286:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    128a:	b7e1                	j	1252 <malloc+0x36>
      if(p->s.size == nunits)
    128c:	02e48b63          	beq	s1,a4,12c2 <malloc+0xa6>
        p->s.size -= nunits;
    1290:	4137073b          	subw	a4,a4,s3
    1294:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1296:	1702                	slli	a4,a4,0x20
    1298:	9301                	srli	a4,a4,0x20
    129a:	0712                	slli	a4,a4,0x4
    129c:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    129e:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    12a2:	00000717          	auipc	a4,0x0
    12a6:	1ea73f23          	sd	a0,510(a4) # 14a0 <freep>
      return (void*)(p + 1);
    12aa:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    12ae:	70e2                	ld	ra,56(sp)
    12b0:	7442                	ld	s0,48(sp)
    12b2:	74a2                	ld	s1,40(sp)
    12b4:	7902                	ld	s2,32(sp)
    12b6:	69e2                	ld	s3,24(sp)
    12b8:	6a42                	ld	s4,16(sp)
    12ba:	6aa2                	ld	s5,8(sp)
    12bc:	6b02                	ld	s6,0(sp)
    12be:	6121                	addi	sp,sp,64
    12c0:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    12c2:	6398                	ld	a4,0(a5)
    12c4:	e118                	sd	a4,0(a0)
    12c6:	bff1                	j	12a2 <malloc+0x86>
  hp->s.size = nu;
    12c8:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    12cc:	0541                	addi	a0,a0,16
    12ce:	00000097          	auipc	ra,0x0
    12d2:	ec6080e7          	jalr	-314(ra) # 1194 <free>
  return freep;
    12d6:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    12da:	d971                	beqz	a0,12ae <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12dc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    12de:	4798                	lw	a4,8(a5)
    12e0:	fa9776e3          	bgeu	a4,s1,128c <malloc+0x70>
    if(p == freep)
    12e4:	00093703          	ld	a4,0(s2)
    12e8:	853e                	mv	a0,a5
    12ea:	fef719e3          	bne	a4,a5,12dc <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
    12ee:	8552                	mv	a0,s4
    12f0:	00000097          	auipc	ra,0x0
    12f4:	b7e080e7          	jalr	-1154(ra) # e6e <sbrk>
  if(p == (char*)-1)
    12f8:	fd5518e3          	bne	a0,s5,12c8 <malloc+0xac>
        return 0;
    12fc:	4501                	li	a0,0
    12fe:	bf45                	j	12ae <malloc+0x92>
