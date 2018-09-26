FROM ubuntu:18.04

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && sed -i '/security.ubuntu.com/d' /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests tzdata ca-certificates locales fonts-wqy-zenhei fonts-wqy-microhei wget libreoffice-core imagemagick pdf2svg nodejs npm poppler-utils xdg-utils xz-utils python \
    && rm -rf /var/lib/apt/lists/*

RUN localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

RUN npm install -g svgo --registry=https://registry.npm.taobao.org && npm cache clean \
    && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin && rm -rf linux-installer.sh

ENV LANG zh_CN.utf8