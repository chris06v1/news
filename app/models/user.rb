class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :up_votes
  has_many :down_votes

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name

  attr_accessible :name, :email, :password, :password_confirmation
end
