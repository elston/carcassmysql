all:
	@echo "Hello $(LOGNAME), nothing to do by default"

# ========= bootstrap ==============
bootstrap_storage:
	@../../images/storage/bootstrap.sh	

bootstrap_mediatry:
	@docker-compose \
		-p carcassmysql \
		-f build.yml \
		run --rm mediatry /usr/local/bin/bootstrap.sh

bootstrap:
	@echo "---> bootstrap storage"
	@make bootstrap_storage
	@echo "---> bootstrap mediatry"	
	@make bootstrap_mediatry

# ==================================
rebuild:
	@docker-compose \
		-p carcassmysql \
		-f build.yml \
		build --force-rm mediatry

build:
	@docker-compose \
		-p carcassmysql \
		-f build.yml \
		build

clear:
	@../../scripts/clear_untagged.sh

# =====================================
db:
	@docker-compose \
		-p carcassmysql \
		-f db.yml \
		up -d --no-build --no-recreate
shell:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		run --rm mediatry /bin/bash

devserv:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		run --rm mediatry /usr/local/bin/runserv.sh

log:
	@docker logs -f carcassmysql_mediatry_1

# ======================================
down:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		down	

ps:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		ps

up:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		up -d --no-build --no-recreate

migrate:
	@docker-compose \
		-p carcassmysql \
		-f run.yml \
		run --rm mediatry /usr/local/bin/migrate.sh
	@make down		

restart:
	@make down
	@make up

.PHONY: clear build down ps up restart
	bootstrap_storage 
	bootstrap_mediatry 
	rebuild_mediatry shell_mediatry 
	devserv_mediatry log_mediatry

