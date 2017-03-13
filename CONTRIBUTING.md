## Contributor's Guide

### Development

Check-out the repository:

```` sh
git clone git@github.com:data-creative/law-school-outcomes-ruby.git
cd law-school-outcomes-ruby/
````

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Testing

Run tests:

```` sh
bundle exec rspec spec/
````

To install this gem onto your local machine, run `bundle exec rake install`.

### Releasing

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Code of Conduct

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
