install:
	@npm install .

release:
	@rm -rf ./book
	@gitbook build .
	@mv ./_book ./book


PHONY: release install
