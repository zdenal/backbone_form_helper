# BackboneFormHelper

This Rails gem provide javascript form helper based on Rails principle like 'f.text_field
:name'. For each helper exist template so you can create your own
template for each of them (eg. /templates/text_field). Now are templates
created in Twitter bootstrap style.

**This is still alpha.**

## Installation

External dependencies:

* underscore.js
* coffee-rails for assets (now js are written in .coffee)

Add this line to your application's Gemfile:

    gem 'backbone_form_helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backbone_form_helper


Add this line into your application.js:

```js
//= require form_helper/form_helper
```

Add this line into your application.scss:

```scss
@import 'form_helper/form_helper';
```

## Helper list
For now:

* label
* text_field
* text_area
* select
* select_tag
* check_box
* date_field

## Usage

    <% form = new FormHelper @task %>
    <%- form.check_box 'is_done', title: 'Is done' %>
    <%- form.date_field 'date', class: 'text_field', placeholder: 'datum' %>
    <%- form.text_area 'description', placeholder: 'ukol' %>
    <%- form.select 'group_id', values: _.map(@groups, (g) -> [g.get('_id'), g.get('name')]) %>
    <%- form.select 'user_id', values: _.map(@users, (g) -> [g.get('_id'), g.get('name')]) %>
        

Value and errors are taken from model automaticly how Rails do it and shown in template (eg. text_field template):

    <input type="text" id="<%= @field_id %>" <%- @unfold_options %> name="<%= @field_name %>" value="<%= @value %>" />
    <span class="help-inline">
    <%= @errors if @errors %>
    </span>

so after render when model has error on name (model.errors['name'] or model.get('errors')['name']) it looks like:

    <input type="text" id="task_name" placeholder="ukol" class="error" name="task[name]" value="">
    <span class="help-inline">
    can't be blank
    </span>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
