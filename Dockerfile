FROM python:3.10.8-slim-buster

# Fix buster repo (use archive.debian.org instead of deb.debian.org)
RUN sed -i 's|deb.debian.org/debian|archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
RUN pip install pytube

ENV COOKIES_FILE_PATH="youtube_cookies.txt"

CMD gunicorn app:app & python3 main.py
#spidy
