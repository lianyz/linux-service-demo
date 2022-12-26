.DEFAULT: all

.PHONY: all
all: install


.PHONY: install
install:
	cp test_env_service /usr/local/bin/
	cp test_env_service.service /etc/systemd/system
	mkdir -p /etc/test_env_service
	cp var_file /etc/test_env_service/var_file
	
	systemctl daemon-reload
	systemctl enable test_env_service.service
	systemctl restart test_env_service.service



.PHONY: status
status:
	systemctl status test_env_service.service


.PHONY: journal
journal:
	journalctl -xeu test_env_service
