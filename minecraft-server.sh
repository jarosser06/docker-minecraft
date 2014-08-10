#!/bin/bash

if ! [ -a /opt/minecraft/${MINECRAFT_JAR} ]; then
  curl -L https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VER}/${MINECRAFT_JAR} -o $MINECRAFT_JAR
  chmod +x $MINECRAFT_JAR
fi

if ! [ -a /opt/minecraft/eula.txt ]; then
  echo "eula=true" >> /opt/minecraft/eula.txt
fi

/usr/bin/java -Xmx${JDK_HEAP} -Xms${JDK_STACK} -jar $MINECRAFT_JAR nogui
