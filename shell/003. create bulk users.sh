#!/bin/bash
for i in {1..20}
do
    adduser user$i
    pass=`echo $RANDOM | md5sum | cut -c 1-8`
    echo $pass | passwd --stdin user$i
    echo -e "User_Name: user$i \n Password: $pass" >> account.txt

done




# delete bulk users

#!/bin/bash
for i in {1..20}
do
    adddel -r user$i   # remove user home dir
   

done
