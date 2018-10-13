SHELL := /usr/bin/env bash

check:
	cd src && shellcheck -ax passman

check-dist:
	shellcheck dist/passman

clean:
	[[ ! -d dist ]] || rm -r dist && mkdir -p dist

bundle:
	node tools/bundler.js && chmod +x dist/passman

test:
	cd src && bash passman

build: check clean bundle check-dist
