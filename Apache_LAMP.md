## Apache Web服务器（LAMP架构）
  
### Apache 的介绍
```
1).世界上使用率最高的网站服务器，最高时可达70%；官方网站：apache.org

2).http 超文本协议 HTML 超文本标记语言

3).URL 统一资源定位符

http://www.sina.com.cn:80/admin/index.php

http:// -- ssl 安全套接字

www.sina.com.cn -- 域名

:80 -- 端口 http对应80端口，https对应443端口

/admin/index.php -- 网址目录和文件名

4).LAMP安装说明

①源码包安装  自定义 开发版本选择方便 效率高

生产环境 安全 稳定

开发环境 局域网(内网)

②二进制包安装 yum命令安装 官方版本比较低
  
```

### Apache的三种工作模式
```
Apache 一共有3种稳定的 MPM 模式(Multi-process processing module: 多进程处理模块)，它们分别是 prefork、worker、event。http-2.2版本的httpd默认的mpm工作模式为prefork，2.4版本的httpd默认是event工作模式。可以通过 httpd -V 来查看。

# httpd -V | grep -i "server mpm"
Server MPM:     Prefork
 

编译的时候，可以通过 configure 的参数来指定：

--with-mpm=prefork|worker|event

```

####  1. prework
```
(作用：用一个进程处理一个用户请求)

Apache在启动之初，就预先fork一些子进程，然后等待请求进来。之所以这样做，是为了减少频繁创建和销毁进程的开销。每个子进程只有一个线程，在一个时间点内，只能处理一个请求。

优点：成熟稳定，兼容所有新老模块。同时，不需要担心线程安全的问题。

缺点：一个进程相对占用更多的系统资源，消耗更多的内存。而且，它并不擅长处理高并发请求。

```
 

#### 2. worker 工作模式
```
(作用：一个进程生成多个线程，一个线程处理一个用户请求)

使用了多进程和多线程的混合模式。它也预先fork了几个子进程(数量比较少)，然后每个子进程创建一些线程，同时包括一个监听线程。每个请求过来，会被分配到1个线程来服务。线程比起进程会更轻量，

因为线程通常会共享父进程的内存空间，因此，内存的占用会减少一些。在高并发的场景下，因为比起prefork有更多的可用线程，表现会更优秀一些。

优点：占据更少的内存，高并发下表现更优秀。

缺点：必须考虑线程安全的问题, 一个进程关闭，和其关联的线程都会中断。

```
 
#### 3. event 工作模式
```
(用一个线程处理一个用户请求)

它和worker模式很像，最大的区别在于，它解决了keep-alive场景下，长期被占用的线程的资源浪费问题。event MPM中，会有一个专门的线程来管理这些keep-alive类型的线程，当有真实请求过来的时候，

将请求传递给服务线程，执行完毕后，又允许它释放。这样增强了高并发场景下的请求处理能力。

HTTP采用keepalive方式减少TCP连接数量，但是由于需要与服务器线程或进程进行绑定，导致一个繁忙的服务器会消耗完所有的线程。Event MPM是解决这个问题的一种新模型，它把服务进程从连接中分

离出来。在服务器处理速度很快，同时具有非常高的点击率时，可用的线程数量就是关键的资源限制，此时Event MPM方式是最有效的，但不能在HTTPS访问下工作。

```

### apache基本信息
``` 
apache为企业中常用的web服务，用来提供http://(超文本传输协议)

主配置目录：/etc/httpd/conf

主配置文件：/etc/httpd/conf/httpd.conf

子配置目录：/etc/httpd/conf.d

子配置文件：/etc/httpd/conf.d/*.conf

默认发布目录：/var/www/html/

默认发布文件：index.html

默认端口：80
```

 

### 服务器的返回状态值
```
（表示请求的是否成功等信息）

1xx：一般不用，就是一些描述信息

2xx：表示请求成功

  200：ok，请求下载成功

  201：create ok，上传成功

3xx：表示请求的资源被重定向

  301：moved permanently，永久重定向

  302：Found，临时重定向

  304：not modified，标识一个缓存的资源是否发生过更改

4xx：请求失败，因为客户端原因导致失败

  403：forbidden，表示客户端没有权限访问所请求的资源

  404：Not Found，表示客户端所请求的资源不存在

  405：Method Not Allowd：表示客户端所用的方法不被允许

5xx：请求失败，因为服务器端原因导致失败

  500：Internal Server Error，服务器内部错误

  502：Bad Gateway，代理服务器从上游服务器获取到的是伪响应

  503：service unavailable，服务器暂时不可用
```
 

### 什么是LAMP
```
LAMP=Linux Apache Mysql/MariaDB PHP/Perl/Python 这些软件都是开源免费的软件，几个程序各自是独立的，经常为了达到我们需要的效果而协同工作，组成了我们常见的LAMP架构平台!LAMP是世界上最流行的组合，当然同时也有Nginx，也就是LNMP: LAMP 相对于 NGINX 来说较为安全，但是Nginx处理高并发比Apache要强，

NGINX 相对于 LAMP 来说安全较为差一点，同样的配制环境负载远远高于 LAMP 向国内的一些大公司，淘宝、新浪都在用这一些 NGINX，向那么大的公司网站需要用到服务器群用LAMP搭建环境成本远远大于NGINX。打个比方本来1000000W访问量需要 10台LAMP环境服务器才能完成，但是使用NGINX也许只需要5、6台这样一来对于这样的

公司来说就大大的节约了成本。从网站的流量上来说，70%以上的访问流量是LAMP来提供的，LAMP是最强大的网站解决方案，在以前这句话没有错，但是在现在，这句话有待证实！！！因为在以后的过程中，会发现我们会使用的架构是Nginx和Apache结合使用：使用Nginx可以做集群等相关配置，可以和apache一起使用，有的会用apache去跑php，

然后用nginx做反向代理，比如apache运行在8080端口，nginx在80端口，访问php文件时，反向代理到apache，静态页通过nginx处理。nginx支持高并发，apache对php的运行比较稳定。

常见的网页类型：htm,html,shtml,stm.php,asp,aspx,shtm,jsp等等Apache本身只处理静态页面，处理动态页面需要使用libphp5.so这个模块去工作，编译php也其实是将一个至关重要的模块打入到apache内部，然后apache收到php请求，将请求交给这个模块来处理！

```
