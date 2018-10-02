PHONY: init plan apply all

init:
	cd basic_webserver;terraform init
plan:
	cd basic_webserver;terraform plan
apply:
	cd basic_webserver;terrafrom apply
all: init plan apply
