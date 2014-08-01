FROM centos:centos6
RUN yum update -y
RUN yum install -y httpd git
RUN cd /opt; git clone https://github.com/elasticsearch/kibana.git
RUN cd /opt/kibana; git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

RUN rm -f /etc/localtime
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime

ADD ./config.js /opt/kibana/src/config.js
ADD ./kibana.conf /etc/httpd/conf.d/kibana.conf
ADD ./setup_configs.sh /opt/kibana/setup_configs.sh
ADD ./run.sh /opt/kibana/run.sh

RUN chmod +x /opt/kibana/*.sh

ENV ES_API_HOST 172.17.42.1
ENV ES_API_PORT 9200

WORKDIR /opt/kibana

EXPOSE 8002
CMD ./setup_configs.sh && ./run.sh

