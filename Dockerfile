FROM poiamber/youtube-dl-webui:basic

RUN rm -rf /etc/apt/sources.list
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y \
 && pip install --upgrade pip \
 && pip install --upgrade youtube-dl \
 && chmod a+rx /usr/local/bin/youtube-dl 
 
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["python", "-m", "youtube_dl_webui"]
