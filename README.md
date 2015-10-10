# Stateoscope

[![Build Status](https://travis-ci.org/padde/stateoscope.svg)](https://travis-ci.org/padde/stateoscope)
[![Code Climate](https://codeclimate.com/github/padde/stateoscope/badges/gpa.svg)](https://codeclimate.com/github/padde/stateoscope)
[![Test Coverage](https://codeclimate.com/github/padde/stateoscope/badges/coverage.svg)](https://codeclimate.com/github/padde/stateoscope/coverage)
[![Inline docs](http://inch-ci.org/github/padde/stateoscope.svg?branch=master)](http://inch-ci.org/github/padde/stateoscope)

Visualize State Machines using GraphViz

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stateoscope', group: :development
```

And then execute:

    $ bundle

## Usage

To generate a state machine visualization for your `Model`, run

```ruby
rake 'stateoscope:visualize[Model]'
```

If you have multiple state machines defined on your model, you can pass the name
of the state machine as second parameter

```ruby
rake 'stateoscope:visualize[Model,specific_state_machine]'
```

In both cases, a PDF file containing the graph visualization will be saved to
the current directory.

## Integrations

Stateoscope is currently integrated with the following state machine gems:

* [AASM](https://github.com/aasm/aasm)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/padde/stateoscope.

