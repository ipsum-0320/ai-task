FROM python

WORKDIR /ai-task

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .





