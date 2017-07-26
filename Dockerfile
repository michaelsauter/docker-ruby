FROM       michaelsauter/ubuntu:16.04
MAINTAINER Michael Sauter <mail@michaelsauter.net>

RUN sudo apt-get install -y git \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev \
    libbz2-dev

RUN cd /tmp;                                \
    curl -LO https://github.com/sstephenson/ruby-build/archive/v20170523.tar.gz; \
    sudo chown default: *.tar.gz;           \
    tar xvzf *.tar.gz; rm -f *.tar.gz;      \
    cd ruby-build*;                         \
    ./bin/ruby-build 2.4.1 /usr/local; \
    cd; rm -rf /tmp/ruby-build*

RUN gem install bundler --no-rdoc --no-ri
RUN gem install pry --no-rdoc --no-ri

RUN gem update --system --no-document

ENV PATH .bundle/bin:$PATH
