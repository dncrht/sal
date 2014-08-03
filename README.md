[![Build Status](https://travis-ci.org/dncrht/sal.svg?branch=master)](https://travis-ci.org/dncrht/sal)

# What is this?

Sal (salt) is something you add to almost every meal. I add sal to my Rails projects.

I found I always add a particular set of helpers, initializers and generators.
Better if they're distributed as a Rails engine.

# Installation

Add to your Rails app Gemfile:
```ruby
gem 'sal-engine'
```
And run `bundle`

# How does it taste?

## messages_bar helper
Will render:
```html
<div class="alert alert-success">anything</div>
```
…if `flash[:notice]` contains anything.

Will render:
```html
 <div class="alert alert-warning">anything</div>
```
…if `flash[:alert]` contains anything.

When providing both, `notice` will prevail.

## menu_item helper
Very handy for navigation menus:
```erb
<%= menu_item 'first' %>First option<% end %>
<%= menu_item 'second', :div %><%= link_to root_path, 'Second option' %><% end %>
```

Renders:
```html
<li class="active">First option<li>
<div><a href="/">Second option</a><div>
```

Parameters:
`menu_item(item, tag)`
- item: item name
- tag: `:li` by default

## errors_bar helper
Will indicate if any model in your form has an error. It supports multiple models
in case you're combining two entities in the same form (i.e. using `fields_for`):
```erb
<%= errors_item @user %>
```

Renders:
```html
 <div class="alert alert-danger">Please correct the highlighted fields.</div>
```

Parameters:
`errors_item(model[, model2…])`
- model: an active record model, or tableless
- model2: you can provide more than one

## Error messages
I like to put the error messages right after the field in the form.
An initializer will patch ActionView::Base to wrap the field with the error message.
Given a model with an error on, let's say, _title_, we'll get:
```html
<div class="has-error">
  <input type="text" name="title">
  <span class="help-block">⤷ Title can't be blank.</span>
</div>
```

## Generators
Rails generators are very useful in the initial stages of development to create your admin interfaces.
In particular:
- I use bootstrap classes for layout
- I don't use the _show_ action/view
- I don't want to autogenerate helper files for every model

To launch this generator:
```bash
bundle exec rails generate scaffold MyModel name:string -p --skip-test-framework
```

# Interesting, but…

It _fits my purposes_, which may be different from yours. You might like the idea
though: then fork it and call it **peppermint**, **curry** or whatever you prefer!
