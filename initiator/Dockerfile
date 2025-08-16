FROM python:3.10.12-slim

WORKDIR ${WORKING_DIR}

COPY requirements.txt .

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential gcc libffi-dev \
    && pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get purge -y --auto-remove build-essential gcc libffi-dev \
    && rm -rf /var/lib/apt/lists/*

COPY initiator/* .


