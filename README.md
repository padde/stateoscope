# Stateoscope

[![Build Status](https://travis-ci.org/padde/stateoscope.svg)](https://travis-ci.org/padde/stateoscope)
[![Code Climate](https://codeclimate.com/github/padde/stateoscope/badges/gpa.svg)](https://codeclimate.com/github/padde/stateoscope)
[![Test Coverage](https://codeclimate.com/github/padde/stateoscope/badges/coverage.svg)](https://codeclimate.com/github/padde/stateoscope/coverage)
[![Inline docs](http://inch-ci.org/github/padde/stateoscope.svg?branch=master)](http://inch-ci.org/github/padde/stateoscope)
[![Gem Version](https://badge.fury.io/rb/stateoscope.svg)](https://badge.fury.io/rb/stateoscope)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/gems/stateoscope)

Visualize State Machines using GraphViz

## External Dependencies

Stateoscope depends on [GraphViz](http://www.graphviz.org/) for generating the
graphs. You need to make sure that GraphViz is properly installed on your system
before you will be able to generate graphs. If you are on a Mac, you can install
GraphViz via [Homebrew](http://brew.sh/)

```
$ brew install graphviz
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stateoscope', '~> 0.1.2', group: :development
```

And then execute:

    $ bundle

## Using the rake task

To generate a state machine visualization for your `Model`, run

```ruby
rake 'stateoscope:visualize[Model]'
```

If you have multiple state machines defined on your model, you can pass the name
of the state machine as second parameter

```ruby
rake 'stateoscope:visualize[Model,specific_state_machine]'
```

If you want to highlight a specific state of your state machine, add the name as a third argument.

```ruby
rake 'stateoscope:visualize[Order,order_state,delivered]'
```

In any case, a PDF file containing the graph visualization will be saved to
the current directory.

## Using Stateoscope directly

Stateoscope exposes a `visualize` method that allows for a more fine-grained and dynamic usage.

Example:

```ruby
filename = Stateoscope.visualize(
  Order,
  state_machine_name: "order_state",
  current_state: "delivered",
  dir: Rails.root.join("public"), # default current directory
  format: "png" # default "pdf", possible are all formats that GraphViz supports
)

# filename will be for example RAILS_ROOT/public/order_state-20191201145422.png
```

## Adapters

Stateoscope ships with adapters for the following state machine gems:

- [AASM](https://github.com/aasm/aasm)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/padde/stateoscope.
