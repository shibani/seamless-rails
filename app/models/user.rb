class User < ActiveRecord::Base

  attr_accessor :form

  attr_accessor :url

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, format: { with: VALID_EMAIL_REGEX, :message => 'is invalid' } 

  validates :email, uniqueness: { case_sensitive: false, :message => ' already has an account associated with it'  }, if: 'name.present?'

  validates :name, length: { minimum: 4, maximum: 50 }

  has_secure_password
  
  validates :password, length: { minimum: 8, :message => ' must be 8 characters or longer' }, allow_nil: true


  HUMANIZED_ATTRIBUTES = {
    :name => 'Username'
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
end
