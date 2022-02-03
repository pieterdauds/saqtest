FROM registry.redhat.io/rhscl/nodejs-12-rhel7

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
RUN mkdir /saqb
COPY test.txt /saqb/test.txt
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
