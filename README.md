# Cloudat [![Build Status](https://secure.travis-ci.org/zl4bv/cloudat.svg?branch=master)](http://travis-ci.org/zl4bv/cloudat)

Run cloud infrastructure actions on a schedule

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudat

## Usage

Create a _plan_ to perform an action now:

```ruby
# plan.rb
provider 'aws'

start instance 'i-abcd1234'
```

Now run it:

```bash
cloudat plan.rb
```

Schedule an action for later:

```ruby
# plan.rb
provider 'aws'

every '1d' do
  stop instance 'i-abcd1234'
  start instance 'i-abcd1234'
end

scheduler.join
```

Scheduling is provided by [rufus-scheduler](https://github.com/jmettraux/rufus-scheduler).

Note: `scheduler.join` must be called at the end of a plan for scheduled
actions to run. This requirement will be removed when a proper daemon support
is introduced.

## Contributing

1. Fork it ( https://github.com/zl4bv/cloudat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
