up:
	docker-compose down
	docker-compose up
down:
	docker-compose down
connect:
	docker-compose exec php bash
initdb:
	docker-compose exec php bash -c "php artisan migrate:fresh --seed"
rebuild:
	rm -rf docker/database/data/*
	docker-compose build --no-cache
	docker-compose up