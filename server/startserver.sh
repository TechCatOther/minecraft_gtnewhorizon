#!/bin/sh

forge=`ls -1 forge-*.jar`
java -Xms${minram:-2G} -Xmx${maxram:-6G} -jar ${forge} nogui

