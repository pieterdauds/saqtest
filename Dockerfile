FROM registry.redhat.io/rhscl/nodejs-12-rhel7:latest
WORKDIR /app
USER 0
RUN yum clean all && yum makecache fast && yum install -y telnet java-11-openjdk
USER 1001
COPY ["package.json", "package-lock.json*", "./"]
#RUN npm install --production
RUN npm install
COPY . .
CMD [ "node", "server.js" ]
