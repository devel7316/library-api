# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
# Entity Genre

# /genres GET (list_all)
curl -X GET http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;'

# /genres GET (by name)
curl -X GET http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"name":"Mystery-1"}'

# /genres POST (create)
curl -X POST http://localhost:3000/genres -H 'Content-Type: application/json' -d '{"name":"my_data"}'

# /genres PATCH (update) 
curl -X PATCH http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131, "name":"Mystery-1"}'

# /genres DELETE (delete) 
curl -X DELETE http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131}'


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
