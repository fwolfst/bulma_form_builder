class User
  include ActiveModel::Model

  attr_accessor :name
  attr_accessor :username
  attr_accessor :email

  validates :email, format: {with: /mymail/}
end
