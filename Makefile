default: test

up: update
	vagrant up
	@echo Boxes created and running

down:
	vagrant destroy -f
	@echo Boxes destroyed

update:
	vagrant box update
	@echo Boxes updated

test:
	rubocop Vagrantfile
	shellcheck *.sh
