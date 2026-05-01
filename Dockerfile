# syntax=docker/dockerfile:1

FROM python:3.11-slim-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      git \
    && git clone --depth 1 https://github.com/bioconvert/bioconvert.git /tmp/bioconvert \
    && python -m pip install --no-cache-dir /tmp/bioconvert \
    && apt-get purge -y --auto-remove build-essential git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/bioconvert

WORKDIR /data
ENTRYPOINT ["bioconvert"]
