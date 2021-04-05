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

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Postgres locally with asdf

```bash
asdf plugin add postgres
asdf install postgres 13.2
asdf global postgres 13.2
# If you have run bundle you may need to uninstall pg gem
gem uninstall pg
bundle

initdb tmp/postgres -E utf8
PGPORT=5432 pg_ctl -D tmp/postgres -l tmp/postgres/logfile start

bin/rails db:create db:migrate

#To stop
#pg_ctl -D tmp/postgres stop -s -m fast
```
