build:
	bundle install
	bundle exec rubocop
	bin/rails db:create db:migrate
	bundle exec rspec

upgrade:
	bin/makefile/development-environment-upgrade

pg-stop:
	bin/makefile/pg-stop

pg-start:
	bin/makefile/pg-start
