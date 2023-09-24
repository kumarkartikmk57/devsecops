#!/bin/bash
#This script is used to start sonarqube docker container on port 9000
systemctl start docker
docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest