class RoleType < ApplicationRecord
  has_many :roles
  belongs_to :object, :polymorphic => true
end
