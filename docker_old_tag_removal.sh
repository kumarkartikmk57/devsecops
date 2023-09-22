#!/bin/bash
#THIS SCRIPT WILL DELETE THE OLDER BUILD AND KEEP THE LASTEST VERSION ONLY
a=`docker images | grep jenjen | awk '{print $2}'|wc -l`
if [ $a == 1 ]
then
        exit 0
else
        #echo `docker images | grep jenjen | awk '{print $2}'`
        b=`docker images | grep jenjen | awk '{print $2}'|tail -n 1`
        #echo $b
        docker image rm jenjen:$b --force
fi
