Docker虚拟开发环境
================

# 安装Docker

## Linux

Docker 提供了快速安装脚本：

	curl -sSL https://get.docker.com/ | sh

如果你不想执行一个不明不白的 shell 脚本，那么请看[安装教程](https://docs.docker.com/engine/installation/linux/)，选择你在用的发行版本。

如果你是一个 Docker 超新手，那么我建议你先去看看[系列教程](https://docs.docker.com/engine/getstarted/)。

## 安装Docker Compose

1. 运行下面的脚本：

	sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

```
注意：可以从github上的release页面获得最新的版本，替换上面的版本号。
```

2. 添加可执行权限

	sudo chmod +x /usr/local/bin/docker-compose


# 参考资料

- [Docker Cheat Sheet操作手册](https://github.com/wsargent/docker-cheat-sheet/tree/master/zh-cn)
- [Mac OS环境下Docker环境的搭建指南](https://www.viget.com/articles/how-to-use-docker-on-os-x-the-missing-guide/)