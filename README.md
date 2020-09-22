# HsHIROPInstallScript
# 华数机器人的HIROP 相关环境的配置  

1. 安装ROS 环境  

&emsp;&emsp;&emsp;步骤1  

		sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'       
        
&emsp;&emsp;&emsp;步骤2	

		sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654'    
        
&emsp;&emsp;&emsp;步骤3  

 			sudo apt-get update  
            
&emsp;&emsp;&emsp;步骤4  

 			sudo apt-get install ros-kinetic-desktop-full   
            
 			sudo apt-get install ros-kinetic-moveit  
            
&emsp;&emsp;&emsp;步骤5 环境激活  

 			echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc    
             source ~/.bashrc  

2. 安装docker 环境 安装命令如下:  

			curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun  
                
3. docker 镜像的导入  
			docker import *.tar   

4. 启动一键安装的脚本  
 			bash  InstallRosEnv.sh  
  
5. 测试  
