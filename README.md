# BulmaFormBuilder

Pretty unpolished FormBuilder to use in Rails with the [Bulma CSS Framework](https://bulma.io) (version 0.8.0).

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

## Demo

Unfortunately, there are no automatic tests implemented (contributions welcome).
However there is a tiny rails application (the one you'd use for this kind of engine tests) in [test/dummy](test/dummy).

You can run the demo by changing into that directory and firing up the server:

```bash
cd test/dummy
rails s
```

Note that the assets (bulma, Font Awesome) are not included in the demo, but are fetched via a CDN.  If you can walk this gem the extra mile to use gems to host these assets locally when starting the test/demo-server please tell me.

## Usage

**Currently there are two approaches: a custom FormBuilder with 'non-standard' methods and a FormBuilder with just the default methods (but sometimes some extra parameters).  I plan to abandon the first one.**

### Horizontal Forms BulmaFormBuilder::HorizontalBulmaFormBuilder

**This FormBuilder implements methods not found in FormBuilder (like `labeled_text_field`) and somewhat expects you to use these.  I'd like to transition to the other (cleaner) approach in the longer run.**

Create horizontal forms
```ruby
form_for @myobject, builder: BulmaFormBuilder::HorizontalBulmaFormBuilder do |f|
   = f.errors
 
   = f.labeled_text_field :title, placeholder: 'Enter Title', help_text: 'Remember to have a snappy title', icon: 'fa-star'

```

### Alternative: BulmaFormBuilder::FormBuilder

**This FormBuilder implements some of the methods found in FormBuilder (like `text_field`) and adds the relevant bulma classes and markup.**

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
| `form.number_field` | `input` | `number_field :field, help: 'small help text'`|
 


## Contributing
Welcome, of course! Just drop me a line.

## License
Copyright 2019,2020 Felix Wolfsteller

The own ruby code is available as open source under the terms of the [GPLv3 License, or any later version](https://opensource.org/licenses/GPL-3.0), which is also found in the `LICENSE` file of this repository.
Note that the repository might contain boilderplate and assets to which different licenses apply.
