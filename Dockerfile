FROM maven:3-jdk-9
MAINTAINER Kyle Skiven <kskiven@amientertainment.com>

# Set customizable env vars defaults.
# Set Grails version
ENV GRAILS_VERSION 5.3.2


# Install Grails
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH


RUN grails --version
