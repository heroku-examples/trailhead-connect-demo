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

1. [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/heroku/heroku-trailhead-demo)  
This will deploy the app with a Heroku Postgres add-on, create the schema in the database, and seed the database with unit, question, and user data.

-----

## TODO

- [ ] Fix quiz page circles on mobile
- [ ] Check for and fix any other mobile display issues
- [ ] Change image_url sync to photourl to a custom field (formula with IMAGE())
- [ ] Add avatar_image_url as custom field to contact?
- [ ] Show interstitial after quiz submit with quiz result (instead of flash)
- [ ] Create and add badge for each unit
- [ ] Finish writing quiz questions for each unit
- [ ] Add educational material for each unit
- [ ] Customize Salesforce Contact list view, Contact show view (show image_url?), nav bar, and app launcher
- [ ] Add to setup instructions of BRK and README create sfdc dev edition org, create custom fields, create custom objects (unmanaged package?)
- [ ] Add to setup instructions of BRK and README steps to configure Heroku Connect using JSON settings import
- [ ] Add Heroku Connect add on to app.json (check with Maciek if ok)
