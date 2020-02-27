# BulmaFormBuilder

Pretty unpolished FormBuilder to use in Rails with the [Bulma CSS Framework](https://bulma.io) (version 0.8.0).

Note that there are two different and similar ruby gems for bulma forms:

  * https://github.com/aki77/bulma_form_builder
  * https://github.com/storkvist/bulma_form/tree/master/spec/dummy/app/views

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bulma_form_builder', '~> 0.2.1'
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

If you want icon support via Font Awesome, your Rails application should provide these.
You can achieve that relatively easily by follow the instructions of https://github.com/FortAwesome/font-awesome-sass or https://github.com/bokmann/font-awesome-rails .

## Demo

Unfortunately, there are no automatic tests implemented (contributions welcome).
However there is a tiny rails application (the one you'd use for this kind of engine tests) in [test/dummy](test/dummy).

You can fire up the demo application by checking out the repository and executing

```bash
bin/demo
```
. This should also pull the necessary dependencies. Afterwards, visit [http://localhost:3000](http://localhost:3000) with your favorite browser.


If you want more control, you can run the demo by changing into that directory and firing up the server:

```bash
cd test/dummy
rails s # append any options you'd like, e.g. to change the --port=<portnumber>
```

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
For fun, some of the files include comments to be compliant with [(FSFEs) reuse](https://reuse.software/).

Copyright 2019,2020 Felix Wolfsteller

The own ruby code is available as open source under the terms of the [GPLv3 License, or any later version](https://opensource.org/licenses/GPL-3.0), which is also found in the `LICENSE` file of this repository.
Note that the repository might contain boilderplate and assets to which different licenses apply.
