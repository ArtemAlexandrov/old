# Smartcore

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/smartcore`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smartcore'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smartcore

## Usage

```ruby
client = Smartcore::Client.new(login: 'login', password: 'password')
client.user_profile_sign_in(profile_email, profile_password)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/smartcore. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

