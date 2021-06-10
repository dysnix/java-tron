FROM mcr.microsoft.com/java/jdk:8-zulu-ubuntu

ARG FULL_NODE_URL="https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v4.2.1/FullNode.jar"
ARG FULL_NODE_CONF_URL="https://raw.githubusercontent.com/tronprotocol/tron-deployment/master/main_net_config.conf"

ADD ${FULL_NODE_URL} /opt/FullNode.jar
ADD ${FULL_NODE_CONF_URL} /usr/local/etc/main_net_config.conf

RUN apt-get update && apt-get install -y wget

CMD ["java", "-Xmx32g", "-XX:+UseConcMarkSweepGC", "-jar", "/opt/FullNode.jar", "-c", "/usr/local/etc/main_net_config.conf"]

EXPOSE 18888
EXPOSE 8090
EXPOSE 8091
EXPOSE 5555
