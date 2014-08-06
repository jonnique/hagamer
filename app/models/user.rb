class User < ActiveRecord::Base

  # Regular Expressions
  PHONE_REGEX = /\A[\(\s\._-]*\d{3}[\)\s\._-]*\d{3}[\s\._-]*\d{4}\z/
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  NAME_REGEX = /\A[a-zA-Z]+\z/
  HEIGHT_REGEX = /\A([1-8]')?\s?([1-9]|1[01])\z/

  # For encrypting password
  has_secure_password

  # Validations
  validates :first_name, :length => { :maximum => 20 }, :format => NAME_REGEX, :on => :update
  validates :last_name, :length => { :maximum => 20 }, :format => NAME_REGEX, :on => :update
  validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 8 }, :on => :create, :confirmation => true
end
