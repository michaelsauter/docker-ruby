FROM       michaelsauter/alpine:3.3
MAINTAINER Michael Sauter <mail@michaelsauter.net>

ARG ruby_version=2.2.4-r0
ARG ruby_base=2.2.0

RUN sudo apk-install ruby=$ruby_version \
                     ruby-dev \
                     ruby-bundler; \
    sudo rm -fr /usr/share/ri

RUN sudo chgrp -R default /usr/local/lib/site_ruby; \
    sudo chmod -R g+w /usr/local/lib/site_ruby

COPY files/gemrc /home/default/.gemrc
ENV GEM_HOME /home/default/.gem/ruby/$ruby_base

RUN gem install pry
RUN gem update --system
