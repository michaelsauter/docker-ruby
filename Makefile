TAG ?= 2.2.4
VERSION ?= 2.2.4-r0
BASE ?= 2.2.0

build: Dockerfile
	docker build --build-arg ruby_version=$(VERSION) --build-arg ruby_base=$(BASE) -t michaelsauter/ruby:$(TAG) .
	docker tag -f michaelsauter/ruby:$(TAG) michaelsauter/ruby:latest
