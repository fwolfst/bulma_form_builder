class FormsController < ApplicationController
  def default_form_builder
  end

  def form_builder
  end

  def form_builder_object_backed
    @user = User.new(name: '', username: 'bulma', email: 'hello@')
    @user.validate
  end


  def form_builder2
  end
  def form_builder3
  end
  def form_builder4
  end
end
