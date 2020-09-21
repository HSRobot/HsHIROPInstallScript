#! /bin/bash

IMAGE_ID=

path=/home

# start docker images and containter
docker start test
#docker exec
docker exec -it  test /bin/bash /home/setup_package.sh 

if [ $? -ne 0 ]; then
 IMAGE_ID=docker images > 1.txt && awk '($1=="hsrosenv"){print $3}' 1.txt;
 sudo docker run --name test -it -v /usr:/usr -v /lib:/lib -v /etc:/etc -v /lib64:/lib64 -v /opt:/opt -v /etc:/etc  $IMAGE_ID  /bin/bash

 docker exec -it  test /bin/bash /home/setup_package.sh 

 if [ $? -ne 0 ]; then
   echo "docker env is error , please notice "
   exit -2;
 fi
fi


# exit the docker env and build the environmnet
exit 0

cd ~

docker cp test:/home/catkin_ws ~

if [ $? -ne 0 ] ;then
   echo "docker copy the files is error "
   exit -2
fi
  
cd ~/catkin_ws && ./setup_package.sh

if [ $? -ne 0 ] ;then
   echo "catkin_ws complier is error "
   exit -3
fi



echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "HsRobot environment is build sucessfully"



