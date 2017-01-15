class GroupAccount < ApplicationRecord
  has_one :group
  serialize :table , Array
  serialize :mapper , Hash
end

