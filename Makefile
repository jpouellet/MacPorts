all: README.md PortIndex

README.md: README.md.m4 */*/Portfile
	m4 $< > $@

PortIndex: */*/Portfile
	portindex
