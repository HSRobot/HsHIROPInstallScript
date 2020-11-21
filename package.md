# HsHIROPInstallScript
# 华数机器人的HIROP 相关环境的配置  

 照例查看下docker export的帮助：

    docker export --help
     
    Usage:  docker export [OPTIONS] CONTAINER
     
    Export a container's filesystem as a tar archive
     
    Options:
          --help            Print usage
      -o, --output string   Write to a file, instead of STDOUT

 从帮助可以看出，docker export是用来将container的文件系统进行打包的。例如：


	docker export -o hsrosenv20201121.tar test
