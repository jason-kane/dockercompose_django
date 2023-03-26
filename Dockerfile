FROM python:3.11.2-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .

RUN apt update && \
    apt install -y gcc && \
    pip install --upgrade pip && \
    pip install --no-cache-dir \
        -r requirements.txt && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
# we're going to mount over this for local development
COPY . /app/