class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, :through => :user_groups
  has_one :group_account
  validates :name, uniqueness: true

end
