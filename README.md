# Virtus::ROM

This gem will allow you to use Virtus to define ROM (Ruby Object Mapper) model attributes.
It will also automatically map the model objects for you.


## Installation

Add this line to your application's Gemfile:

    gem 'virtus-rom'

And then execute:

    $ bundle


## Usage

To use Virtus::ROM, you'll need to first define the ROM repository.
We'd recommend that you do this in your configuration setup (i.e. a Rails initializer):

```ruby
env = ROM::Environment.setup(default: 'memory://test')
```

Then simply add `include Virtus::ROM.model` to your model class, and define the model attributes using Virtus.
For example:

```ruby
class User
  include Virtus::ROM.model

  attribute :name, String, from: :first_name
  attribute :age, Integer, required: false
end
```

Virtus::ROM will use the `default` repository by default, but you can override with a `repository` option:

```ruby
env = ROM::Environment.setup(pg: 'postgres://localhost/pg')

class User
  include Virtus::ROM.model(repository: :pg)

  attribute :name, String, from: :first_name
  attribute :age, Integer, required: false
end
```

By default, Virtus::ROM will use a table within the repository with the pluralized/underscored name of the class.
This can be overridden with a `table` or `relation` directive (they're equivalent):

```ruby
class User
  include Virtus::ROM.model(table: :all_users)

  attribute :name, String, from: :first_name
  attribute :age, Integer, required: false
end
```

Once you've defined your model, a ROM mapping will be created for you, and you can then use ROM as you normally would:

```ruby
env = ROM::Environment.setup(default: 'memory://test')

class User
  include Virtus::ROM.model

  attribute :name, String, from: :first_name
  attribute :age, Integer, required: false
end

env[:users].save(User.new(name: 'Craig'))
craig = env[:users].restrict(name: 'Craig').one
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make sure the tests pass (`rspec` or `rake spec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
