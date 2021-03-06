## vim 内容按色彩显示
```shell
echo export EDITOR=vim >>/etc/profile.d/env.sh

末行模式：当前窗口生效
:syntax on

```

## 情况1：从命令模式到输入模式

``` 
i：在光标所在位置的前插入内容
I：将光标移到到行首，然后进入输入模式
a：将光标向后移到一位，然后进行插入模式（输入的内容会在光标原始位置的后一位。
A：在当前行尾插入
o：在光标所在行的下面新开一行，然后进入输入模式
O：在光标所在行的上面新开一行，然后进入输入模式
 
命令模式下的常用操作
 
第一类操作：复制、移动删除文件内容
yy：复制光标所在的行
nyy：复制光标所在的行开始向下的N行
dd：剪切光标所在的行
ndd：剪切光标所在的行开始向下的N行
v + y:  复制选定区域
v + d:  剪切选定区域
p(小)：粘贴到光标所在行的下面
P(大)：粘贴到光标所在行的上面
 
D：删除光标所在位置到行尾的内容
dG：删除光标所在的行到末尾全部的行
 
第二类操作：撤销和重复执行的相关操作
u：撤销上次所指向的操作（相当于windows中ctrl+z）
nu：撤销n次操作（n的值最大是50）
ctrl+r：撤销刚刚所撤销的那个操作（相当于windows中ctrl+y）
 
.：重复执行上一次所做的操作
 
 
第三类操作：跳转相关的操作
nG：跳转到第n行
G：直接跳转到最后一行
gg: 跳转到第一行
 
0：跳转到行首（会认为空格也是内容，此时会跳转到空格的最前面）
^：跳转到行首（不认为空格是内容，此时会跳转到第一个非空字符）
$：跳转到行尾
 
ctrl+f：向下翻一屏
ctrl+b：向上翻一屏
 
第四类操作：替换相关操作
r：替换一个字符（替换完成之后，自动返回到编辑模式）
R：进入替换模式（要想退出替换模式，按esc）
 
第五类操作：查找
/string：在文件中搜索指定的字符串, n 移动到一下个
?: 从下往上查找
n：正向查找
N：反向查找

第六类操作：批量注释和取消注释
批量插入字符快捷键：
Ctrl+v进入VISUAL BLOCK（可视块）模式，按j（向下选取列）或者 k（向上选取列），再按Shift + i 进入编辑模式然后输入你想要插入的字符（任意字符），再按两次Esc就可以实现批量插入字符，这里仅仅实现批量注释，还可以实现批量添加内容。

批量删除字符快捷键：
Ctrl+v进入VISUAL BLOCK（可视块）模式，按 j （向下选取列）或者 k （向上选取列），直接（不用进入编辑模式）按 x 或者 d 就可以直接删去，再按Esc退出。
```
## 情况2：从输入模式到命令模式
``` 
esc 
```
 
## 情况3：从编辑模式到末行模式
```
进入末行模式的方式：在编辑模式下按shift+:
 
末行模式下的常用操作
 
第一类命令：行号
set nu：显示行号
set nonu：关闭行号
 
第二类命令：跳转
num：直接跳转到第num行 & ngg(12gg 跳到12行)
$：直接跳转到最后一行 & nG
 
第三类命令：取消匹配到的内容的高亮
nohl
 
第四类命令：运行shell命令
!ls -a  #在vim中直接执行命令

第五类命令：替换
s/原始内容/替换内容/g   #替换单行内容
%s/原始内容/替换内容/g   #替换所有行的内容
%s/asong/andysong/g
:54,56 s/echo/bajie/g   #54行到56行
(分隔符不一定是/，只要是三个相同的符号即可）
 
 
注意：
如果不用g，那么仅仅会替换每行的第一个找到的对象
如果使用g，那么会将范围内所有找到的对象全部做替换
 
例子：将54到56之间的echo替换为bajie
:54,56 s/echo/bajie/g
 
例子：将文件中全部的echo替换为bajie
:1,$ s/echo/bajie/g
或
:% s/echo/bajie/g
 
例子：将文件的50-100行行首添加一个#
:50,100 s/^/#/g
 
例子：1-5行首添加空格
:1,5 s/^/ /g
 
例子：将全部行首的空格删除
:1,$ s/^ //g
 
例子：将全部行首的#删除
:1,$ s/^#//g
 
例子：将1-5行中的a删除
:1,5 s/a//g
 
例子：在1-5行的末尾添加一个#
:1,5 s/$/#/g
 
例子：将文件中全部的/替换为+
:% s@/@+@g
 
补充1：
^：表示行首
$：表示行位
 
 
第六类命令：保存和退出
w：执行保存操作（保存到原始文件中）
w /path/to/file：实现文件另存为
q：退出
!：强制执行操作
 
第七类命令：高级操作
r /path/to/file：将file中的内容导入到当前文件中
set tabstop=4：将tab缩进的字符数设置为4个
set ai：设置自动缩进
set noai：取消自动缩进
 
第八类命令：复制、移动、删除多行的操作
start,end d：删除多行
start,end m dest：将多行移动到指定行的下面
start,end co dest：将多个复制到指定行的下面
 
例子：将59到198之间的内容复制到233行的下面
59,198 co 233
```

```
分屏操作
 
vim -o file1 file2：实现水平分屏
vim -O file1 file2: 实现垂直分屏
ctrl+w：切换到另一个分屏
 
 
打开文件的小技巧
vim +num file：打开文件的时候，自动跳转到第num行（加号不可省略）
vim + file：打开文件的时候，自动跳转到最后一行
 
 
 
vi的配置文件
 
/etc/vimrc：全局配置文件，在这个文件中做的配置，会对所有用户生效
~/.vimrc：(默认不存在，需要自己手动创建)用户配置文件，仅仅对当前用户生效
 
1. 编辑vi的配置文件，实现可以自动显示行号、缩进4个字符、自动对齐
# vi ~/.vimrc
:set nu
:set ai
:set tabstop=4
 
vi崩溃缓存机制
 
用vim编辑一个文件的是，如果文件没有正常的关闭（wq、q、q!），那么就会生成一个崩溃缓存文件
 
 
崩溃缓存文件的和作用
1. 缓存文件是隐藏文件
2. 缓存文件基本格式是 .file.swp
3. 缓存文件的作用是用于在系统意外关机的情况下，恢复文件中的内容（修改了文件内容，意外关掉终端或者系统）
4. 缓存文件的使用方式
第一步：# vim -r .file.swp
第二步：保存退出
第三步：删除缓存文件
 
 
注意：
1. 如果文件发生了修改，那么无法直接退出
2. 如果要退出一个修改了的文件，有三种方式
方式1：先执行保存(w)，然后执行退出(q)
方式2：直接保存并退出(wq)
方式3：不保存，并强制执行退出操作(q!)

```
