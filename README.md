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
2. `docker-compose up`
3. Follow Database creation and Database initialization steps above.
4. `bin/rails server`
