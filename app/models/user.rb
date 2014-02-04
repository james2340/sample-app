class User < ActiveRecord::Base
  attr_accessible :email, :name

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true
  validates :name, :length   => { :maximum => 30 }
  validates :email, :presence => true
  validates :email, :format   => { :with => email_regex }
  validates :email, :uniqueness => { :case_sensitive => false }
end
