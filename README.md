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
#
# Entity Genre
# 
# /genres GET #index [] (count)
curl -X GET http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;'

# /genres GET #show [name] (by name)
curl -X GET http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"name":"Mystery-1"}'

# /genres POST #create [name] (create)
curl -X POST http://localhost:3000/genres -H 'Content-Type: application/json' -d '{"name":"my_data"}'

# /genres PATCH #update (update) 
curl -X PATCH http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131, "name":"Mystery-1"}'

# /genres PUT #update (update) 
curl -X PUT http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131, "name":"Mystery-1"}'

# /genres DELETE (destroy) 
curl -X DELETE http://localhost:3000/genres -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131}'
#
# Entity Writer
# -------------------------------------------------------------------------
# 
# /writers GET #index [] (count)
curl -X GET http://localhost:3000/writers -H 'Content-Type: application/json; Accept: application/json;'

# /writers GET #show [writer](by name)
curl -X GET http://localhost:3000/writers -H 'Content-Type: application/json; Accept: application/json;' -d '{"name":"Mystery-1"}'

# /writers POST #create (create)
curl -X POST http://localhost:3000/writers -H 'Content-Type: application/json' -d '{"name":"my_data"}'

# /genres PATCH #update (update) 
curl -X PATCH http://localhost:3000/writers -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":-99, "name":"NOT Exists onto db"}'

# /writers DELETE (destroy) 
curl -X DELETE http://localhost:3000/writers -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131}'
#
# Entity Client
# -------------------------------------------------------------------------
# 
# /writers GET #index [] (count)
curl -X GET http://localhost:3000/clients -H 'Content-Type: application/json; Accept: application/json;'

# /clients GET #show [client](by name)
curl -X GET http://localhost:3000/clients -H 'Content-Type: application/json; Accept: application/json;' -d '{"name":"Nonono"}'

# /clients POST #create (create)
curl -X POST http://localhost:3000/clients -H 'Content-Type: application/json' -d '{"name":"my_data"}'

# /clients PATCH #update (update) 
curl -X PATCH http://localhost:3000/clients -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":-99, "name":"NOT Exists onto db"}'

# /clients DELETE (destroy) 
curl -X DELETE http://localhost:3000/clients -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":131}'
#
# Entity Book
# -------------------------------------------------------------------------
# 
# /books GET #index [] (count)
curl -X GET http://localhost:3000/books -H 'Content-Type: application/json; Accept: application/json;'

# /books GET #show 
# --- NOT found (not valid id)
curl -X GET http://localhost:3000/books/-666 -H 'Content-Type: application/json; Accept: application/json;'

# /books GET #show 
# --- provide a valid id so as to return OK
curl -X GET http://localhost:3000/books/XXX -H 'Content-Type: application/json; Accept: application/json;'

# /books POST #create (create)
# --- invalid data
curl -X POST http://localhost:3000/books -H 'Content-Type: application/json' -d '{"title":"my_data"}'

# /books POST #create (create)
# --- valid data
curl -X POST http://localhost:3000/books -H 'Content-Type: application/json' -d '{"title":"My own story as it is", "writer_id": 4, "genre_id": 9, "acquisition_date": "2023/10/10 10:10:10", "quantity": 100}'

# /books PATCH #update (update) 
# --- NOT found (not valid id)
curl -X PATCH http://localhost:3000/books -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":-666, "quantity":200}'

# /books PATCH #update (update) 
# --- provide a valid id so as to return OK
curl -X PATCH http://localhost:3000/books -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":21, "quantity":200}'

# /books DELETE (destroy) 
# --- NOT found (not valid id)
curl -X DELETE http://localhost:3000/books -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":-666}'

# /books DELETE (destroy) 
# --- provide a valid id so as to return OK
curl -X DELETE http://localhost:3000/books -H 'Content-Type: application/json; Accept: application/json;' -d '{"id":21}'

# -------------------------------------------------------------------------
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
