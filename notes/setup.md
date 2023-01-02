# starting xv6, the first process and system call

1. 首先将xv6内核加载到内存中，CPU在machine mode下执行 _entry(kernel/entry.S:7)，此时硬件分页机制还没启动，所以虚拟地址直接映射到物理地址。loader将kernel加载到0x80000000，在0x0到0x80000000之间存在IO设备。
   
        _entry:
            # set up a stack for C.
            # stack0 is declared in /kernel/start.c:11,
            # with a 4096-byte stack per CPU.
            # sp = stack0 + (hartid * 4096)
            la sp, stack0
            li a0, 1024*4
            csrr a1, mhartid
            addi a1, a1, 1
            mul a0, a0, a1
            add sp, sp, a0
        # jump to start() in start.c
            call start
    在/kernel/start.c:11中申请了一个栈，用于执行C代码。每个CPU的栈的长度为4*1024=4096 bytes。

2. 之后_entry调用/kernel/start.c:21,start中设置一些在machine mode下才能进行的一些设置，然后通过 “mret” 进入到main(kernel/main.c:11)。
3. 进入到main中，进行一系列设置（之后需要详细研究），到了进入userinit(kernel/proc.c:226)。
4. 之后执行 initcode(user/initcode.S)，调用SYS_exec，ecall 返回到内核(kernel/syscall.c)
   
        start:
            la a0, init
            la a1, argv
            li a7, SYS_exec
            ecall   
5. 执行exec，将init（user/init.c：15）代码复制到原进程内存，指令来到用户层
6. 在init中进行一些输出，再执行exec(sh)，这样shell进程就开始了。整个系统也就启动完毕了！！

7. 启动过程调用文件顺序如下图所示！
   
    ![](photo/Screenshot%20from%202023-01-02%2014-44-08.png)