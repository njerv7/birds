FROM python:3.13-rc-slim

RUN groupadd -g 1000 python && \
    useradd -r -u 1000 -g python python

COPY requirements.txt .

RUN pip install -r requirements.txt
RUN mkdir /app && chown python:python /app

WORKDIR /app
COPY app.py birds.db /app/
USER 1000

EXPOSE 80

CMD ["python", "app.py", "8080"]