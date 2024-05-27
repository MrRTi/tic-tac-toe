# Tic Tac Toe

## Setup

Requirements `docker`

```bash
cp .env.template .env
```

Set postgresql password in .env

Build image with

```bash
docker compose build
```

Create database

```bash
docker compose run --rm app bash -c "bundle exec rails db:setup"
```

## Run

Run application
```bash
docker compose up
```

Open [http://localhost:3000](http://localhost:3000) in browser


## Test

```bash
docker compose run --rm app bash -c "RAILS_ENV=test bundle exec rspec"
```
