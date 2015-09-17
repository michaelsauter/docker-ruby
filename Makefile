TAG ?= 2.2.2

build: Dockerfile
	docker build -t michaelsauter/ruby:$(TAG) .
	docker tag -f michaelsauter/ruby:$(TAG) michaelsauter/ruby:latest
