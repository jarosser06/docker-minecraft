#!/bin/bash

if ! [ -a /opt/minecraft/${MINECRAFT_JAR} ]; then
  curl -L ${MINECRAFT_JAR_URL} -o $MINECRAFT_JAR
  chmod +x $MINECRAFT_JAR
fi

if ! [ -a /opt/minecraft/eula.txt ]; then
  echo "eula=true" >> /opt/minecraft/eula.txt
fi

/usr/bin/java -Xmx${JDK_HEAP} -Xms${JDK_STACK} -jar $MINECRAFT_JAR nogui
