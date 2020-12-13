## Linux Basic Commands

#### Linux系统中常见的目录名称以及相应内容
```python
/: 根目录
/boot: 开机所需文件—内核、开机菜单以及所需配置文件等
/dev: 以文件形式存放任何设备与接口
/etc: 配置文件
/home: 用户主目录
/bin: 存放单用户模式下还可以操作的命令
/lib: 开机时用到的函数库，以及/bin与/sbin下面的命令要调用的函数
/sbin: 开机过程中需要的命令
/media: 用于挂载设备文件的目录
/opt: 放置第三方的软件
/root: 系统管理员的家目录
/srv: 一些网络服务的数据文件目录
/tmp: 任何人均可使用的“共享”临时目录
/proc: 虚拟文件系统，例如系统内核、进程、外部设备及网络状态等
/usr/local: 用户自行安装的软件
/usr/sbin: Linux系统开机时不会使用到的软件/命令/脚本
/usr/share: 帮助与说明文件，也可放置共享文件
/var: 主要存放经常变化的文件，如日志
/lost+found: 当文件系统发生错误时，将一些丢失的文件片段存放在这里

```
#### 开机关机
```python
reboot  # 重启
poweroff  #关机
shutdown -P now #立刻关机
uptime # 查看主机running time

```

#### man, pwd, clear
```python
man ls # get the help for commands
pwd  # show the current directory
clear # clear screen, or using shortcut 'control+l'

```

#### 磁盘分区: df, fdisk, lsblk
```python
df -h  # 查看磁盘使用情况 
fdisk -l   # 查看磁盘分区 
fdisk /dev/sda
lsblk   # 查看disk分区和使用信息
lsblk -af   # 查看文件系统类型
cat/vim /etc/fstab   #添加新的条目，实现磁盘的永久mount, 不然reboot后挂载就会丢失
pvs    # 查看physical volumes
lvs   #查看logical volumes
partx -u /dev/sda
pvresize /dev/sda
lvextend -r centos/root /dev/sda2  # r stand for resize


```

#### 内存&CPU: free, top, ps，htop
```python
free -h # 查看内存使用情况， -h 代表human readable
top # 查看CPU使用情况, 按’z‘ 彩色显示进程, 'c' display absolute path of running pro
htop is much powerful than top (Install by: yum install -y htop)
top -u root #查看root用户使用的进程
ps -aux # 以BSD语法显示正在运行的进程
ps -ef # 以标准语法显示正在运行的进程
more /proc/cpuinfo # show the cpu info 
more /proc/cpuinfo | grep 'model name'
cat /etc/services  # 查看服务端口号



```

#### Hostnamectl & uname & hostname
```python
hostname # 查看主机名
hostnamectl # 查看主机信息（主机名，OS， Kernel，icon name), 包含（uname, hostname, cat /etc/redhat-release, cat /proc/version ）
hostnamectl set-hostname andycentos # 修改主机名，立即生效无需重启
hostnamectl set-location Shanghai  # set location
hostnamectl set-icon-name Helloworld # set icon name
uname  # show the system type
uname -a  # show all the system info
uname -r  # only show the kernel info

```

#### Alias
```python
alias # 查看主机的alias
alias 'lla=ls -alh' # 添加一个alias
unalias lla  # 删除alias
Note: check the alias is the most important things when you get the Lunix root access.

```
#### ls
```python
ls # 查看文件和目录信息
ls -alh # a: list all files, l: long list format, h: human readable
ls -ld # list directory info
ll # It's the alias of 'ls -lh'

```
#### cd 
```python
cd ~/Downloads # enter Downloads directory 
cd .. # back to parent dir
cd  # back to current user home dir
cd - # back to the last dir
cd /.. /.. # go back two levels dir 
```

#### cp & scp 
```python
cp andy.txt ~/Downloads # copy andy.txt to Downloads folder
cp -r folder /etc/root/ # copy folder, r stands for recursive
cp -a andy.txt . # -a: copy file's properties
cp ~/data . # copy data the current dir
scp ~/localfile andy@172.16.100.23: /usr/data/ # copy local file to remote host
scp andy@172.16.100.23: /usr/data/ . # copy remote host file to local current dir
scp -r andy@172.16.100.23: /usr/data . # copy remote host directory to local current dir

```

#### mkdir & rmdir & rm & mv & touch
```python
mkdir andy # create a folder
mkdir -p andy/andy2/andy3 # create multi-layer folder
rmdir andy # remove a folder
rmdir -p andy # remove the folder and subfolders 
touch andy.txt # create a file
rm andy.txt  # remove a file
rm -f andy.txt  # force remove a file
rm -rf folder  # force remove a dir, equal to rmdir 
mv andy.txt ~/data  # move file 
mv andy.txt andy2.txt #rename the file
touch andy{0..10}.txt  # create multi file by one line command
```

#### history
```python
history # show the commands history, defualt is 1000
history -d 10 # delete the last 10 commands
history -c # clear all the commands history of current user
!2323  # excute the history command by history id 
!keyworkd # excute the history command by key word
cat /etc/profile | grep -i HISTSIZE # 可以修改 history size, 默认只记录1000
cat /home/asong/.bash_history # check other user excuted commands history
sysdig -c root # more power tools for monitor user activity
install guide: https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-for-Linux

```
#### more & cat & head & tail
```python
cat andy.txt # display the file contents one time
cat /etc/services  # show the service port number
more andy.txt # display the file contents page by page
head -n 5 andy.txt # display the head 5 lines
head -v andy.txt # always show the file name
tail -vn 5 andy.txt # display the tail 5 lines

```

#### kill
```python
kill 2323 # kill pid process
kill -15 2323 # 15 is default option, just send the kill order, if the pid is using the call will fail
kill -9 2323 # force kill pid process
ps -aux | grep 18743  # find the pid


```

#### du
```python
du a.txt # show the size of file
du # show the file size of current dir
du -s /root # show the total size 
du -sh /root # -h stands for human readable
ll -h # show the actual file size, du show the minimal storge unit, start from 4K(if file size is 1.4k, will show 4k by du command)
du -sh /etc

```

#### date & timedatectl
```python
date # check date
date "+%Y/%m/%d"  # show the date like 2020/10/20
date "+%H:%M:%S"  # show the time like 14:32:30
date "+%Y-%m-%d %H:%M:%S" # 2020-12-01 02:03:22
date "+%F %T"  # the same as above
timedatectl   # show the date and time zone info
timedatactl list-timezones # list time zones
timedatectl set-timezone Asia/Shanghai # set time zone
timedatectl set-time 2020-11-30  # set the date, format: YY-MM-DD
timedatectl set-time 16:43:32  # set the time, format: HH:MM:SS


```

#### wildcards
```python
ls /dev/sda? # ? represents or matches a single occurrence of any character
ls /dev/sda?? # matches two character
ls /dev/sda*  # * matches any characters
ls /dev/s*a] # matches sda
ls /dev/sda[0-9] # matches sda0 - sda9
ls /dev/sda[12] # matches sda1,sda2
ls /dev/sd[a] # matches sda
ls /dev/sd[a-z] # matches sda -sdz

```

#### output/input redirection
```python
output redirection
 echo "hello world" > andy.txt # redirect the output to file, > stands for overwrite
 echo "hello world" >> andy.txt # append the output to file, >> stands for append
 andy -s 2> andy.txt # redirect the error output to file, 2 stands for output error message
 andy -s 2>> andy.txt # append the error output to file, 2 stands for output error message
 andy -s &> andy.txt # redirect the error & standard output to file, & stands for output error and standard message
 cat /etc/passwd &>> andy.txt # append the error & standard output to file, & stands for output error and standard message
 wc -l < /etc/passwd  # input redirection 
 
 
```

#### pipe & wc
```python
|  # transfer the output to next input 
cat /etc/passwd | wc -l  # prints the number of lines
echo "this is andy" | wc -c # displays count of bytes present in a file
echo "this is andy" | wc -w # displays count of word present in a file

```

#### w & who & whoami & last & lastlog
```python
[root@andycentos ~]# w
 13:04:06 up 2 days,  3:30,  7 users,  load average: 0.61, 0.16, 0.09
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     tty1                      Mon19    3days  1.35s  0.02s -bash
root     pts/0    172.20.10.4      09:47    1:44m  0.16s  0.00s less -s
root     pts/1    172.20.10.4      10:34    1:43m  0.02s  0.02s -bash
root     pts/2    172.20.10.4      12:00   20:38   0.15s  0.15s -bash
root     pts/3    172.20.10.4      12:00   15:02   0.03s  0.03s -bash
root     pts/4    172.20.10.4      13:03    6.00s  0.04s  0.01s w
root     pts/5    172.20.10.4      13:03   11.00s  0.02s  0.02s -bash

USER：显示登陆系统的用户的帐号名。如果用户重复登录，则该帐号名就会重复显示。

TTY：用户登录的终端代号。登录的形式不同，登录代号也不相同。

FROM：显示用户从何处登录系统。如果是本地登录，则此字段为-，若从远程登录，便会显示远程主机的IP地址或主机名。至于“:0.0”之类的标示，代表该用户是从X Window System以文本模式登录的。

LOGIN@：这是Login At的意思，表示该用户登录系统时的时间（不是登录后经过的时间）。

IDLE：表示用户闲置的时间。这是一个计时器，一旦用户执行任何操作，该计时器便会被重置。

JCPU：以终端的代号区分显示，表示该终端所有相关的进程（process）执行时所消耗的cpu时间。每当进程结束就停止计时，开始新的进程则会重新计时。

PCPU：表示cpu执行程序消耗的时间。

WHAT：表示用户正在执行的程序的名称，如果正在执行文本模式命令，则会显示用户环境的名称。
```
```python
who  # show the login user info
whoami  # show current login user name
last root # show root user login history
lastlog  # show the recent login user 

```

#### pidof
```python
pidof crond  # get the crond proccess id
ps -aux |grep 3423 # verify the pid
which crond  # view command file location

```

#### which
```python
which ls # check command file location

```

#### ip 
```python

ip a   # show ip address
ip r   # show ip route table
ip a | grep global   # only show the global line

```

#### wget & curl
```python
wget www.google.com  # download webpage file
wget -P ~/Downloads www.google.com # -P set download dir 
curl www.google.com  # transfer a url 
curl -v www.google.com # -v: make the operation more talkative

```

#### tr 
```python
cat /etc/passwd | tr a-z A-Z  # translate lowcase to upcase
cat /etc/passwd | tr [:lower:] [:upper:] 
-c或——complerment：取代所有不属于第一字符集的字符；
-d或——delete：删除所有属于第一字符集的字符；
-s或--squeeze-repeats：把连续重复的字符以单独一个字符表示；
-t或--truncate-set1：先删除第一字符集较第二字符集多出的字符。
echo "hello 123 world 456" | tr -d '0-9'   # print hello word, -d: delete set1 '0-9'
echo aa.,a 1 b#$bb 2 c*/cc 3 ddd 4 | tr -d -c '0-9 \n' # print 1 2 3 4, set1 include '0-9, space, \n'
echo "thissss is      a text linnnnnnne." | tr -s ' sn' # print this is a text line, set1 include ' space, s, n'

```

#### dd
```python
转换和拷贝文件
if=file 从 file 中读而不是标准输入。
of=file 写到 file 里去而不是标准输出
bs=bytes 一次读和写 bytes 字节
count=blocks 只拷贝输入文件的前 blocks 块
```
```python
[root@andycentos ~]# dd if=/dev/zero of=andy.sh count=10 bs=1M
10+0 records in
10+0 records out
root@andycentos ~]# ll -h andy.sh
-rw-r--r--. 1 root root 10M Dec  1 09:44 andy.sh

```

#### tar & gzip
```python
-c: compress
-x: uncompress
-v: verbose
-f: target file name
-g: gzip
tar cvf andy.sh.tar andy.sh # tar a file
gzip andy.sh.tar.gz andy.sh.tar # zip a file
tar czvf andy.sh.tar.gz  # tar a file and zip
tar -xzvf andy.sh.tar.gz  # unzip and umcompress a file
tar xvf test.tar.gz -C /tmp   # choose the dst dir 

```

#### grep
```python
-E，--extended-regexp 模式是扩展正则表达式（ERE）
-i，--ignore-case	忽略大小写
-n，--line-number	打印行号
-o，--only-matching	只打印匹配的内容
-c，--count	只打印每个文件匹配的行数
-B，--before-context=NUM	打印匹配的前几行
-A，--after-context=NUM	打印匹配的后几行
-C，--context=NUM 打印匹配的前后几行
--color[=WHEN], 匹配的字体颜色
-v，--invert-match 打印不匹配的行
```
```
忽略大小写：
[root@andycentos ~]# echo "this is Andy" | grep -i andy  # ignore case
this is Andy
[root@andycentos ~]# echo "this is Andy" | grep  andy

只打印匹配的内容：
[root@andycentos ~]# echo "this is Andy" | grep -o Andy
Andy

统计匹配的行数：
[root@andycentos ~]# cat /etc/passwd |grep -c root
2
[root@andycentos ~]# cat /etc/passwd |grep  root
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin

打印不匹配的行：-e: 翻译换行符
[root@andycentos ~]# echo -e "hello\nthis is andy\nncie to meet you\nsee you " | grep -v 'andy'
hello
ncie to meet you
see you

```

#### find
```python
find / -name sshd   # find the file name is sshd in / dir
find . -name ss?*   # using wildcards to find
find / -size 1M   # find file size is 1M
find / -type f  # b/d/c/p/l/f	匹配文件类型（后面的字幕字母依次表示块设备、目录、字符设备、管道、链接文件、文本文件）
find /tmp/ -name *.doc -o -name *.exel -o -name *.wps   # 从/tmp下找出后缀是wps 或doc 或exel的文件 -o: 代表 'or' 

```
### quotation mark
```python
单引号（''）：转义其中所有的变量为单纯的字符串。
双引号（""）：保留其中的变量属性，不进行转义处理。
反引号（``）：把其中的命令执行后返回结果。
```
```
[root@andycentos ~]# name=andy
[root@andycentos ~]# echo 'this is $name'  # signal quotation mark
this is $name
[root@andycentos ~]# echo "this is $name"  # double quotation mark 
this is andy
[root@andycentos ~]# unset name     # remove env variable
[root@andycentos ~]# echo "this is $name"
this is
[root@andycentos ~]# users=`cat /etc/passwd | wc -l`  # back quota
[root@andycentos ~]# echo $users
47

```

#### soft link & hard link
```python
softlink:
ln -s source_dir dst_dit
1.就是相当于win中的快捷方式，基本不占用磁盘空间
2.删除链接文件，源文件无影响
3.删除源文件，链接文件失效
4.修改源文件\链接文件，内容都发生改变
[root@andycentos ~]# ln -s andy.txt andysong.txt
[root@andycentos ~]# ll
lrwxrwxrwx. 1 root root       8 Dec  1 18:32 andysong.txt -> andy.txt
```
```
hard link:
1.就相当于一个copy的新文件，会占用源文件2倍的磁盘空间
2.删除链接文件，源文件无影响
3.删除源文件，链接文件无影响
4.修改源文件\链接文件，内容都发生改变
[root@andycentos ~]# ln andy.txt andysong_hard_link.txt
[root@andycentos ~]# ll
-rw-r--r--. 2 root root   18509 Dec  1 18:01 andysong_hard_link.txt

```

#### vim 

-    refer [Vim 的使用](https://github.com/AndySongTech/Linux/blob/main/Vim%20%E7%9A%84%E7%94%A8%E6%B3%95)


#### User & Group
```python
/etc/passwd：用户基本信息
/etc/shadow：用户密码信息、过期时间等
/etc/group：用户组信息
/etc/gshadow：用户组密码
/etc/default/useradd：创建用户的默认配置信息
/etc/skel/：用户家目录模板
/etc/login.defs：全局用户设定信息
/etc/passwd： 每行是一个用户，用来记录用户的基本信息，每行的格式
account:password:UID:GID:GECOS:directory:shell

accout：用户名
password：用户密码，密码位置默认是x
UID：用户身份id，用来唯一的标识一个用户
GID：用户组id，用来在系统中唯一的标识一个用户组（这里指的是其基本组的组ID）
GECOS：用户描述信息，可以空白，也可以随意写(useradd -c )
directory：用户家目录
shell：用户所使用的shell类型
/bin/bash-->可以登录系统
/sbin/nologin-->该用户一定无法登录系统

比如
root   :   x   :    0    :       0       :   newuser  :  /root  :  /bin/bash

用户名    密 码    用户id   用户所在组的id  描述信息    家目录    shell类型   


/etc/group
用户组信息
linux，用户一定是属于一个组的在linux中，创建用户的时候，会自动创建一个组，组名和组id都和所创建的用户相同,而且，该用户会自动加入到这个组中

andysong:x:1000:
组成：groupname:password:GID: [user1, user2.....]
groupname：组名
password：组密码
GID：组id
[user1, user2.....]：改组中的用户列表

用户的基本组(主组)：当前用户具有哪个组的权限
用户的附加组：用户额外属于的组
 主组：gp02
 附加组：gp01、gp03

可以登录系统的用户
 管理员用户：uid为0的用户
 普通用户：就是可以登录系统，但是没有管理员权限的用户
 不能登录系统的用户：
 系统用户：用来运行一个程序，而不是用来登录系统
 
各类用户的id
 管理员用户：0
 系统用户：1-999
 普通用户：1000-60000（自定义uid最大4294967294）

系统用户的特点
 1. 因为不需要登录，所以shell类型通常为/sbin/nologin
 2. 系统用户没有家目录
 3. 系统用户id通常是小于1000
```

#### useradd & userdel & id
```python
/etc/default/useradd   #定义创建用户默认选项的文件
useradd defaults file  # useradd默认文件
GROUP=100      #表示可创建普通组
HOME=/home     #用户的家目录建在/home中；用户家目录的默认创建地
INACTIVE=-1    #是否启用帐号过期停权，-1表示不启用；宽限天数，0及以下数皆为无效数字
EXPIRE=        #帐号终止日期，不设置表示不启用；帐号失效日期(如：20081212)
SHELL=/bin/bash    #所用SHELL的类型；登录后执行的程序
SKEL=/etc/skel  #用户家目录中的环境文件，默认添加用户的目录默认文件存放位置；也就是说，当我们用adduser添加用户时，用户家目录下的文件，都是从这个目录中复制过去的
CREATE_MAIL_SPOOL=yes  #是否创建用户邮件缓冲，yes表示创建

```
```
useradd [options] username
options:
-d, --home HOME_DIR：指定用户家目录
-c, --comment COMMENT：用户说明信息
-e, --expiredate EXPIRE_DATE：指的账号的过期时间，时间格式 YYYY/MM/DD
-g, --gid GROUP：指的用户的基本组的组id
-G, --groups GROUP1[,GROUP2,...[,GROUPN]]]：指的用户的附加组列表
-u，--uid UID：指的用户的uid
-m, --create-home：创建用户的时候自动创建用户家目录（默认就已经使用）
-M：不自动创建用户家目录
-o, --non-unique：通常和-u一起使用，用来让两个用使用相同的uid
-r, --system：创建一个系统用户
-s, --shell SHELL：在创建用户的时候，指定用户的shell类型
（/bin/bash/,/sbin/nlogin)

useradd andysong  # create a user 
useradd -e 2021/01/01 andysong # set a expire date for user 
useradd -g andysong -G group1[,group2,group3] andysong # add user to group 
useradd -M -r -s /sbin/nologin system_test  # create a system account without home dir, and unable to login 
useradd -r -s /sbin/nologin -u 500 -g dog -G cat user1  # create a system account r, and unable to login, set uid and owner group and additional group
userdel andy  # delete user
userdel -r andy  # delete user and delete user's home dir 
id andy   # view user's uid, gip, groups
how recovery user's home dir
 mkdir /home/andy
 cp /etc/skel/.bash* /home/andy  
 su - andy  # switch to another account

```

#### passwd
```python
passwd [[options] username]  # 如果不指定用户名，那么就是修改当前用户的密码
options:

--stdin: standard input, 用于在shell脚本中批量设置用户密码
-l：锁定用户
-u：解锁用户
-d：删除用户密码
-e：让用户密码过期

passwd andy  # set the password for user
passwd -d andy # remove user's password
passwd -l andy  # lock user's account
passwd -u andy  # unlock user's account
passwd -e 2021/01/01 andy  # set the expired date for account
echo "123password" | passwd --stdin andy  # 表示给andy用户设置密码123password(andy用户必须存在)，用于在shell脚本中批量设置用户密码
vim /etc/shadow   # edit user password by vim 
```

#### groupadd & groupdel
```python
groupadd group1  # create a group
groupdel group1  # delete a group


```

#### shadow file
```python
asong:$6$3kNw.d5K9YuiFlWT$ZfcO4jHLSfP3wNI2SOJDSeztyl5RTaLpuopEPZTJzupYAjcIUWsHJv4L2Q6kwmJefl3DyRlSXyNCGpjKqpwpi/::0:99999:7:::
第一段：用户名：  
第二段：加密后的密码      
第三段：上次修改密码举例元年经过的天数1970年1月1日（如果该字段空，意味着该用户密码被禁用）
第四段：密码最短使用时间（0表示不限制）
第五段：密码最长有效期（99999表示不限制）（如果第5的值小于第四段，那么用户无法修改自己的密码）
第六段：密码到期前几天开始发送告警，提示密码即将过去，请立即修改
第七段：非活动期间，密码到期后的宽限时间（登录系统的时候必须先修改密码，才能登录）
第八段：密码过期时间（也是举例计算机元年经过的天数）（这里和前面的几个时间没有联系）
第九段：保留字段

有的时候会发生这样的情况，就是说，你的 root 密码忘记了！要怎么办？重新安装吗？另外， 有的时候是被入侵了， root 的密码被更动过，该如何是好？
　　这个时候就必须要使用到 /etc/shadow 这个资料了！我们刚刚知道密码是存在这个档案中的， 所以只要你能够以各种可行的方法开机进入 Linux ，例如单人维护模式，或者是以 live CD (KNOPPIX) 来进入 Linux 系统。之后，将硬碟顺利挂载，然后进入 /etc/shadow 这个档案中，将 root 的密码这一栏全部清空！然后再登入 Linux 一次，这个时候 root 将不需要密码 (有的时候需要输入空白字元) 就可以登入了！这个时候请赶快以 passwd 设定 root 密码即可。 

```

#### usermod
```python
usermod [options] username
-g, --gid GROUP: 更 新 使 用 者 新 的 起 始 登 入 群 组 。 群 组 名 须 已 存 在 。
-G, --groups GROUP1[,GROUP2,...[,GROUPN]]]: 定  义  使 用 者 为 一 堆 groups 的 成 员 。 每 个 群 组 使 用 ,区 格 开 来
-u, --uid UID: 用 者 ID 值 。必 须 为 唯 一 的 ID 值 
-s, --shell SHELL: 指 定 新 登 入 shell 。 如 此 栏 留 白 ， 系 统 将 选 用 系 统 预 设 shell 。
-L, --lock: 锁定用户的密码
-U ： 解锁用户的密码
-l, --login NEW_LOGIN ： 变 更 使 用 者 login 时 的 名 称 为 login_name 。
-e, --expiredate EXPIRE_DATE：加 上 使 用 者 帐 号 停 止 日 期 。 日 期 格 式 为 MM/DD/YY.
-d, --home HOME_DIR：更 新 使 用 者 新 的 登 入 目 录 。
-m, --move-home：移动用户家目录至新的位置

usermod -s /sbin/nologin andy   # modify user permission to login to system
usermod -L andy   # lock user's account
usermod -U andy   # unlock user's account 
usermod -l new_name  andy # change andy user's name to new_name
usermod -e 2021/01/01 andy   # set account expire date for account



```

#### su 
```python
作用：进行切换用户
格式：su - 目标用户
su命令和'su -'命令最大的本质区别就是：
 前者只是切换了root身份，但Shell环境仍然是普通用户的Shell；而后者连用户和Shell环境一起切换成root身份了。只有切换了Shell
 环境才不会出现PATH环境变量错误。su切换成root用户以后，pwd一下，发现工作目录仍然是普通用户的工作目录；而用su -命令切换以后，
 工作目录变成root的工作目录了。用echo $PATH命令看一下su和su -以后的环境变量有何不同。以此类推，要从当前用户切换到其它用户也
 一样，应该使用su -命令
 
su andy    # only switch the role
su - andy  # switch to andy account, and change to andy home dir & shell as well

```

#### Permission Management
```python
[root@andycentos ~]# ll
total 9456
-rw-r--r--. 1 root root     290 May 12  2020 a.txt
-rw-------. 1 root root    1728 Mar 15  2020 anaconda-ks.cfg
-rw-r--r--. 1 root root       0 Dec  1 17:33 andy.sh
Linux中存在用户（owner）、用户组（group）和其他人（others）概念，各自有不同的权限，对于一个文档来说，其权限具体分配如下：
十位字符表示含义：
　　第1位：表示文档类型，取值常见的有“d表示文件夹”、“-表示文件”、“l表示软连接”、“s表示套接字”、“c表示字符设备”、“b表示块状设备”等等；
　　第2-4位：表示文档所有者的权限情况，第2位表示读权限的情况，取值有r、-, r表示没有相应的权限；第3位表示写权限的情况，w表示可写，-表示不可写，第4位表示执行权限的情况，取值有x、-。
　　第5-7位：表示与所有者同在一个组的用户的权限情况，第5位表示读权限的情况，取值有r、-；第6位表示写权限的情况，w表示可写，-表示不可写，第7位表示执行权限的情况，取值有x、-。
　　第8-10位：表示除了上面的前2部分的用户之外的其他用户的权限情况，第8位表示读权限的情况，取值有r、-；第9位表示写权限的情况，w表示可写，-表示不可写，第10位表示执行权限的情况，取值有x、-。权限分配中,均是rwx的三个参数组合，且位置顺序不会变化。没有对应权限就用 – 代替。

```

#### chmod 
```python
通过字母授权:
u：表示所有者身份owner（user）
g：表示给所有者同组用户设置（group）
o：表示others，给其他用户设置权限
a：表示all，给所有人（包含ugo部分）设置权限
如果在设置权限的时候不指定给谁设置，则默认给所有用户设置

chmod u+x g+w o-r andy.txt  # add user execute permission, add group write permission, remove other read permission
chomd -R u+wx /etc/init.d   # -R stands for apply to dir and sub files. 

通过数字授权:
read = 4
wirte = 2
execute = 1
no permission = 0 

chomod 400 andy.txt  # grant user read permission and group & other hasn't permission
chomod 777 andy.txt  # grant all permissions to every user

Note: 单独出现2、3的权限数字一般都是有问题的权限

```

#### chown
```python
chown andy andy.txt  # change the file's owner to andy
chown andy:andygroup andy.txt # change the file's owner to andy and group to andygroup
chown andy: andy.txt # 
chown -R andy /etc/init.d # change dir owner to andy
chgrp andy andy.txt  # change file's group to andy

```

#### suid & sgid & file ACL
```python
1、SUID（set uid设置用户ID）：限定：只能设置在二进制可执行程序上面。对目录设置无效
   功能：程序运行时的权限从执行者变更成程序所有者的权限
2、SGID：限定：既可以给二进制可执行程序设置，也可以对目录设置
   功能：在设置了SGID权限的目录下建立文件时，新创建的文件的所属组会，继承上级目录的所属组
SUID属性一般用在可执行文件上，当用户执行该文件时，会临时拥有该执行文件的所有者权限。使用”ls -l” 或者”ll” 命令浏览文件时，如果可执行文件所有者权限的第三位是一个小写的”s”，就表明该执行文件拥有SUID属性。
SUID: 默认普通用户是没有权限查看 /etc/shadow 目录的。但给命令cat加上s的权限后就可以了。
[root@andycentos ~]# useradd andy1   # creat a user 
[root@andycentos ~]# su - andy1      # switch to user 
[andy1@andycentos ~]$ cat /etc/shadow   # permission denied now
cat: /etc/shadow: Permission denied
[andy1@andycentos ~]$ exit          # switch back to root 
logout
[root@andycentos ~]# chmod u+s `which cat`   # add s permission to user, 'which cat' is for get the cat file location and `` is back quota(反引号) not sign quotation（单引号）
[root@andycentos ~]$ ll `which cat`  # you can find the 's' in the below
-rwsr-xr-x. 1 root root 54160 Oct 31  2018 /bin/cat
[root@andycentos ~]# su - andy1
Last login: Wed Dec  2 03:45:31 CST 2020 on pts/1
[andy1@andycentos ~]$ cat /etc/shadow    # now have the permission 
root:$6$EI8WFXXLkIXl/jV1$NDK9Uy51/tnRq4Em0.xfZLj0lrLOyM1qcJ1r682ojfc.9FYFUCWVsNc82mphkKnu/3wmidB6hViiEhehdaoIs1::0:99999:7:::
bin:*:17834:0:99999:7:::

SGID: 新创建的文件的所属组会，继承上级目录的所属组
[root@andycentos ~]# mkdir test
[root@andycentos ~]# ll -d test/
drwxr-xr-x. 2 root root 6 Dec  2 04:11 test/
[root@andycentos ~]# chmod g+s test
[root@andycentos ~]# chown :andy1 test
[root@andycentos ~]# touch test/test.txt
[root@andycentos ~]# ll test/test.txt
-rw-r--r--. 1 root andy1 0 Dec  2 04:14 test/test.txt

SBIT: 对于设置sbit权限的文件，用户只能删除自己创建的文件，无法删除其他用户的文件, 对目录/tmp添加sbit权限，删除文件的时候显示拒绝操作

chmod o+b /tmp  # add sbit to /tmp dir

ALC: 对特定用户和特定文件进行权限控制

setfacl -m u:andy1:r-- andy.txt # allow user andy1 has read permission
setfacl -m u:andy1:rw- andy.txt
setfacl -m u:andy1:--- andy.txt
getfacl andy.txt   # view the permission
setfacl -R -m u:andy1:rwx /etc/  # set acl for a dir 
setfacl -x u:andy1 andy.txt  # remove signal user's permission
setfacl -b andy.txt   # remove all the acl from file 


```


#### sudo
```python
问题：reboot、shutdown、init、halt、user管理，在普通用户身份上都是操作不了，但是有些特殊的情况下又需要有执行权限。又不可能让root用户把自己的密码告诉普通用户，这个问题该怎么解决？
可以使用sudo（switch user do）命令来进行权限设置。sudo可以让管理员（root）事先定义某些特殊命令谁可以执行。默认sudo中是没有除root之外用户的规则，要想使用则先配置sudo。
sudo配置文件：/etc/sudoers 该文件默认只读，不允许修改，因此不能直接修改。可以通过“visudo”，打开之后其使用方法和vim一致。
[root@andycentos ~]# visudo    # 打开sudoers, 100gg 跳转到100行（需要改的内容大概在文本的100行左右）
root    ALL=(ALL)       ALL
andysong        ALL=(ALL)       /usr/bin/cat,/usr/sbin/useradd       # 赋予andysong普通用户可以使用sudo cat 和 sudo useradd 两个命令
test1   ALL=(ALL)    /usr/bin/cat

root: 表示用户名，如果是用户组，则可以写成“%组名”
ALL：表示允许登录的主机（地址白名单), 这里表示任何主机（from any ip）
(ALL)：表示以谁的身份执行，ALL表示root身份
ALL：表示当前用户可以执行的命令，多个命令可以使用“,”分割

[root@andycentos ~]# which cat   # find cat command file location
/usr/bin/cat

[root@andycentos ~]# su - andysong   # switch to andysong to run 'sudo cat '
Last login: Wed Dec  2 21:04:09 CST 2020 on :0
[andysong@andycentos ~]$ sudo cat /etc/shadow    # view user password file， general user don't have permission to check this file

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for andysong:             # login password for andysong not root. 

```

#### mount
```python

mount /dev/sdb1 /usr/data # mount /dev/sdb1 on /urs/data
unmout /urs/data  # unmout /usr/data
echo "/dev/sdb1 /part ext4 defaults 0 0" >> /etc/fstab  # mount sdb1 when the machine start

```

#### Disk Management
```python
fdisk -l  # list the partition tabel
ls /dev/sd*. # list the disk drive
fdisk /dev/sdb # 进入fdisk分区管理界面
                                  
m： 查看全部可用的参数                                                                                                                     
n： 添加新的分区
d： 删除某个分区信息
l： 列出所有可用的分区类型
t:  改变某个分区的类型
p:  查看分区表信息
w:  保存并退出
q:  不保存直接退出

[root@andycentos ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0x52997d99.

Command (m for help): n                   #创建一个新的分区
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p):                       #默认主分区，直接回车
Using default response p
Partition number (1-4, default 1):         #默认为第一个分区编号，直接回车
First sector (2048-41943039, default 2048):   #默认第一个扇区开始位置，直接回车
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-41943039, default 41943039): +100M   #选择大小，前面要使用加号
Partition 1 of type Linux and of size 100 MiB is set

Command (m for help): P                   #查看已经分好的磁盘

Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x52997d99

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1            2048      206847      102400   83  Linux

Command (m for help): w                        #w退出保存，q退出不保存
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.

mkfs.ext4 /dev/sdb1   # 新的磁盘分区使用之前必须先格式化
mkdir /data    # 创建挂载目录
mount /dev/sdb1 /data  # 挂载磁盘分区
df -h  # 查看挂载是否成功
echo "/dev/sdb1 /data ext4 defaults 0 0" >> /etc/fstab  # 写入到配置文件中，开机自动挂载(2个0分别表示：不备份，不检测)

添加swap分区：
fdisk /dev/sdb2 # create new swap partition
mkswap /dev/sdb2  # 把建好的分区格式为swap
swapon /dev/sdb2 # 把SWAP分区设备正式挂载到系统中
free -h  # 查看是否挂载成功
echo "/dev/sdb2 swap swap defaults 0 0" >> /etc/fstab  # 写入到配置文件中，开机自动挂载(2个0分别表示：不备份，不检测)
swapoff -a # 关闭swap挂载

```



#### LVM：logical volume management
```python
物理存储介质（The physical media）: LVM存储介质可以是磁盘分区，整个磁盘，RAID阵列或SAN磁盘，设备必须初始化为LVM物理卷，才能与LVM结合使用
物理卷PV（physical volume）  : 物理卷就是LVM的基本存储逻辑块，但和基本的物理存储介质（如分区、磁盘等）比较，却包含有与LVM相关的管理参数,创建物理卷它可以用硬盘分区，也可以用硬盘本身；
卷组VG（Volume Group）  : 一个LVM卷组由一个或多个物理卷组成 
逻辑卷LV（logical volume）  : LV建立在VG之上，可以在LV之上建立文件系统
PE（physical extents）  : PV物理卷中可以分配的最小存储单元，PE的大小是可以指定的，默认为4MB
LE（logical extent）  : LV逻辑卷中可以分配的最小存储单元，在同一个卷组中，LE的大小和PE是相同的，并且一一对应
                     
                  物理卷管理           卷组管理                逻辑卷管理                                
  扫描              pvscan            vgscan           	     lvscan                     
  建立             pvcreate	          vgcreate	              lvcreate
  显示             pvdisplay	         vgdisplay	             lvdisplay
  删除             pvremove	          vgremove	              lvremove
  扩展                                vgextend	              lvextend
  缩小                                vgreduce	              lvreduce

部署逻辑卷：
pvcreate /dev/sdc /dev/sdd  # 让两块硬盘支持LVM技术
gvcreate andy /dev/sdc /dev/sdd  # 创建券组andy
lvcreate -n andy_lv -L 500M andy  # 创建逻辑券andy_lv, 并从券组andy中划分500M空间
mkfs.ext4 /dev/andy/andy_lv  # 格式化LV, 文件系统类型为ext4
or mkfs.xfs /dev/andy/andy_lv   # 格式化LV, 文件系统类型为xfs
mount /dev/andy/andy_lv /data # 挂载
df -h  # 查看挂载信息

扩展ext4逻辑券:
umount /data  # 需要先卸载逻辑券
lvextend -L 5G /dev/andy/andy_lv  # 扩展到5G空间
e2fsck -f /dev/andy/andy_lv  # 检测磁盘的完整性
resizefs /dev/andy/andy_lv  # 重置磁盘空间
mount /dev/andy/andy_lv /date 
df -h


扩展xfs逻辑券： 
1. xfs格式只能扩容，不能减小！
2. xfs格式无需卸载，支持在线扩容
lvcreate -n andy_xfs_lv -L 500M andy  # 创建一个逻辑券
mkfs.xfs andy_xfs_lv   # 格式化LV, 文件系统类型为xfs
mount /dev/andy/andy_xfs_lv /data  #挂载
df -h     #查看挂载信息
lvextend -L 5G /dev/andy/andy_xfs_lv # 扩展到5G空间

缩小逻辑券： 
相较于扩容逻辑卷，在对逻辑卷进行缩容操作时，其丢失数据的风险更大。所以在生产环境中执行相应操作时，一定要提前备份好数据。另外Linux系统规定，在对LVM
逻辑卷进行缩容操作之前，要先检查文件系统的完整性（当然这也是为了保证我们的数据安全）。在执行缩容操作前记得先把文件系统卸载掉。
umount /data  # 先卸载挂载
e2fsck -f /dev/andy/andy_lv  #检测磁盘的完整性
resizefs /dev/andy/andy_lv 200M  # 缩小到200M
mount /dev/andy/andy_lv /data  # 重新挂载
df -h   # 查看挂载信息

删除逻辑券：
umount /data   #先卸载挂载
lvremove /dev/andy/andy_lv  # 删除逻辑券
gvremove andy   #删除券组
pvremove /dev/sdc /dev/sdd  #删除物理券

```
#### lsof
```python
lsof命令用于查看你进程打开的文件，打开文件的进程，进程打开的端口(TCP、UDP)
-i<条件>：列出符合条件的进程。（4、6、协议、:端口、 @ip ）
[root@andycentos ~]# lsof -i :22
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
sshd    7365 root    3u  IPv4  42553      0t0  TCP *:ssh (LISTEN)
sshd    7365 root    4u  IPv6  42574      0t0  TCP *:ssh (LISTEN)
sshd    9297 root    3u  IPv4  83146      0t0  TCP andycentos:ssh->gateway:65139 (ESTABLISHED)
sshd    9539 root    3u  IPv4  94689      0t0  TCP andycentos:ssh->gateway:51821 (ESTABLISHED)


```

#### rpm 
```python
这是一个数据库管理工具，可以通过读取数据库，判断软件是否已经安装，如果已经安装可以读取出来所有文件的所在位置等，并可以实现删除这些文件。
rpm：RPM is Redhat Package Manager（递归缩写）
rpm可以完成的操作
  安装软件
  卸载软件
  查询软件信息
  升级、降级
  检验
  打包程序
rpm仅仅能管理符合rpm格式的程序包，不能管理源码格式的程序
程序的格式
1)源码格式的程序：都是以压缩方式呈现的(后缀都是.tar.gz|bz2)
2)rpm格式的程序：这都是编译以后的程序 (后缀都是.rpm)

安装软件方式有如下几种
方式1：编译安装
将源码程序按照需求进行先编译，后安装
缺点：安装过程复杂，而且很慢
优点：安装过程可控，真正的按需求进行安装（安装位置、安装的模块都可以选择）

方式2：rpm安装（用rpm来安装rpm后缀的安装包）
优点：安装和卸载过程非常方便
缺点：安装过程不可控（安装位置，安装那些功能模块）
rpm包的依赖关系非常复杂

方式3：yum安装
yum安装，其实就是自动分析rpm包的依赖关系，然后按照需要的顺序依次安装

方式4：绿色安装, 放到系统可以直接运行

安装rpm包： 
格式：rpm -ivh  软件包名
选项
-i：安装软件
-v：显示安装过程
-h：用#表示安装进度（# 2%)
-vv：显示更详细的安装过程信息
-vvv：显示更更详细的安装过程信息

rpm -ivh htop.rpm  # install htop package

卸载rpm包：
rpm -e htop   # uninstall htop, here just need type app name not rpm file name 

rpm包查询：
-q：查看一个已经安装的软件
-a：查看所有已经安装的软件all
-l：显示软件安装完成以后生成文件列表（所有文件）list
-i：查看软件包的相关信息 info
-d：显示该软件所生成的说明性质的文档列表docfiles
-c：查看软件所生成的配置文件列表configfiles
-f: 查看文件是什么软件生成的
--scripts:查看软件相关的脚本
rpm -q httpd  # check if the httpd is installed 
rpm -qa  # list all the installed packages 
rpm -ql httpd # show the package file list 
rpm -qi httpd # show package info 
rpm -q --scripts httpd  # view the package configfiles
rpm -qa | wc -l # show how many appp is installed (similar with: yum list installed | wc -l)
rpm -qf /usr/bin/ls  # check who generate the /usr/bin/ls file
rpm -qf /usr/bin/egrep & rpm -qf /usr/bin/grep  # grep and egrep are come from the same file
rpm -qf `which httpd` # the same function like above
  [root@andycentos ~]# rpm -qf `which httpd`
  httpd-2.4.6-97.el7.centos.x86_64


升级和安装rpm包： 
-U：升级或安装软件
-F：仅仅是升级操作
rpm -Fvh ipset-6.38-2.el7.x86_64.rpm 
rpm -Uvh ipset-6.38-2.el7.x86_64.rpm # 升级

```

#### yum 
```python
yum的工作原理：
1. 需要首先创建一个yum仓库（rpm包仓库、软件仓库）
  a. 仓库其实就是一个目录
  b. 仓库中存放的是rpm包
  c. 仓库中还保存了一个文件，文件中记录了该仓库中所有rpm包的元数据信息
  d. 元数据信息包括:软件名,软件版本,软件是否已经安装,软件的依赖关系
2. 用yum来从仓库中找软件并进行安装，所有的依赖关系都会被自动安装

yum的repo:
本地：将本地的一个目录做成yum仓库，只有当前系统可以使用
网络：通过网络将服务器上的一个目录作为yum仓库，网络中的全部主机都可以用
使用yum仓库的方式，就是修改yum的配置文件

yum的配置文件：
 主：/etc/yum.conf
 子：/etc/yum.repos.d/*.repo
 /etc/yum.conf文件
 cachedir=/var/cache/yum/$basearch/$releasever
 指定缓存文件的保存位置,默认：/var/cache/yum/x86_64/7/
 keepcache=0
 指定是否保留缓存文件
 
[root@andycentos ~]# cat /etc/yum.conf
[main]
cachedir=/var/cache/yum/$basearch/$releasever
keepcache=0
debuglevel=2
logfile=/var/log/yum.log
exactarch=1
obsoletes=1
gpgcheck=1
plugins=1
installonly_limit=5
bugtracker_url=http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum
distroverpkg=centos-release


#  This is the default, if you make this bigger yum won't see if the metadata
# is newer on the remote and so you'll "gain" the bandwidth of not having to
# download the new metadata and "pay" for it by yum not having correct
# information.
# It is esp. important, to have correct metadata, for distributions like
# Fedora which don't keep old packages around. If you don't like this checking
# interupting your command line usage, it's much better to have something
# manually check the metadata once an hour (yum-updatesd will do this).
# metadata_expire=90m

# PUT YOUR REPOS HERE OR IN separate files named file.repo
# in /etc/yum.repos.d
'用yum安装软件过程中会从yum仓库下载并缓存多个资源
1）会将yum仓库的元数据文件缓存到配置文件所指定的路径中
2）会将要安装的软件及其依赖的软件一并缓存到配置文件指定的目录中
配置文件的构成：创建在 /etc/yum.repos.d/ 目录下，文件格式必须是.repo 
[repo_id]      <<< 指定yum仓库的id，可以随便写，但是中间不能有空格
name=xxx        <<< 指定yum仓库的名称，可以随便写
enabled=0|1     <<< 指定是否使用该yum仓库，0表示不使用；1表示使用
gpgcheck=0|1    <<< 指定是否对rpm包做完整性和来源合法性验证，0表示不做验证；1表示必须做验证
gpgkey=         <<< 指定公钥文件（如果gpgcheck=1，那么该项不能省略）
baseurl=        <<< 指定yum仓库的url
 注意：在指定yum仓库的时候，其实不是指向rpm包的目录，而是执行repodata所在目录
 本地yum仓库: file:///repo
 网络yum仓库:
    官方：http://mirror.centos.org/centos/$releasever/os/$basearch/
    阿里云：https://mirrors.aliyun.com/epel/7Server/x86_64/
andy.repo 配置文件实例： 
在配置自定义的repo前，请一定记得备份原本的repo文件
  mkdir -p /etc/yum.repos.d/backup 
  mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bakcup
vim andy.repo   # 编辑repo文件
[local_repo]   # 本地repo
name = andy_local_repo
enable = 1
baseurl = file:///repo
gpgcheck = 0
cost = 1  # 1的优先级最高，默认是1000. 所以yum会优先查询本地repo,找不到安装文件，回去查找下个repo

[remote_repo]   #远程repo
name = aliyun
enable = 1
baseurl =https://mirrors.aliyun.com/epel/7Server/x86_64/
gpgcheck = 0
cost = 9

执行yum命令检测结果：
yum clean all    # 清空yum缓存的全部数据
yum repolist     # 检查yum仓库中有多少个可用的rpm包'


yum install -y htop httpd # install htop and httpd
yum remove htop -y # remove htop
yum reinstall -y htop # reinstall htop
yum update htop   # update htop on system
yum upgrade htop  # upgrade htop into the account 
yum list   # list all packages
yum list installed # list all installed packages 
yum list installed | wc -l  # statistic the installed package number
yum list available 
yum search http*  # search a package name
yum grouplist   # 查看系统中的全部的包组
yum groupinfo group_name  # 查看指定包组的信息（包组的作用、包含的软件）
yum groupinstall group_name  # 安装指定的包组
yum groupremove group_name   # 卸载指定的包组
yum groupinstall "X Window System"  -y    # 安装图形化界面
yum groupinstall "GNOME Desktop" "Graphical Administration Tools" -y # 同上

```

#### samba
```python
Smb主要作为网络通信协议, 是基于cs架构, 完成Linux与windows之间的数据共享；linux与linux之间共享用NFS
yum install -y samba   # install samba
systemctl status smb   # check the samba status
vim /etc/samba/smb.conf   # edit the samba config file
add below config to the file
  '[andy]
        comment = Andy Directories
        path = /andy_shared
        read only = No
        public = Yes '
mkdir /andy_shared   # create the shared dir
chmod -R a+rw /andy_shared/   # grant user read and write permission for folder
useradd andy_smb  # ceate the user for access shared folder  
[root@andycentos ~]# pdbedit -a -u andy_smb   # user must be existed
   # manage the SAM(samba access management) database (Database of Samba Users)， -a: add user to database, -u: user name  
new password:              # create new password for user
retype new password:
Unix username:        andy_smb
NT username:
Account Flags:        [U          ]
User SID:             S-1-5-21-836804173-3705210611-1749464523-1000
Primary Group SID:    S-1-5-21-836804173-3705210611-1749464523-513
Full Name:
Home Directory:       \\andycentos\andy_smb
HomeDir Drive:
Logon Script:
Profile Path:         \\andycentos\andy_smb\profile
Domain:               ANDYCENTOS
Account desc:
Workstations:
Munged dial:
Logon time:           0
Logoff time:          Wed, 06 Feb 2036 23:06:39 CST
Kickoff time:         Wed, 06 Feb 2036 23:06:39 CST
Password last set:    Thu, 03 Dec 2020 10:43:36 CST
Password can change:  Thu, 03 Dec 2020 10:43:36 CST
Password must change: never
Last bad password   : 0
Bad password count  : 0
Logon hours         : FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFthx
[root@andycentos ~]# setenforce 0     # modify the mode SELinux is running in, 0 is in permissive mode, 1 is in enforcing mode
[root@andycentos ~]# systemctl stop firewalld   # turn of the firewall
[root@andycentos ~]# systemctl restart smb      # restart the smb service 
access by Windows: \\172.168.x.x.
access by MacOS： smb://172.168.x.x

```

#### vsftp
```python
FTP服务器（File Transfer Protocol Server）是在互联网上提供文件存储和访问服务的计算机，它们依照FTP协议提供服务。
FTP（File Transfer Protocol: 文件传输协议）作用： Internet 上用来传送文件的协议
VSFTP是一个基于GPL发布的类Unix系统上使用的FTP服务器软件，它的全称是Very Secure FTP 从此名称可以看出来，编制者的初衷是代码的安全。
特点：它是一个安全、高速、稳定的FTP服务器
模式： C/S 模式
端口：20(传数据)， 21（传指令）

ftp主动和被动模式，都是相对于的FTP server 端来判断的，如果server 去连接client 开放的端口，说明是主动的，相反，如果client去连接server开放的端口，则是被动的。
两种模式的比较：
（1）PORT（主动）模式模式只要开启服务器的21和20端口，而PASV（被动）模式需要开启服务器大于1024所有tcp端口和21端口。
（2）从网络安全的角度来看的话似乎ftp PORT模式更安全，而ftp PASV更不安全，那么为什么RFC要在ftp PORT基础再制定一个ftp PASV模式呢？其实RFC制定ftp PASV模式的主要目的是为了数据传输安全角度出发的，因为ftp port使用固定20端口进行传输数据，那么作为黑客很容使用sniffer等探嗅器抓取ftp数据，这样一来通过ftp PORT模式传输数据很容易被黑客窃取，因此使用PASV方式来架设ftp server是最安全绝佳方案。(默认是被动工作模式)

配置匿名模式：
yum install -y vsftp  # install vsftp 
more /etc/vsftpd/vsftpd.conf   # view vsftp config file
egrep -v "^$|^#" /etc/vsftpd/vsftpd.conf  # 不显示以$和#开始的行
[root@andycentos ~]# egrep -v "^$|^#" /etc/vsftpd/vsftpd.conf
anonymous_enable=YES
local_enable=YES
write_enable=YES
local_umask=022
anon_umask=022
anon_upload_enable=YES
anon_other_write_enable=YES
anon_mkdir_write_enable=YES
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_std_format=YES
listen=NO
listen_ipv6=YES
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES

参数                                      作用                                                                                       
anonymous_enable=YES                允许匿名访问模式
anon_umask=022                      匿名用户上传文件的umask值
anon_upload_enable=YES              允许匿名用户上传文件
anon_mkdir_write_enable=YES         允许匿名用户创建目录
anon_other_write_enable=YES         允许匿名用户修改目录名称或删除目录

[root@andycentos ~]# vim /etc/vsftpd/vsftpd.conf  # Change the config file refer above listed
systemctl restart vsftpd  # restart vsftp
[root@andycentos ~]# find /var -name pub  # find the default ftp share folder pub
/var/ftp/pub
chown -R ftp: /var/ftp/pub  # change owner and group
access by: ftp://ip or FileZilla Client

配置本地用户模式：

参数                                     作用                                                                                                      
anonymous_enable=NO                 禁止匿名访问模式
local_enable=YES                    允许本地用户模式
write_enable=YES                    设置可写权限
local_umask=022                     本地用户模式创建文件的umask值
userlist_deny=YES                   启用“禁止用户名单”，名单文件为ftpusers和user_list
userlist_enable=YES                 开启用户作用名单文件功能

yum install -y vsftp 
[root@andycentos ~]# egrep -v "^$|^#" /etc/vsftpd/vsftpd.conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
anon_umask=022
anon_upload_enable=YES
anon_other_write_enable=YES
anon_mkdir_write_enable=YES
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_std_format=YES
listen=NO
listen_ipv6=YES
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES

vim /etc/vsftpd/vsftpd.conf
systemctl restart vsftpd
useradd andyftp
passwd andyftp or echo "123password" | passwd --stdin andyftp # set a password for user
as default the file will be upload to user's home dir
access by: ftp://ip or FileZilla Client
du -sh /home/andyftp/   # check dir size 

```

#### deploy a web-based file index by Apache
```python
yum intstall -y httpd   # install httpd
cp -r /files /var/www/html/  # copy file to apache dir
vim /etc/httpd/conf.d/welcome.conf   # annotation welcome page
 :8, 22 s/^/#/g   # annotate all the contents
systemctl restart httpd
web page is like: https://mirrors.aliyun.com/epel/7Server/x86_64/

```

#### systemctl 
```python
systemctl status sshd   # view the stauts of service 
systemctl start httpd  # start the httpd service
systemctl stop smb  # stop the smb service
systemctl restart vsftpd  # restart vsftpd service, it will interrupt the service
systemctl reload firewalld  # soft restart service, it will not interrupt the service, but not all the service support this command
systemctl enable vsftpd    # launch service at login
systemctl disable smb      # Do not launch service at login

```

#### sshd 
```python
SSHD服务
介绍：SSH 协议：安全外壳协议。为 Secure Shell 的缩写。SSH 为建立在应用层和传输层基础上的安全协议。
默认端口: 22
作用: 
sshd服务使用SSH协议可以用来进行远程控制， 或在计算机之间传送文件 
相比较之前用telnet方式来传输文件要安全很多，因为telnet使用明文传输，是加密传输。
SSH 配置文件:
SSH 常用配置文件有两个/etc/ssh/ssh_config 和/etc/ssh/sshd_config。
ssh_config 为客户端配置文件
sshd_config 为服务器端配置文件
配置免密登录： 
yum -y install openssh openssh-clients openssh-server openssh-askpass
ssh-keygen  # generate the key
ssh-copy-id 172.16.22.1  # send the pub key to remote host
ssh 172.16.22.1  # ssh remote host without user name and password

```

#### nfs
```python
NFS，是Network File System的简写，即网络文件系统, 用于Linux系统文件共享。网络文件系统是FreeBSD支持的文件系统中的一种，也被称为NFS； NFS允许一个系统在网络上与他人共享目录和文件。
模式： C/S 模式
端口： NFS是Net File System的简写,即网络文件系统.NFS通常运行于2049端口。
部署NFS: 由于在使用NFS服务进行文件共享之前，需要使用RPC（Remote Procedure Call，远程过程调用）服务将NFS服务器的IP地址和端口号等信息发送给客户端。因此，在启动NFS服务之前，还需要顺带重启
并启用rpcbind服务程序。
服务器端搭建nfs: 
yum install -y rpcbind nfs-utils  # install rpn and nfs
mkdir /data  # create share dir 
vim /etc/exports   # edit the config file
  /andy_shared 172.20.10.7(rw) #给特定的ip共享,rw表示权限
  /data *(r) #给所有ip 共享    
  /data 172.20.10.0/28(rw)  #把网段共享出去 28表示掩码  
  /data 172.20.10.0/28(rw)  192.168.64.0/24(rw)  #设置多个网络
  注意: * 表示对所有网段开放权限
[root@andycentos ~]# yum list installed | grep nfs   # check if the app is installed 
Failed to set locale, defaulting to C
libnfsidmap.x86_64                      0.25-19.el7                    @anaconda
nfs-utils.x86_64                        1:1.3.0-0.68.el7               @base
nfs4-acl-tools.x86_64                   0.3.3-19.el7                   @anaconda
[root@andycentos ~]# yum list installed | grep rpcbind
Failed to set locale, defaulting to C
rpcbind.x86_64                          0.2.0-49.el7                   @base
[root@andycentos ~]# cat /etc/group |grep nfs  # find the nfs group
nfsnobody:x:65534:
[root@andycentos ~]# cat /etc/passwd |grep nfs  # find the nfs owner name
rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
nfsnobody:x:65534:65534:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
[root@andycentos ~]# chown -R nsfnobody: /data     # change owner and group to nfsnobody
[root@andycentos ~]# systemctl restart rpcbind     # restart rpc service 
[root@andycentos ~]# systemctl restart nfs         # restart nfs service
查询命令：
[root@andycentos ~]# rpm -qf `which showmount`     # check where is 'showmount' come from
nfs-utils-1.3.0-0.68.el7.x86_64
mkdir /test
[root@andycentos ~]# showmount -d    # List only the directories mounted by some client.
Directories on andycentos:
/data

客户端使用：
yum install -y nfs-utils   # install nfs, if you using Mac computer, it will be already installed
showmount -e 172.16.101.32  # show the NFS server's export list, only show the shared dir that client has permission 
   Exports list on 172.16.101.32:
   /data                               172.16.101.0/24

mkdir /test   # create local mount dir
mount -t nfs 172.16.101.32:/data /test   # mount the nfs dir to local dir, -t stands for file type 

```

#### dhcp
```python
服务器端： 
yum install -y dhcp    # instlal dhcp
systemctl status dhcp     # check the service status
cat /etc/dhcp/dhcpd.conf    # view the dhcp config file
cat /usr/share/doc/dhcp*/dhcpd.conf.example >> /etc/dhcp/dhcpd.conf  # 导入模板文件
[root@andycentos ~]# cat /etc/dhcp/dhcpd.conf
subnet 192.168.182.0 netmask 255.255.255.0 {       #指定网段，需要和掩码保持一致
  range 192.168.181.10 192.168.182.20;                     #指定IP池    
  option domain-name-servers ns1.internal.example.org;  #指定DNS地址
  option domain-name "internal.example.org";         #指定域       
  option routers 192.168.182.1;                           #指定网关 
  default-lease-time 600;                             #指定默认租约时间
  max-lease-time 7200;                                 #指定最大租约时间
}
systemctl restart dhcpd   # start the service
systemctl status dhcpd 

客户端：
[root@andycentos ~]# cat /etc/sysconfig/network-scripts/ifcfg-enp0s3  # enable get ip address by dhcp
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="dhcp"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="enp0s3"
UUID="8a535ce2-db1d-46d2-990e-c37de9e80da9"
DEVICE="enp0s3"
ONBOOT="yes"

dhclient -r enxx  # release the network card ip address
dhclient  # renew ip address 


```

####apache
```python
click here get more info about Apache 
httpd -V   # check httpd version 2.4.6
vim /etc/httpd/conf/httpd.conf  # main config file
 Listen 80  # website port
 ServerName: www.andysong.com   # config website domain name
 DocumentBoot "/var/www/html/"   # config the default home dit
 DirectoyIndex index.html       # config the homepage file
 /var/log/httpd          # config the log file location
cat /etc/httpd/conf.d/*.conf    # sub config file
ss -ntl  # view listen port, netstat -ntl
cd /var/log/httpd   # log file location
rpm -ql httpd  # view httpd generate folder




```

####
```python



```

####
```python



```
####
```python



```

####
```python



```

####
```python



```

####
```python



```

####
```python



```

####
```python



```
#### awk
```python

ip a | grep global | awk -F/ '{print$1}' 


```
#### sed
```python


```

#### xarge
```python


```



