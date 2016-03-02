release:
	@gitbook build
	@git add -A
	@git st

PHONY: release
