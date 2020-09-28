#! /bin/bash

CurrentUser=$(whoami)
echo $CurrentUseecho $CurrentUserr
sudo -E bash -c 'groupadd docker'

sudo -E bash -c 'gpasswd -a fshs docker'

if [ $? -ne 0 ]; then
 echo "用户组添加 用户失败";
 exit -2
fi
sudo -E bash -c 'service docker restart'


