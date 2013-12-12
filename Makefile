all: README.md PortIndex

README.md: README.md.m4 mkreadme.sh */*/Portfile
	m4 $< > $@

PortIndex: */*/Portfile
	portindex
