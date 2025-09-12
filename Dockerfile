FROM python:3.9-slim

WORKDIR /app
COPY . /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg libsm6 libxext6 unzip \
 && rm -rf /var/lib/apt/lists/*

# Install AWS CLI via pip
RUN pip install awscli

# Install Python requirements
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
