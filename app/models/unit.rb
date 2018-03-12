class Unit < ApplicationRecord
  has_many :questions
  has_one :badge
end
