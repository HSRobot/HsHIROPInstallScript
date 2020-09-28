#! /bin/bash

IMAGE_ID=
IMAGE_NAME=
path=/home


strRosEnv="hsrosenv"

#docker login


# start docker images and containter
docker start test
#docker exec

if [ $? -ne 0 ];then

 #IMAGE_ID=$(docker images > 1.txt && awk '{if(match($(strRosEnv)))} END{print $1}' 1.txt)
 #IMAGE_ID=$(docker images |awk '/hsrosenv/{print $1}')


 IMAGE_NAME=$(docker images |awk  '/hsrosenv/{print $1, $3}')
 array=($IMAGE_NAME)

 IMAGE_ID=${array[1]}
 echo $IMAGE_ID
###############
 resultcompare=$(echo $IMAGE_NAME| grep "${strRosEnv}")
 if [[ $resultcompare != "" ]] ;then
   sudo -S docker run --name test -it -v /usr:/usr -v /lib:/lib -v /etc:/etc -v /lib64:/lib64 -v /opt:/opt -v /etc:/etc  $IMAGE_ID  /bin/bash
   echo $IMAGE_NAME
   echo "docker name sucessfully"
 else
   echo "docker name error "
   exit 1;
 fi


#################
 docker exec -it  test /bin/bash /home/setup_package.sh 
 if [ $? -ne 0 ]; then
   echo "docker env is error , please notice "
   exit -2;
 fi
 else
   docker exec -it  test /bin/bash /home/setup_package.sh 
fi


# exit the docker env and build the environmnet
#exit 0

cd ~

#copy the local directory
docker cp test:/home/catkin_ws/  ~
docker cp test:/home/work ~
if [ $? -ne 0 ] ;then
   echo "docker copy the files is error "
   exit -2
fi
  
cd ~/catkin_ws && ./setup_package.sh

if [ $? -ne 0 ] ;then
   echo "catkin_ws complier is error "
   exit -3
fi



echo "HsRobot environment is build sucessfully"


echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
