FROM registry.redhat.io/rhscl/nodejs-12-rhel7:latest
ENV NODE_ENV=production
WORKDIR /app
USER 0
#RUN curl -sL https://rpm.nodesource.com/setup_12.x | /bin/sh -
RUN yum clean all && yum makecache fast && yum install -y telnet java-11-openjdk
USER 1001
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]
