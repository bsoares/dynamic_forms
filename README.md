[![Code Climate](https://codeclimate.com/github/BSoares/dynamic_forms/badges/gpa.svg)](https://codeclimate.com/github/BSoares/dynamic_forms) [![Test Coverage](https://codeclimate.com/github/BSoares/dynamic_forms/badges/coverage.svg)](https://codeclimate.com/github/BSoares/dynamic_forms/coverage)

# Dynamic Forms

Just an exercise with Rails 4

Build forms dynamically through CRUD interfaces


### Dependencies

* Ruby 2.2.2
* Rails 4.2.1
* PostgreSQL 9.4
* PhantomJS 1.9.8 (used in tests)

```
# Setup PhantomJS 1.9.8 in mac with homebrew
brew install homebrew/versions/phantomjs198
```


### Running the Application

1. Run ```bundle install```
2. Prepare the database with ```rake db:setup```
3. Insert some data ```rake db:seed```
4. And finaly run the server with ```rails s```


### Running Tests

* Just run ```rspec```


### Running Guard with Robocop

* Just run ```bundle exec guard```


### Demo

https://rails4-dynamic-forms.herokuapp.com
