# Paggi Ruby
[![Build Status](https://semaphoreci.com/api/v1/kiik-payment/paggi_ruby/branches/master/badge.svg)](https://semaphoreci.com/kiik-payment/paggi_ruby)


Gem for bindings with Paggi API

Requirements
--------------
* ruby    >= 2.2.3
* httpaty >= 0.13.7

Installation
--------------
### Gem
   `gem install paggi`

### Bundle
```ruby
source 'https://rubygems.org'
gem 'paggi'
```

Tasks
-----
### Configuration

#### Rails Apps

In order to generate config files, run:

```
rails g paggi:install
```

This command will create two files: `config/initializers/paggi.rb` and
`config/paggi.yml`, containing the default settings for the app to run.

#### Non-Rails Apps

It is recommended to create a YAML configuration file and a Ruby initializer file. The initializer must be required inside the main application ruby file.

```yaml
# paggi.yml
development:
  api_key:  payos_test
  host:     http://localhost:4000
  version:  'v4'
staging:
  api_key:  B31DCE74-E768-43ED-86DA-85501612548F
  host:     https://online.paggi.com
  version:  'v4'
production:
  api_key:  B31DCE74-E768-43ED-86DA-85501612548F
  host:     https://online.paggi.com
  version:  'v4'
```

```ruby
# paggi.rb
PAGGI_ENV = ENV['PAGGI_ENV'] || ENV['RAILS_ENV'] || 'development'
PAGGI_CONFIG = YAML.load_file("#{Rails.root}/config/paggi.yml")[PAGGI_ENV]

Paggi.setup do |config|
  config.host = PAGGI_CONFIG['host']
  config.api_key = PAGGI_CONFIG['api_key']
  config.version = PAGGI_CONFIG['version']
end
```

*Important:* Don't forget to change `api_key` to your key.

### Usage

```ruby
#Create customer
customer = Paggi::Customer.create({name: "User name", email: "user@email.com"})
```

### Production

For production env, don't forget to set `PAGGI_ENV` to `production`, that way, our gem will read the `paggi.yml` file correctly.
