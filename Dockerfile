FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# System dependencies
RUN apt update && apt install -y \
    ffmpeg \
    aria2 \
    git \
    curl \
    unzip \
    p7zip-full \
    tzdata \
    libgl1 \
    libglib2.0-0 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# App source
COPY . .

CMD ["bash", "start.sh"]
