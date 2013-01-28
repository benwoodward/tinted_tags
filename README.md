# TintedTags

This plugin is to be used with
[acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on).
TintedTags allows you to create a tag cloud where tag popularity is
illustrated with colour.
It achieves this by adding a :tint attribute to the Tag model, and allows you to calculate
a colour (in the form of a hex code) for each tag based on its
popularity. These hex codes are added to the tags in the view via
inline-css.

## Installation

### Rails 3.x

To use it, add it to your Gemfile:

```ruby
gem 'tinted_tags'
```

#### Post Installation

```shell
rails generate tinted_tags:migration
rake db:migrate
```

## Author

* [Ben Woodward](https://github.com/benwoodward)

Copyright (c) Ben Woodward (http://benw.me/)
Copyright Released under the [MIT
license](https://github.com/benwoodward/tinted_tags/blob/master/MIT-LICENSE.md)
