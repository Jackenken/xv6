

# backtrace

这里有个问题，第一个栈帧不用打印吗？
即 PGROUNDUP(fp) - PGROUNDDOWN(fp) == 0 时，属于第一个栈帧！！！

```c

void
backtrace(void) {
  printf("backtrace:\n");
  // 读取当前帧指针
  uint64 fp = r_fp();
  while (PGROUNDUP(fp) - PGROUNDDOWN(fp) == PGSIZE) {
    // 返回地址保存在-8偏移的位置
    uint64 ret_addr = *(uint64*)(fp - 8);
    printf("%p\n", ret_addr);
    // 前一个帧指针保存在-16偏移的位置
    fp = *(uint64*)(fp - 16);
  }
}
```

# alarm


这里也有一个重要的问题，就是时间中断后，将trapframe->epc修改后，使得中断返回后回到设定的epc地址的位置，换句话说从时间中断时trapframe保存的用户态数据 d1，到时间中断结束后的返回设定的位置时的用户态d2，d1与d2相差只相差epc的值。在执行alarm的prinf时又将进入中断，此时将目前的寄存器保存起来，从而覆盖了d1，也就是说，再次进入中断时，trapframe保存的时d2的状态而不是d1的状态，那么问题来了，它本来应该执行完alarm之后就不知道去哪了，因为它回不去了，回不到d1的状态自然回不去原来执行的位置了，程序是如何继续正常执行的呢？



# 参考

https://github.com/duguosheng/6.S081-All-in-one/blob/main/labs/answers/lab4.md