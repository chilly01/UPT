class User < ApplicationRecord
  has_many :microposts
  has_many :tours
  validates_presence_of :name
  validates_presence_of :email
  validates :password, :length => { :minimum => 7 }
  has_secure_password
end
