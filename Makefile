PYTHON=python
PIP=pip

MAKEFLAGS += --always-make # 避免使用缓存。

install: requirements.txt
	$(PIP) install -r $^

depend: requirements.txt
	$(PIP) freeze > $^

# 在执行下列命令之前，需要先进入 Python 虚拟环境：
# source venv/Scripts/activate

run5:
	$(PYTHON) detect.py --weights yolov5s.pt --source ./various-task/video/5s.mp4

run7:
	$(PYTHON) detect.py --weights yolov5s.pt --source ./various-task/video/7s.mp4

run9:
	$(PYTHON) detect.py --weights yolov5s.pt --source ./various-task/video/9s.mp4

run11:
	$(PYTHON) detect.py --weights yolov5s.pt --source ./various-task/video/11s.mp4

run13:
	$(PYTHON) detect.py --weights yolov5s.pt --source ./various-task/video/13s.mp4

run15:
	$(PYTHON) detect.py --weights yolov5s.pt --source ./various-task/video/15s.mp4
