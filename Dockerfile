FROM xxynet/kira-ai:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# 换中科大源（加快国内拉取）
RUN if [ -f /etc/apt/sources.list.d/debian.sources ]; then \
      sed -i 's|deb.debian.org|mirrors.ustc.edu.cn|g' /etc/apt/sources.list.d/debian.sources ; \
    fi

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        wget \
        ffmpeg \
        nodejs \
        npm \
        jq \
        unzip \
        sqlite3 \
        tmux \
        ca-certificates \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 基础 pip + 主人额外依赖
RUN pip install --no-cache-dir \
        yt-dlp \
        Pillow \
        tiktoken \
        redis

# KiraAI WebUI 需要前端（npm 已就绪）
WORKDIR /app