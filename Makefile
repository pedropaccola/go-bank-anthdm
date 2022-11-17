build:
	@go build -o bin/gobank

dbrun:
	@docker run --name some-postgres -e POSTGRES_PASSWORD=gobank -p 5432:5432 -d postgres

dbstop:
	@docker stop some-postgres && docker rm some-postgres

run: build
	@./bin/gobank
	@export JWT_SECRET=testforthisfileenv

test:
	@go test -v ./...
