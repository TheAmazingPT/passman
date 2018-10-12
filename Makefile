all:
	mkdir -p dist && node tools/bundler.js && chmod +x dist/passman
