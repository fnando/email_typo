# EmailTypo

[![Travis-CI](https://travis-ci.org/fnando/email_typo.svg)](https://travis-ci.org/fnando/email_typo)
[![Code Climate](https://codeclimate.com/github/fnando/email_typo/badges/gpa.svg)](https://codeclimate.com/github/fnando/email_typo)
[![Test Coverage](https://codeclimate.com/github/fnando/email_typo/badges/coverage.svg)](https://codeclimate.com/github/fnando/email_typo/coverage)
[![Gem](https://img.shields.io/gem/v/email_typo.svg)](https://rubygems.org/gems/email_typo)
[![Gem](https://img.shields.io/gem/dt/email_typo.svg)](https://rubygems.org/gems/email_typo)

EmailTypo is a Ruby gem that gives you an easy, tested method that fixes email typos.

As an example: A user with the email "joe@gmail.com" accidentally enters in "joe@gmal.cmo", EmailTypo will fix it automatically.

EmailTypo is concerned with incorrectly-entered data (email provider names, TLDs), not with evaluating whether a particular domain is valid, or whether a particular email address is legitimate. (That is, it's focused on fixing the part that comes after the "@" in the email address.) It works really well for helping you — and your users — when they accidentally type something in wrong.

**NOTE**: This is based on https://github.com/charliepark/fat_fingers, but without polluting the `String` class and with easier extension support.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "email_typo"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_typo

## Usage

To fix any typos, just use `EmailTypo.call(email)`.

```ruby
EmailTypo.call("john.doe@gmail.co")
#=> "john.doe@gmail.com"
```

To add/change the processors, add any object that responds to `#call(email)` to `EmailTypo.default_processors`. The following example adds a processor for `.uol.com.br`, a Brazilian email provider:

```ruby
EmailTypo.default_processors << lambda do |email|
  email.gsub(/@uol\.com(\..*?)?/, "@uol.com.br")
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fnando/email_typo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
