FROM quay.io/generic/rhel7:latest
ENV NODE_ENV=production
WORKDIR /app
USER 0
RUN curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash - \
    yum install -y telnet nodejs
USER 1001
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]
