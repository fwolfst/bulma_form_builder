# SPDX-FileCopyrightText: 2020 Felix Wolfsteller
#
# SPDX-License-Identifier: GPL-3.0-or-later

module BulmaFormBuilder
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template

    # add 'input' css class to text_fields
    # additional: 'help' and 'icon_left' options
    def text_field(method, options={})
      (options[:class] ||= '') << ' input'

      (options[:class] ||= '') << ' is-danger' if has_errors?(method)

      text_field_html = super(method, options)

      if options[:icon_left]
        icon_html = content_tag(:span, class: 'icon is-small is-left') do
          content_tag(:i, class: options[:icon_left]) {}
        end

        content_tag :p, class: 'control has-icons-left' do
          text_field_html + icon_html.html_safe + help(options[:help]) + errors_on(method)
        end
      else
        text_field_html + help(options[:help]) + errors_on(method)

      end
    end

    # add 'input' css class to number_field
    def number_field(method, options={})
      (options[:class] ||= '') << ' input'

      (options[:class] ||= '') << ' is-danger' if has_errors?(method)

      text_field_html = super(method, options) + help(options[:help])
    end

    # add 'input textarea' css class to text_area
    def text_area(method, options={})
      (options[:class] ||= '') << ' input textarea'

      (options[:class] ||= '') << ' is-danger' if has_errors?(method)

      text_field_html = super(method, options)
    end

    # add 'label' css class to labels
    def label(method, options={})
      (options[:class] ||= '') << ' label'
      super(method, options)
    end

    def check_box(method, options={})
      content_tag(:label, class: 'checkbox') do
        super(method, options).html_safe + options[:label].to_s.html_safe
      end
    end

    def select method, choices = nil, options = {}, html_options = {}, &block
      # TODO extract size/class from html_options, has to go into select-tag if found
      content_tag :div, class: %[field is-narrow] do
        content_tag :div, class: %[control] do
          content_tag :div, class: %[select is-fullwidth] do
            super(method, choices, options, html_options, &block)
          end
        end
      end
    end

    def help(help_text)
      return '' if !help_text.present?

      content_tag :p, class: 'help' do
        help_text
      end
    end

    # true iff (validation) error on attribute found
    def has_errors? attr_name
      object&.errors&.[](attr_name)&.any?
    end

    # iff has errors:
    #   <p class="help is-danger">error1<br/>error2</p>
    def errors_on attr_name
      if has_errors?(attr_name)
        content_tag :p, class: 'help is-danger' do
          object.errors[attr_name].join("<br/>").html_safe
        end
      end
    end

  end

end
