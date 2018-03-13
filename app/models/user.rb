class User < ApplicationRecord
  has_many :earned_badges
  has_many :badges, through: :earned_badges
  has_many :quiz_submissions
end
