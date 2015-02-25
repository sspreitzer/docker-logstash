FROM ubuntu:trusty

ENV VERSION 1.4.2-1-2c0f5a1

RUN apt-get update && apt-get install -y wget openjdk-7-jre-headless
RUN wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_${VERSION}_all.deb
RUN dpkg -i /logstash_${VERSION}_all.deb && rm /logstash_${VERSION}_all.deb
RUN apt-get clean

ADD entrypoint.sh /usr/local/sbin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["logstash"]

VOLUME /etc/logstash/conf.d

