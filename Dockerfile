FROM ubuntu:12.04
MAINTAINER Jeff Dickey jeff@dickeyxxx.com

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget nginx-full

WORKDIR /tmp

RUN wget http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip -O kibana.zip
RUN unzip kibana.zip -d /usr/share/nginx/www

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

EXPOSE 80
CMD ["/usr/local/bin/run"]
