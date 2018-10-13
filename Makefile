SHELL := /usr/bin/env bash

check:
	shellcheck -x passman

check-dist:
	shellcheck -x dist/passman

clean:
	[[ ! -d dist ]] || rm -r dist && mkdir -p dist

bundle:
	node tools/bundler.js && chmod +x dist/passman

build: check clean bundle check-dist
