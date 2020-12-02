## Linux Basic Commands

#### 开机关机
```python
reboot  # 重启
poweroff  #关机
shutdown -P now #立刻关机
uptime # 查看主机running time

```

#### man, pwd, touch, clear
```python
man ls # get the help for commands
pwd  # show the current directory
touch andy.txt # create a file
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

#### 内存&CPU: free, top, ps
```python
free -h # 查看内存使用情况， -h 代表human readable
top # 查看CPU使用情况, 按’z‘ 彩色显示进程, 'c' display absolute path of running pro
top -u root #查看root用户使用的进程
ps -aux # 以BSD语法显示正在运行的进程
ps -ef # 以标准语法显示正在运行的进程
more /proc/cpuinfo # show the cpu info 
more /proc/cpuinfo | grep 'model name'


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

```

#### mkdir & rmdir & rm & mv
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

```

#### history
```python
history # show the commands history, defualt is 1000
history -d 10 # delete the last 10 commands
history -c # clear all the commands history of current user
!2323  # excute the history command by history id 
!keyworkd # excute the history command by key word
Cat /etc/profile | grep -i HISTSIZE # 可以修改 history size, 默认只记录1000

```
#### more & cat & head & tail
```python
cat andy.txt # display the file contents one time
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

```

#### du
```python
du a.txt # show the size of file
du # show the file size of current dir
du -s /root # show the total size 
du -sh /root # -h stands for human readable
ll -h # show the actual file size, du show the minimal storge unit, start from 4K(if file size is 1.4k, will show 4k by du command)


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
 
 
```

#### pipe & wc
```python
|  # transfer the output to next input 
cat /etc/passwd | wc -l  # prints the number of lines
echo "this is andy" | wc -c # displays count of bytes present in a file
echo "this is andy" | wc -w # displays count of word present in a file

```

#### w & who & whoami
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

#### 
```python


```

#### awk
```python

ip a | grep global | awk -F/ '{print$1}' 


```
#### 
```python


```

#### 
```python


```



