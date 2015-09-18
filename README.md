# Itamae::Plugin::Recipe::Nodebrew

Installs nodebrew.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-nodebrew'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-nodebrew

## Usage

### install for single user

```ruby
include_recipe 'nodebrew::user'
```

### install for system

```ruby
include_recipe 'nodebrew::system'
```

### node.json

```json
{
  "nodebrew": {
    "versions": {
      "io@v3.3.0": [
        {
          "name": "coffee-script",
          "version": "1.9.3"
        }
      ],
      "v4.0.0": [
        "gulp"
      ]
    },
    "use": "v4.0.0"
  }
}
```

## Contributing

1. Fork it ( https://github.com/toihrk/itamae-plugin-recipe-nodebrew/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Special Thanks

[rutan/itamae-plugin-recipe-rtn_rbenv](https://github.com/rutan/itamae-plugin-recipe-rtn_rbenv)