#### mount配置文件
```
一般的mount挂载，重启电脑后就会丢失挂载，想开机自动挂载可以通过以下方式：
cat /etc/fstab  # view mount config file
/dev/mapper/centos-root /   # mount to / dir
cat /etc/rc.local    # mount the block file to this file 
noted: 建议通过rc.local 挂载系统磁盘，fstab 会开机自检，如果出现问题会导致开不了机，rc.local不会


```

#### 

```



```
