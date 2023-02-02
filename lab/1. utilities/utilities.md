# find

在find函数中，要注意的一点就是不能递归 “.” 和 “..”目录

# pingpong

在pingpong中，父进程的 wait(0) 非常重要，如果没有这个等待，控制台输出会交错打印。如下输出，‘$’ 与 Received Pong 交错。

    xv6 kernel is booting

    hart 2 starting
    hart 1 starting
    init: starting sh
    $ pingpong 
    3: received ping
    4: r$e ceived pong
    |

# primes

primes中需要解决什么时候停止fork的问题，现在是让它自己没有内存了自动终止，但是这是一个不好的方法，勉强通过实验罢了。