# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version

Ruby 2.5.0

## System dependencies

## Configuration

## Database creation

```
bin/rails db:setup
```

## Database initialization

```
bin/rails db:migrate
bin/rails db:seed
```

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

PostgreSQL is the only external service this app uses. See below for dev setup of PostgreSQL using Docker.

## Deployment instructions

### Development Setup

Docker is required for dev setup. It's easy to install [from here](https://www.docker.com/community-edition#/download). It is used to run PostgreSQL. So if you have PostgreSQL installed locally, you'll need to stop the service.

1. Clone the repo and `cd` into the directory.
1. Install all dependencies with `bundle install --path=vendor/bundle --binstubs=bin/bundle`.
1. Get PostgreSQL running with `docker-compose up` (you can use `docker-compose up -d` to run in the background, but don't forget to run `docker-compose down` to stop it when you're done.).
1. Follow Database creation and Database initialization steps above.
1. `bin/rails server`

### Production Setup

1. [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)  
This will deploy the app with a Heroku Postgres add-on, create the schema in the database, and seed the database with unit, question, and user data.
