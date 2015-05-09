all: PortIndex README.md

README.md: README.md.m4 mkreadme.sh PortIndex */*/Portfile
	m4 $< > $@

PortIndex: */*/Portfile
	portindex

clean:
	rm -rf .cache PortIndex{,.quick}
