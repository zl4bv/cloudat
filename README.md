# Cloudat

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

Create a _plan_ file using the basic DSL that looks like this:

```ruby
# plan.rb
provider 'aws'

at '6 PM' do
  start instance 'i-abcd1234'
end
```

Run the plan:

```bash
cloudat plan.rb
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cloudat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

