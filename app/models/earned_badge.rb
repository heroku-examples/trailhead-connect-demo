class EarnedBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user
  belongs_to :quiz_submission
end
