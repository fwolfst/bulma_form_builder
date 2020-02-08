# BulmaFormBuilder

Pretty unpolished FormBuilder to use in Rails with the [Bulma CSS Framework](https://bulma.io).

## Usage

Create horizontal forms
```ruby
form_for @myobject, builder: BulmaFormBuilder::HorizontalBulmaFormBuilder do |f|
   = f.errors
 
   = f.labeled_text_field :title, placeholder: 'Enter Title', help_text: 'Remember to have a snappy title', icon: 'fa-star'

```

### Alternative way

```ruby
form_for @myobject, builder: BulmaFormBuilder::FormBuilder do |f|
   = f.errors
#...
```

Adds respective classes automatically for following helpers:

| helper | added CSS class | additional options|
|--|--|--|
| `form.label`      | `label` | |
| `form.text_field` | `input` | `text_field :field, help: 'small help text'` <br/> `text_field :field, icon_left: 'fa fa-ethernet'`|
| `form.check_box` | `checkbox` | `check_box :field, label: 'label to the right'` |
| `form.text_area` | `input textarea` | |
 

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'bulma_form_builder'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bulma_form_builder
```

Use SCSS and add to your `app/assets/stylesheets/application.scss`
```
@import "bulma-form-builder";
```

In order to **not** wrap fields with errors in a form in an additional div (with CSS class `field_with_errors`), which breaks markup of more complex input fields, you need to configure ActionView as follows.

```ruby
# config/application.rb

# ...
  class Application < Rails::Application
    # ...
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      #%Q(<div class="field_with_errors">#{html_tag}</div>).html_safe
      html_tag.gsub(/class="/, "class=\"field_with_errors ").html_safe
    end
    # ...
```

## Contributing
Just drop me a line.

## License
Copyright 2019 Felix Wolfsteller
The gem is available as open source under the terms of the [GPLv3 License, or any later version](https://opensource.org/licenses/GPL-3.0), which is also found in the `LICENSE` file of this repository.
