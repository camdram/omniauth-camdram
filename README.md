# Camdram's Omniauth strategy

This is the official Ruby OmniAuth strategy for authenticating to [Camdram](https://www.camdram.net).

Before you can start developing your API client for Camdram, you need to [create an application](https://www.camdram.net/api/apps/new) and copy the application ID and secret key.

## Installation

Add the strategy to your `Gemfile`:

```ruby
gem 'omniauth-camdram'
```

And then run `bundle install`.

## Usage

You can integrate the strategy into your middleware in a `config.ru`:

```ruby
use OmniAuth::Builder do
  provider :camdram, ENV['CAMDRAM_APP_ID'], ENV['CAMDRAM_APP_SECRET'], scope: "user_shows user_orgs user_email write write_org"
end
```

If you're using Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :camdram, ENV['CAMDRAM_APP_ID'], ENV['CAMDRAM_APP_SECRET'], scope: "user_shows user_orgs user_email write write_org"
end
```

You can see a description of the different types of scope on the [Camdram repository](https://github.com/camdram/camdram/blob/master/src/Acts/CamdramApiBundle/Resources/views/Authorize/authorize.html.twig).

For additional information, please refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

See the [example](https://github.com/camdram/omniauth-camdram/blob/master/examples/sinatra/config.ru) Sinatra app for full examples.

---

### Copyright

The code in this Git repository is released under the [MIT License](https://en.wikipedia.org/wiki/MIT_License).

Copyright (c) 2018-2019 Members of the Camdram Web Team and other contributors.
