class Need < ApplicationRecord
  acts_as_nested_set
  has_and_belongs_to_many :resources
end
