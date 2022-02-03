FROM quay.io/centos7/nodejs-12-centos7:latest
ENV NODE_ENV=production
WORKDIR /app
RUN yum install -y telnet
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]
