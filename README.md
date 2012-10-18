# BackboneFormHelper

This Rails gem provide javascript form helper based on Rails principle like 'f.text_field
:name'. For each helper exist template so you can create your own
template for each of them (eg. /templates/text_field). Now are templates
created in Twitter bootstrap style.

#### This is still alpha.


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

#### new FormHelper(model, options=optional)  
`f = new FormHelper @task` -> take prefix for fields name from class name of model. If task is instance of class Task, then **'f.text_field :name'** will generate name **task[name]**

`f = new FormHelper @task, {name: 'issue'}` -> **'f.text_field :name'** will generate **issue[name]**
#### label(method, text=optional, {html_options=optional})
Return tag of label. If model has error on this method class 'error' will be added.

```rhtml
f.label 'name'
# => <label for="task_name">Name</label>
f.label :name, 'Title'
# => <label for="task_name">Title</label>
f.label :name, {class: 'red bold'}
# => <label for="task_name" class="red bold">Name</label>

```
#### text_field(method, value=optional, html_options={optional})
Return text field with prefilled value from model if value isn't directly defined. Added class 'error' if model has error on method and show errors on method.

```
f.text_field 'name'
# => <input type="text" id="task_name" name="task[name]" value="#{model.name value}" />
# => <span class="help-inline">#{errors on name}</span>

f.text_field 'name', 'John'
# => <input type="text" id="task_name" name="task[name]" value="John" />
# => <span class="help-inline">#{errors on name}</span>

f.text_field 'name', {placeholder: 'name of person', class: 'mandatory'}
# => <input type="text" id="task_name" name="task[name]" placeholder="name of person" class="mandatory"/>
# => <span class="help-inline">#{errors on name}</span>
```
#### text_area(method, value=optional, html_options={optional})

Same as text_field but with textarea tag.
#### select(method, options, html_options={optional})
Return select tag with set options and selected option by value of method on model if value isn't set directly.

```
f.select 'group_id', {values: _.map(@groups, (g) -> [g.get('_id'), g.get('name')])}, {class: 'mandatory'}
# => <select id="task_group_id" name="task[group_id]" class="mandatory">#{generated options}</option>

f.select 'group_id', {values: _.map(@groups, (g) -> [g.get('_id'), g.get('name')]), value: '12'}
# => return select tag with selected option with value '12'
```
#### select_tag
Similar as 'select', but is not relate to model (like in RoR)

```
f.select_tag 'only_group_id', {values: _.map(@groups, (g) -> [g.get('_id'), g.get('name')]), value: '12'}
# => <select id="only_group_id" name="only_group_id" class="mandatory">#{generated options}</option>
```
#### check_box(method, value=optional, html_options={optional})

```
f.check_box 'is_done'
# =><label class="checkbox">
  <input id="task_is_done" name="task[is_done]" type="hidden" value="false">
  <input id="task_is_done" name="task[is_done]" type="checkbox"
    value="true" #{'checked' if method of model is 1 or true}>
</label>

f.check_box 'is_done', {title: 'Tick this for done'}
# =><label class="checkbox">
  <input id="task_is_done" name="task[is_done]" type="hidden" value="false">
  <input id="task_is_done" name="task[is_done]" type="checkbox"
    value="true" #{'checked' if method of model is 1 or true}>
  Tick this for done
</label>
```
#### date_field
Return bootstrap-datepicker date field (see on [http://www.eyecon.ro/bootstrap-datepicker](http://))

```
f.date_field 'date', class: 'text_field', placeholder: 'date'
```

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

