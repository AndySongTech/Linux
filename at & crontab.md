## at & crontab

```
我们可以通过一些设置。来让电脑定时提醒我们该做什么事了。或者我们提前设置好，告诉电脑你几点做什么几点做什么，这种我们就叫它定时任务。而遇到一些需要执行的事情或任务。我们也可以通过命令来告诉电脑一会临时把这个工作给做一下

总结：在我们LINUX中，我们可以通过crontab和at这两个东西来实现这些功能的

计划任务的作用：是做一些周期性的任务，在生产中的主要用来定期备份数据

 

计划任务的安排方式分两种:

一种是定时性的，也就是例行。就是每隔一定的周期就要重复来做这个事情

一种是突发性的，就是这次做完了这个事，就没有下一次了，临时决定，只执行一次的任务

 

at和crontab这两个命令：

at：它是一个可以处理仅执行一次就结束的指令

crontab：它是会把你指定的工作或任务，比如：脚本等，按照你设定的周期一直循环执行下去

 

at一次性计划任务使用
 

at语法格式：at 时间

 

1. 下载at程序

[root@ken ~]# yum install at -y
 

2. 启动atd服务

[root@ken ~]# systemctl restart atd
[root@ken ~]# ps aux |  grep atd
root       1166  0.0  0.1  25904   944 ?        Ss   17:52   0:00 /usr/sbin/at -f
root       1168  0.0  0.1 112704   956 pts/0    S+   17:52   0:00 grep --color=auto atd
 

3. 设置at计划任务

复制代码
[root@ken ~]# at 10:00                       #如果是上午时间，后面加上am，比如9:20am
at> touch /tmp/test1                         #输入你要执行的命令
at> <EOT>                                    #按ctrl+d保存
job 1 at Fri Mar  1 10:00:00 2019
[root@ken ~]# at -l                          #查看计划任务
1    Fri Mar  1 10:00:00 2019 a root
[root@ken ~]# atq                            #查看计划任务
1    Fri Mar  1 10:00:00 2019 a root
复制代码
 

4. 删除计划任务atrm

[root@ken ~]# at -l                           #第一步查看计划任务，获取前面编号
1    Fri Mar  1 10:00:00 2019 a root
[root@ken ~]# atrm 1                          #删除计划任务加上编号
[root@ken ~]# at -l                           #再次查看计划任务发现已经删除
 
 

5. at计划任务的特殊写法

[root@ken ~]# at 20:00 2018-10-1   在某天 
[root@ken ~]# at now +10min   在 10分钟后执行
[root@ken ~]# at 17:00 tomorrow   明天下午5点执行
[root@ken ~]# at 6:00 pm +3 days   在3天以后的下午6点执行
 

crontab定时任务的使用
 

语法：#crontab -u  -e

         常用选项：

                  -l：list，列出指定用户的计划任务列表

                  -e：edit，编辑指定用户的计划任务列表

                  -u：user，指定的用户名，如果不指定，则表示当前用户

                  -r：remove，删除指定用户的计划任务列表

 

1. 查看进程是否启动

[root@ken ~]# ps aux | grep crond
root        621  0.0  0.3 126284  1600 ?        Ss   17:46   0:00 /usr/sbin/crond -n
root       1194  0.0  0.1 112704   956 pts/0    S+   18:05   0:00 grep --color=auto crond
 

2. 查看计划任务

[root@ken ~]# crontab -l
no crontab for root
 

3. 编写计划任务

计划任务的规则语法格式，以行为单位，一行为一个计划：

分 时 日 月 周 需要执行的命令

执行的命令建议写成绝对路径的格式！

 

例如：如果想要每天的0点0分执行reboot指令，则可以写成

0 0 * * * reboot

 

取值范围（常识）：

分：0~59

时：0~23

日：1~31

月：1~12

周：0~7，0和7表示星期天

 

四个符号：

*：表示取值范围中的每一个数字

-：做连续区间表达式的，要想表示1~7，则可以写成：1-7

/：表示每多少个，例如：想每10分钟一次，则可以在分的位置写：*/10

,：表示多个取值，比如想在1点，2点6点执行，则可以在时的位置写：1,2,6

 

问题1：每月1、10、22日的4:45重启network服务

45  4  1,10,22  *  *  systemctl restart network （每月，周没有制定）

 

问题2：每周六、周日的1:10重启network服务

10  1  *  *  6,7  systemctl restart network   （日、月没有指定）

 

问题3：每天18:00至23:00之间每隔30分钟重启network服务

*/30  18-23  *  *  *  systemctl restart network  （ 日 月 周 没有指定）

 

问题4：每隔两天的上午8点到11点的第3和第15分钟执行一次重启

3,15  8-11  */2  *  *  reboot   （月和周没有指定）

 

案例：真实测试案例，每1分钟往root家目录中的ken.txt中输一个123，为了看到效果使用追加输出

 

[root@ken ~]# crontab -e                    #编写计划任务
* * * * * echo "123" >> /root/ken.txt       
[root@ken ~]# tail -f ken.txt               #查看计划任务执行结果
123
123
 

4. 删除计划任务

[root@ken ~]# crontab -l
* * * * * echo "123" >> /root/ken.txt
[root@ken ~]# crontab -r
[root@ken ~]# crontab -l
no crontab for root
注意：在计划任务中，默认的最小单位就是分，不能再小了。

5. 实战案例
>crontab -e
*/1 * * * * cd ~/ && /bin/bash countdown.sh   # 进入sh文件所在的目录，通过/bin/bash执行脚本, 每分钟运行一次脚本

>crontab -e
*/1 * * * * /bin/bash ~/Downloads/countdown.sh  
 
```
