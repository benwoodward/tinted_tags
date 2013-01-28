# TintedTags

This plugin is to be used with
[acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on).
TintedTags allows you to create a tag cloud where tag popularity is
illustrated with colour.
It achieves this by adding a :tint attribute to the Tag model, and allows you to calculate
a colour (in the form of a hex code) for each tag based on its
popularity. These hex codes are added to the tags in the view via
inline-css.

Tags are updated via an ```after_save``` filter on a TintedTags object.

## Installation

### Rails 3.x

To use it, add it to your Gemfile:

```ruby
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'tinted_tags'
```

#### Post Installation

```shell
rails generate tinted_tags:migration
rake db:migrate
```

## Usage

### Model

```ruby
acts_as_taggable_on
tinted_tags
```

### Controller

```ruby
@tags = Post.tag_counts_on(:tags).order('count desc')
```

### Views

```ruby
tinted_tag_cloud
```
returns ..

```html
<ul class="tinted-tag-cloud">
  <li style="background-color: #ffffff">one</li>
  <li style="background-color: #7f7f7f">two</li>
</ul>
```

## Author

* [Ben Woodward](https://github.com/benwoodward)

Copyright (c) Ben Woodward (http://benw.me/)
Copyright Released under the [MIT
license](https://github.com/benwoodward/tinted_tags/blob/master/MIT-LICENSE.md)
