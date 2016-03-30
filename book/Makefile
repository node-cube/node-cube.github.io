install:
	@npm install .

release:
	@rm -rf ./book
	@gitbook build
	@git add -A
	@git st


PHONY: release install
