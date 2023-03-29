FROM python

WORKDIR /ai-task

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/

COPY . .

RUN sed -i 's/deb.debian.org/ftp.cn.debian.org/g' /etc/apt/sources.list && apt-get update && apt-get install -y libgl1-mesa-glx




