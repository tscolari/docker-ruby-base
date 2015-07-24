# RUBY MACHINE
FROM tscolari/base
MAINTAINER Tiago Scolari <tscolari@gmail.com>

RUN echo "deb http://ppa.launchpad.net/brightbox/ruby-ng-experimental/ubuntu  $(lsb_release -sc) main" > /etc/apt/sources.list.d/ruby.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6 && \
    apt-get update && \
    apt-get install -y --force-yes \
      ca-certificates \
      libxslt-dev \
      libxml2-dev \
      libyaml-dev \
      ruby2.2 \
      ruby2.2-dev && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo "---\n:benchmark: false\n:bulk_threshold: 1000\n:backtrace: false\n:verbose: true\ngem: --no-ri --no-rdoc" > ~/.gemrc && \
    /bin/bash -l -c "gem install bundler"
