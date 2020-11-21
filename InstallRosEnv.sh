#!/bin/bash

IMAGE_ID=
IMAGE_NAME=
path=/home
RUNFLAG=0

strRosEnv="hsrosenv"
################# 如果已经创建容器了 那么则运行启动容器
var=$(docker ps  -a |grep test)

if [[ $var == "" ]];then

 IMAGE_NAME=$(docker images |awk  '/hsrosenv/{print $1, $3}')
 array=($IMAGE_NAME)

 IMAGE_ID=${array[1]}
 echo $IMAGE_ID

###############如查找不到 则进行创建镜像test

 resultcompare=$(echo $IMAGE_NAME| grep "${strRosEnv}")
 if [[ $resultcompare != "" ]] ;then
   sudo -S docker run --name test -it -v /usr:/usr -v /lib:/lib -v /etc:/etc -v /lib64:/lib64 -v /opt:/opt -v /etc:/etc  $IMAGE_ID  /bin/bash
   echo $IMAGE_NAME
   echo "docker name sucessfully"
   RUNFLAG=3
 else
   echo "docker name error "
   exit 1;
 fi

else
  echo "docker test already create ... "                
fi


var=$(docker ps |grep test)
if [[ $var == "" && $RUNFLAG==1 ]];then
   docker start test
else
  echo "docker test already running ... "                
fi


#### 附上已启动的容器

docker exec -it  test /bin/bash /home/setup_package.sh 
if [ $? -ne 0 ]; then
  echo "docker env is error , please notice "
  exit -2;
fi


# exit the docker env and build the environmnet
exit 0

cd ~

#copy the local directory
#docker cp test:/home/catkin_ws/  ~
#docker cp test:/home/work ~
if [ $? -ne 0 ] ;then
   echo "docker copy the files is error "
   exit -2
fi
  
#cd ~/catkin_ws && ./setup_package.sh

if [ $? -ne 0 ] ;then
   echo "catkin_ws complier is error "
   exit -3
fi



echo "HsRobot environment is build sucessfully"


echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
