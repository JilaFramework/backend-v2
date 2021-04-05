build:
	bundle install
	bundle exec rubocop
	bin/rails db:create db:migrate
	bundle exec rspec
