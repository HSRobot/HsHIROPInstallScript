# HsHIROPInstallScript
# 华数机器人的HIROP 相关环境的配置  

1. 安装ROS 环境  

    步骤1  

		sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'       
        
    步骤2	

		sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654    
        
    步骤3  

		sudo apt-get update  
            
    步骤4  

		sudo apt-get install ros-kinetic-desktop-full   
		   （在安装过程中可能会断线，如果发现断线中止了，可以重新敲指令继续下载）  
            
		sudo apt-get install ros-kinetic-moveit ros-kinetic-ecto ros-kinetic-opencv-candidate ros-kinetic-serial ros-kinetic-industrial_msgs ros-kinetic-realtime-tools ros-kinetic-industrial-utils ros-kinetic-moveit-visual-tools   

		sudo apt-get install automake autoconf libtool python3-dev    
            
    步骤5 环境激活  

		echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc    
                source ~/.bashrc  


2. 安装docker 环境 安装命令如下:  

		curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun  
                
3. docker 镜像的导入  

            docker import *.tar hsrosenv001:v1


4. 启动一键安装的脚本  

            bash  InstallRosEnv.sh  
  
5. 测试  
