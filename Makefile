.PHONY: README.md

README.md: README.md.m4 mkreadme.sh PortIndex
	m4 $< > $@

PortIndex: */*/Portfile
	portindex

clean:
	rm -rf .cache PortIndex{,.quick}
