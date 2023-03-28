# Yolov5 in AI-Task

本项目是一个识别人物和车辆的机器学习模型，基于 Yolo 算法进行实现。其作为 AI-Task 项目的一个分支，在边缘计算平台中充当 AI 计算任务。

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

> 项目的原 github 地址为：https://github.com/ultralytics/yolov5。

为了解决不同 python 项目中的依赖冲突问题，项目最好运行在虚拟环境中，进入和退出虚拟环境的命令如下：

```bash
cd ./venv/Scripts && source activate && cd ../../
cd ./venv/Scripts && deactivate && cd ../../
```