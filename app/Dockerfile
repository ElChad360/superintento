FROM centos:centos7

MAINTAINER Raul

# Enable EPEL for Node.js
RUN yum install epel-release

# Install Node...
RUN yum install -y nodejs npm

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8585

CMD cd /src && node ./app.js
