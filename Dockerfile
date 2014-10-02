# RUBY MACHINE
FROM tscolari/builder-base
MAINTAINER Tiago Scolari <tscolari@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN sudo add-apt-repository "deb http://ppa.launchpad.net/brightbox/ruby-ng-experimental/ubuntu  $(lsb_release -sc) main" && \
    sudo apt-get update && \
    sudo apt-get install ruby2.1 ruby2.1-dev -y --force-yes && \
    sudo apt-get clean -y && \
    sudo apt-get autoremove -y && \
    sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "---\n:benchmark: false\n:bulk_threshold: 1000\n:backtrace: false\n:verbose: true\ngem: --no-ri --no-rdoc" > ~/.gemrc && \
    /bin/bash -l -c "gem install bundler"
