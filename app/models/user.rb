class User < ApplicationRecord
  has_many :roles
  has_many :microposts
  has_and_belongs_to_many :tours
  validates_presence_of :name
  validates :email,:presence => true, uniqueness: { case_sensitive: false }
  validates :password, :length => { :minimum => 7 }
  has_secure_password
end
