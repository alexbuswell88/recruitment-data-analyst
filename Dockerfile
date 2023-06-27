FROM python:3.8
WORKDIR /app

RUN apt-get update && apt-get install -y libpq-dev netcat-openbsd wget curl unzip bash

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Install MinIO Client
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/bin/mc && \
    chmod +x /usr/bin/mc
