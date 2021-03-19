# youtube-dl-webui

---
Visit Original [GitHub](https://github.com/d0u9/youtube-dl-webui) for more details.


## Install

From DockerHUB

        docker pull poiamber/youtube-dl-webui
Updated : 2021 Mar 19

## Usage

Run container

        docker run -d \
            --name <container_name> \
            -e PGID=<gid> \
            -e PUID=<uid> \
            -e PORT=port \
            -e CONF_FILE=<config_file_in_container> \
            -v <config_file>:<config_file_in_container> \
            -p <host_port>:<port> \
            -v <host_download_dir>:<download_dir> \
            poiamber/youtube-dl-webui


## Default configurations

All defualt settings can be found in [this json file](https://github.com/d0u9/docker/blob/master/dockerfiles/youtube-dl-webui/default_config.json).

- Files save to: `/tmp/youtube_dl`;
- Database file location: `/tmp/youtube_dl_webui.db`;
- Log size: `10`;
- Listen address: `0.0.0.0`;
- Listen port: `5000`
