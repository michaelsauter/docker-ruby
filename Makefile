TAG ?= 2.4.1

build: Dockerfile
	docker build -t michaelsauter/ruby:$(TAG) .
	docker tag michaelsauter/ruby:$(TAG) michaelsauter/ruby:latest
