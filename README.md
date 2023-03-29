# AI-Task

本项目是为完成毕设研究所需要的 AI 任务，它是作为被调度的计算任务而存在的。项目是一个识别人物和车辆的机器学习模型，基于 Yolo 算法进行实现。其作为 AI-Task 项目的一个分支，在边缘计算平台中充当 AI 计算任务。

# 如何运行

`detect.py` 为使用训练好的模型进行目标检测的入口文件，使用方法如下：
```bash
$ python detect.py --weights yolov5s.pt --source \
    0                               # webcam
    img.jpg                         # image
    vid.mp4                         # video
    screen                          # screenshot
    path/                           # directory
    list.txt                        # list of images
    list.streams                    # list of streams
    'path/*.jpg'                    # glob
    'https://youtu.be/Zgi9g1ksQHc'  # YouTube
    'rtsp://example.com/media.mp4'  # RTSP, RTMP, HTTP stream
```

> Yolo 项目的原 github 地址为：https://github.com/ultralytics/yolov5。

为了解决不同 python 项目中的依赖冲突问题，项目最好运行在虚拟环境中，进入和退出虚拟环境的命令如下：

```bash
# 进入 venv 的指令，工作目录需要是 vegetables_analyzer/。
cd ./venv/Scripts && source activate && cd ../../

# 退出 venv 的指令，工作目录需要是 vegetables_analyzer/。
cd ./venv/Scripts && deactivate && cd ../../

# 如果要使用 venv 中的依赖，那么执行时，命令行应该也处于 venv 环境中。
```


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

# 部署镜像时遇到的问题

## 1.image 被自动删除

这个是 k8s 的问题，Kubernetes 会自动删除未使用的镜像，为了避免这个问题，我们可以修改相应节点上的配置文件 `/var/lib/kubelet/config.yaml`：
```yaml
imageMinimumGCAge: 525600m
```

## 2.docker image 共享磁盘空间

举一个例子，一个 image-A 占用磁盘 4G，如果在另一个 image-B 中只是 FROM 了 image-A，别的什么也没有做，那么 image-A 和 image-B 一共会占用 4 G 空间，而不是 8 G。

这是因为 Docker 使用分层存储技术，每个镜像都由一系列文件系统层级组成。当多个镜像共享同一层时，它们仅需保存相同的存储区块，而不是复制整个存储区块，从而节省了存储空间。因此，FROM 指令只是将基础镜像添加到新镜像的文件系统层级中，并不会导致重复占用存储空间。

> 另外，在 Docker 容器中运行的命令默认都是 root 权限的。