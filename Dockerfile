FROM mongo:3.3
MAINTAINER xun "me@xun.my"

RUN mkdir -p /opt/mongo-replset-script
COPY replset.sh /opt/mongo-replset-script
WORKDIR /opt/mongo-replset-script

RUN chmod +x replset.sh

ENV MONGO_REPLSET_NAME=mongoreplset
ENV MONGO_MASTER=mongo1
ENV MONGO_SECONDARY=mongo2,mongo3

CMD ["/bin/bash", "./replset.sh"]
# RUN /opt/mongo-replset-script/replset.sh

# docker build -t axnux/mongo-replset-config:latest . #
