VERSION=0.022

all::
	@echo "make install" 

install:	index.cgi fixperm
	sudo cp init-d-lxcweb /etc/init.d/lxcweb
	sudo chmod +x /etc/init.d/lxcweb
	sudo update-rc.d lxcweb defaults
	sudo cp lxcfarm /usr/local/bin/

index.cgi:	index.c
	sudo rm -f cache/*
	gcc -o index.cgi index.c

fixperm::
	sudo chown root:root index.cgi
	sudo chmod 4755 index.cgi
	sudo chmod a+rwx cache

dist::
	sudo rm -f index.cgi
	cd ..; tar cfz Backup/lxcweb-${VERSION}.tar.gz LXCWeb/

backup::
	scp ../Backup/lxcweb-${VERSION}.tar.gz the-labs.com:Backup/

github::
	git remote set-url origin git@github.com:Spiritdude/LXCWeb.git
	git push -u origin master

edit::
	dee4 lxcweb lxcfarm extra/css/default.css init-d-lxcweb Makefile INSTALL README
		
