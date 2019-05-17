FROM codercom/code-server
USER root
RUN apt update && \
    apt install nodejs npm -y && \
    apt-get clean && \
    apt-get purge -y --auto-remove
USER 1000
