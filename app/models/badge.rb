class Badge < ApplicationRecord
  belongs_to :unit
  has_many :users, through: :earned_badges
end
