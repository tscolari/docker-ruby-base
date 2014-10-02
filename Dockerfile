# RUBY MACHINE
FROM tscolari/builder-base
MAINTAINER Tiago Scolari <tscolari@gmail.com>

RUN add-apt-repository "deb http://ppa.launchpad.net/brightbox/ruby-ng-experimental/ubuntu  $(lsb_release -sc) main" && \
    apt-get update && \
    apt-get install ruby2.1 ruby2.1-dev -y --force-yes && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo "---\n:benchmark: false\n:bulk_threshold: 1000\n:backtrace: false\n:verbose: true\ngem: --no-ri --no-rdoc" > ~/.gemrc && \
    /bin/bash -l -c "gem install bundler"
