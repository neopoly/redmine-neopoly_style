[github]: https://github.com/neopoly/redmine-neopoly_style
[doc]: http://rubydoc.info/github/neopoly/redmine-neopoly_style/master/file/README.md
[gem]: https://rubygems.org/gems/redmine-neopoly_style
[gem-badge]: https://img.shields.io/gem/v/redmine-neopoly_style.svg
[inchpages]: https://inch-ci.org/github/neopoly/redmine-neopoly_style
[inchpages-badge]: https://inch-ci.org/github/neopoly/redmine-neopoly_style.svg?branch=master&style=flat

# redmine-neopoly_style

[![Gem Version][gem-badge]][gem]
[![Inline docs][inchpages-badge]][inchpages]

[Gem][gem] |
[Source][github] |
[Documentation][doc]

Custom style overrides for Redmine

## Installation

Ensure you have a `Gemfile.local` file in your Redmine installation. Add to your `Gemfile.local`:

```ruby
gem "redmine-neopoly_style"
```

And then execute:

```
$ bundle
```

Restart the Redmine application

## Usage

No further steps needed

## Development

As Redmine currently doesn't support the [Sprockets asset pipeline](http://guides.rubyonrails.org/asset_pipeline.html) we're precompiling the needed assets using a custom build task:

```
rake assets:build
```

### CSS (Sass)

The SASS files for generating the static CSS are located in `lib/assets/stylesheets`. You can only build the stylesheets using a dedicated Rake task:

```
rake assets:build:stylesheets
```

## TODO

* Cleanup the SASS files

## Contributing

1. Fork it ( https://github.com/neopoly/redmine-neopoly_style/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
