<!-- TOC -->

- [1. Speed up system calls (getpid())](#1-speed-up-system-calls-getpid)
  - [原理](#原理)
- [2. Print a page table](#2-print-a-page-table)
  - [原理](#原理-1)
- [Detecting which pages have been accessed](#detecting-which-pages-have-been-accessed)
  - [原理](#原理-2)

<!-- /TOC -->



# 1. Speed up system calls (getpid())

## 原理

加速系统调用就是让程序不在内核与用户之间切换，那么就是说需要共享一块内存区域，使得用户和内核都可以读取的区域。准确来说内核对该区域可读写，用户只能读。

由此，我们想到trampoline就是类似这样做的（内核和用户都可以访问该区域）。故申请一页内存用来存放加速所需的数据。并且在申请之后，马上向该区域写入所需数据，这时候 USYSCALL 还没有装入页表中（这里存在疑问，说不清，以后再看，总之就是说，写入数据的时候USYSCALL 还没有装入页表中）。

- 申请内存并写入数据

```c
// proc.c/allocproc()

// Allocate a USYSCALL page.
if((p->usyscall = (struct usyscall*)kalloc()) == 0){
freeproc(p);
release(&p->lock);
return 0;
}

p->usyscall->pid = p->pid; // must brfore setting pagetable i.e. before p->pagetable = proc_pagetable(p)
```

- 在页表中加入 USYSCALL 映射
  
  这里如果没有设置 PTE_U 那么用户无法访问该页表项，导致报错如下

        usertrap(): unexpected scause 0x000000000000000d pid=4
        sepc=0x0000000000000478 stval=0x0000003fffffd000

```c

//proc.c/proc_pagetable()

// USYSCALL mapping , just below trapframe
if(mappages(pagetable, USYSCALL, PGSIZE,
            (uint64)(p->usyscall), PTE_R | PTE_U) < 0){
//      without PTE_U, will cause
//      usertrap(): unexpected scause 0x000000000000000d pid=4
//      sepc=0x0000000000000478 stval=0x0000003fffffd000
uvmunmap(pagetable, USYSCALL, 1, 0);
uvmfree(pagetable, 0);
return 0;
}
```

- 释放物理内存和页表项（释放了页表项便释放了虚拟内存）

```c
// proc.c/freeproc()

if(p->usyscall)
kfree((void*)p->usyscall);

```

```c
// proc.c/proc_freepagetable()

uvmunmap(pagetable, USYSCALL, 1, 0);

```

# 2. Print a page table

## 原理

打印页表便是遍历页表，所以遍历就好！

这里遇到一个疏忽，就是复制了 freewalk 函数。忘记删除 其中 一条将页表指针置为0语句，导致打印完后程序不再运行！


***复制代码一定要清楚每一条语句的作用！！！！！***

```c
// vm.c


void  vmprint(pagetable_t pgtbl){
    printf("page table %p\n",pgtbl);
    vmprintlevel(pgtbl,1);
}
void  vmprintlevel(pagetable_t pgtbl,int level){
    char* delm = 0;
    if(level==1) {
        delm = "..";
    } else if(level==2){
        delm = ".. ..";
    } else if(level==3){
        delm = ".. .. ..";
    }
    for(int i = 0; i < 512; i++){
        pte_t pte = pgtbl[i];
        if(pte & PTE_V){
            printf("%s%d: pte %p pa %p\n", delm,i, pte, PTE2PA(pte));
            if(level<3)
                vmprintlevel((pagetable_t)PTE2PA(pte),level+1);
//            pgtbl[i] = 0;   // it clears the pagetable!!!! must be deleted!!
        }
    }
}

```

# Detecting which pages have been accessed 

## 原理

遍历给的地址，如果该页表项的 PTE_A 为 1 ，则表示该页被访问。检测之后必须把该页的 PTE_A 置为0，因为检测需要访问 该表项，故检测之后一定是 PTE_A = 1 。

***这里在 uint 与 uint * 的选择上需要再深入的思考。***

```c
// sysproc.c

int
sys_pgaccess(void)
{
//  at start, i use uint* rather than uint , which causes printf("arg1 = %p, arg2 = %d, arg3 = %p\n",vaf,num,output) interupted
  uint64 vaf=0;  // if you donot want to controll the memory, select normal types rather than pointer
  uint64 output=0;
  uint64 buf=0;
  int num=0;
  if(argaddr(0,&vaf)<0 || argint(1,&num)<0 || argaddr(2,&output))
      return -1;
//  printf("arg1 = %p, arg2 = %d, arg3 = %p\n",vaf,num,output);
  pagetable_t pagetable = myproc()->pagetable;
  for(int i = 0; i<num;i++,vaf+=PGSIZE){
      pte_t *pte = walk(pagetable, vaf, 0);
      if((*pte & PTE_A)!=0){
          buf |= (1<<i);
      }
      *pte &=(~PTE_A);
  }
//  printf("output = %d\n",buf);
  copyout(pagetable, output, (char *)&buf, sizeof(buf));
  return 0;
}
```












