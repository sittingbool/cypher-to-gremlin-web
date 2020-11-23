# Azure Cypher to Gremlin

A very simple web interface to convert cypher queries to gremlin for Azure CosmosDB dialect

## How to run

`mvn jetty:run`

## How to Dockerize

Build it with `docker build -t cypher-gremlin-translator .` and run with
` docker run -p 8080:8080 -it cypher-gremlin-translator`.

## Contribute

Contribution welcome to maintain and extend this!

## Licence

MIT

Have fun with it! Never deploy on fridays!
