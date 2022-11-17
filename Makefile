build:
	@go build -o bin/gobank

db:
	@docker run --name some-postgres -e POSTGRES_PASSWORD=webapp -p 5432:5432 -d postgres

dbstop:
	@docker stop some-postgres
	@docker rm some-postgres

run: build
	@./bin/gobank

test:
	@go test -v ./...
