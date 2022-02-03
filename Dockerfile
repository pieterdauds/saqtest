FROM registry.access.redhat.com/rhel7/rhel:7.3-53
ENV NODE_ENV=production
WORKDIR /app
USER 0
RUN curl -sL https://rpm.nodesource.com/setup_12.x | /bin/sh - ;\
    yum install -y telnet nodejs
USER 1001
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]
