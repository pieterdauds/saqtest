FROM quay.io/centos7/nodejs-12-centos7:latest
ENV NODE_ENV=production
WORKDIR /app
USER 0
RUN yum install -y telnet
USER 1001
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]
