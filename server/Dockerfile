FROM openjdk:8-alpine

ARG version='2.0.4.5'
ENV maxram='6G'
ENV minram='2G'
ENV EULA='TRUE'


# Moving logs and configs to volumes from /server folder
RUN mkdir /server && \
    mkdir /server/logs && \
    mkdir /server/logs_core && \
    mkdir /server/config && \
    mkdir /server/config_core && \
    mkdir /server/asm && \
    mkdir /server/world && \
    ln -s /server/logs_core/mineteaker.log /server/minetweaker.log && \
    ln -s /server/logs_core/log /server/log && \
    ln -s /server/config_core/GregTech.cfg /server/GregTech.cfg  && \
    ln -s /server/config_core/GregTech.lang /server/GregTech.lang && \
    ln -s /server/config_core/blueprints /server/blueprints && \
    ln -s /server/config_core/ops.json /server/ops.json && \
    ln -s /server/config_core/server.properties /server/server.properties && \
    ln -s /server/config_core/usercache.json /server/usercache.json && \
    ln -s /server/config_core/whitelist.json /server/whitelist.json && \
    ln -s /server/config_core/banned-players.json /server/banned-players.json && \
    ln -s /server/config_core/banned-ips.json /server/banned-ips.json

# Modpack files
ADD http://downloads.gtnewhorizons.com/?do=download&file=ServerPacks%2FGTNewHorizonsServer-1.7.10-${version}.zip /server
RUN unzip /server/GTNewHorizonsServer-1.7.10-${version}.zip -d /server && \
    rm -f /server/GTNewHorizonsServer-1.7.10-${version}.zip 

# Custom settings
ADD ./eula.txt /server/eula.txt
ADD ./startserver.sh /server/startserver.sh
ADD ./server.properties /server/config_core/server.properties

# Rights
RUN addgroup minecraft && \
    adduser -G minecraft -S -h /server minecraft && \
    chmod 755 /server/startserver.sh && \
    chown -R minecraft:minecraft /server

# Input and Output definitions
VOLUME /server/logs
VOLUME /server/logs_core
VOLUME /server/config
VOLUME /server/config_core
VOLUME /server/asm
VOLUME /server/world

EXPOSE 25565/tcp
EXPOSE 25565/udp

WORKDIR /server
USER minecraft 

CMD ["/server/startserver.sh"]

