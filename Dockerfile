# For ubuntu, the latest tag points to the LTS version, since that is
# recommended for general use.
FROM python:3.6-slim

# grab gosu for easy step-down from root
#ENV GOSU_VERSION 1.10
RUN set -x \
	&& buildDeps=' \
		unzip \
		dirmngr \
		wget \
		xz-utils \
	' \
	&& apt-get update && apt-get install -y --no-install-recommends $buildDeps


# install ffmpeg
RUN : \
	&& mkdir -p /tmp/ffmpeg \
	&& cd /tmp/ffmpeg \
	&& wget -O ffmpeg.tar.xz https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
	&& tar -xf ffmpeg.tar.xz -C . --strip-components 1 \
	&& cp ffmpeg ffprobe qt-faststart /usr/bin \
	&& cd .. \
	&& rm -fr /tmp/ffmpeg

# install youtube-dl-webui
WORKDIR /usr/src/youtube_dl_webui

RUN : \
	&& pip install --no-cache-dir youtube-dl flask \
	&& wget -O youtube-dl-webui.zip https://github.com/d0u9/youtube-dl-webui/archive/dev.zip \
	&& unzip youtube-dl-webui.zip \
	&& cd youtube-dl-webui*/ \
	&& cp -r ./* /usr/src/youtube_dl_webui/ \
	&& ln -s $YOUTUBE_DL_WEBUI_SOURCE/example_config.json /etc/youtube-dl-webui.json \
	&& cd .. && rm -rf youtube-dl-webui* \
	&& apt-get purge -y --auto-remove wget unzip dirmngr \
	&& rm -fr /var/lib/apt/lists/*

#COPY docker-entrypoint.sh /usr/local/bin
COPY default_config.json /config.json
#ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["python", "-m", "youtube_dl_webui"]
