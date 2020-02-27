Rails.application.routes.draw do
  root 'forms#form_builder1'

  get 'default_form_builder', to: 'forms#default_form_builder'

  get 'form_builder', to: 'forms#form_builder'

  get 'form_builder_object_backed', to: 'forms#form_builder_object_backed'

  #get 'form_builder2', to: 'forms#form_builder2'
  #get 'form_builder3', to: 'forms#form_builder3'
  #get 'form_builder4', to: 'forms#form_builder4'
  #get 'form_builder_horizontal', to: 'forms#form_builder_horizontal'
  #get 'general', to: 'forms#general'
end
