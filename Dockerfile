# DOCKER-VERSION 1.1.0

FROM centos:centos7

ENV JDK_VER 1.7.0
ENV JDK_HEAP 1024M
ENV JDK_STACK 1024M
ENV MINECRAFT_VER 1.8.1
ENV MINECRAFT_JAR minecraft_server.${MINECRAFT_VER}.jar

RUN yum install -y -q java-${JDK_VER}-openjdk-headless
RUN mkdir /opt/minecraft
ADD minecraft-server.sh /usr/local/bin/minecraft-server.sh

RUN useradd -d /opt/minecraft minecraft
RUN chown -R minecraft:minecraft /opt/minecraft
USER minecraft

WORKDIR /opt/minecraft
VOLUME /opt/minecraft
EXPOSE 25565

CMD ["/usr/local/bin/minecraft-server.sh"]
