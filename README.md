# README

##Everlywell Challenge by Quang Le

Heroku URL: [https://everlywell.herokuapp.com/](https://everlywell.herokuapp.com/) (sorry about that taking that domain ...)

###Timeline

- start time: 16:45pm Jan 27, 2018
- dinner and shower break: 18:45pm Jan 27, 2018
- continue work again: 20:55pm Jan 27, 2018
- finish heading search: 22:17pm Jan 27, 2018
- finish connection visual between expert and searcher: 22:52pm Jan 27, 2018 (all major functionalities complete, ~3 hours 57 minutes from start time)
- snack break (again): 22:53pm Jan 27, 2018
- continue polish work and add README.md: 23:10pm Jan 27, 2018
- finish README.md: 00:30am Jan 28, 2018

###Self remarks

- too much time spent on setting up rspec and related gems (~25 minutes)
- did not follow through with writing Rspec for project (realized halfway that Rspec takes too much time)
- rather long first break (18:45pm Jan 27, 2018 - 20:55pm Jan 27, 2018)
- no CSS and horrendous UI
- used `rails new` to initiate project and and used `rails g migration` to create migration files (no other scaffold command used)
- connection path between searcher and expert is only through common friend(s)

## Setup instructions

### Clone the project
suppose you have setup SSH:

```
git clone git@github.com:quangle/everlywell_challenge.git
```

### Install Ruby
use rvm to install Ruby 2.3.1:

```
rvm get head
rvm install ruby-2.3.1
```

create and use a "rails5" gemset:

```
rvm use ruby-2.3.1@rails5.0.0.1 --create

```

create `.rvmrc` file in the project folder with content:

```
rvm use ruby-2.3.1@rails5.0.0.1
```

### Bundle install
```
bundle install
```

### Setup database
you may need to config the database.yml to fit your local security and user name. Otherwise, run:

```
rake db:create
rake db:migrate
rake db:seed
```

### Starting localhost server
run under port 3000:

```
rails s -p 3000
```

### Run test
prepare the test database:

```
rake db:test:prepare
```

then:

```
rspec
```

