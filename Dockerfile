FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y wget ca-certificates

# Install pip
RUN cd /tmp; wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py;\
 python get-pip.py; rm get-pip.py;

#
wget -O - https://download.newrelic.com/548C16BF.gpg | apt-key add - && \echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list

# add flower
RUN pip install redis flower newrelic
