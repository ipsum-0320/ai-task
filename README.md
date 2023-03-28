# AI-Task

本项目存放了毕设研究所需要的 AI 任务，它们是作为被调度的计算任务而存在的，计算任务列表如下：

* yolov5

# 一些 python 工程化的知识

## 1.什么是 requirement.txt ?

很多 `Python` 项目都会包含 `requirements.txt` 文件，里面内容是项目的依赖包及其对应版本号的信息列表，即项目依赖关系清单，其作用是用来重新构建项目所需要的运行环境依赖。

通过运行 `pip install -r requirements.txt` 来安装该项目所依赖的包。

同样的，我们也可以在项目目录下运行命令 `pip freeze > requirements.txt` 来生成 `requirements.txt` 文件，以便他人重新安装项目所依赖的包。

`requirements.txt` 文件的内容格式如下:
```txt
Flask-Security==1.7.5
Flask-SQLAlchemy==2.2
Flask-WTF==0.14.2
``` 

## 2.什么是 Python 虚拟环境 ?
`Python` 语言和 `Java` 语言，在开发项目的时候有所不同。`Java` 是系统有一个编译环境，项目所依赖的包，放在各个项目下，这样不同项目如果用到一个包的不同版本，只要和编译器兼容，就没问题。而 `Python` 项目依赖的包，会安装在系统 `Python` 目录下，如果多个项目使用同一个 `Python` 环境，但是依赖同一个包的不同版本，就会引发冲突。因此 `Python` 有一个虚拟环境的概念。
　　

`Python` 虚拟环境的使用，就是为了隔离各个项目的环境，防止不同项目因为使用同一个包的不同版本而引发冲突。

如果类比 `npm`，那么直接通过 `pip` 安装依赖就相当于全局安装 `node_modules`，而在虚拟环境中通过 `pip` 安装依赖则相当于在相应项目中局部安装 `node_modules`。

`Python` 虚拟环境的实现主要利用了**操作系统中环境变量**以及进程间环境隔离的特性。在激活虚拟环境之时，激活脚本会将当前命令行程序的 `PATH` 修改为虚拟环境的，这样执行命令就会在被修改的 `PATH` 中查找，从而避免了原本 `PATH` 可以找到的命令，从而实现了 `Python` 环境的隔离。

## 3.如何创建虚拟环境呢 ?

1. 创建虚拟环境目录，`mkdir venv && cd venv`。
2. 创建虚拟环境，`python -m venv .`。
3. 如果是 Windows 系统则进入 `Scripts` 目录，如果是 Linux/Mac 系统则进入 `bin` 目录。
4. 如果是 Windows 系统则执行 `activate.bat`（cmd），如果是 Linux/Mac 系统则执行 `source activate`（bash）。
5. 此时我们进入了虚拟环境（表现为 Linux 意义上的用户名前面会多出一个虚拟环境目录），如果我们想要退出，可以选择执行 `deactivate` 命令。

