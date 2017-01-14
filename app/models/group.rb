class Group < ApplicationRecord
  has_many :users, :through => :user_groups
  validates :name, uniqueness: true

end
