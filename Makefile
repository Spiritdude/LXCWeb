VERSION=0.017

all::
	@echo "make install"

install:	index.cgi fixperm
	sudo cp init-d-lxcweb /etc/init.d/lxcweb
	sudo chmod +x /etc/init.d/lxcweb
	sudo update-rc.d lxcweb defaults

index.cgi:	index.c
	sudo rm -f cache/*
	gcc -o index.cgi index.c

fixperm::
	sudo chown root:root index.cgi
	sudo chmod 4755 index.cgi
	sudo chmod a+rwx cache

dist::
	sudo rm -f index.cgi
	cd ..; tar cfz lxcweb-${VERSION}.tar.gz LXCWeb/

backup::
	scp ../lxcweb-${VERSION}.tar.gz the-labs.com:Backup/

github::
		
