
#!/bin/bash
useradd shelltest
touch /home/shelltest/try.html
cat /etc/passwd | wc -l
yum list installed | wc -l 
# or rpm -qa | wc -l 


