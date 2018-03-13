class AddQuizSubmissionColumnToEarnedBadge < ActiveRecord::Migration[5.1]
  def change
    add_reference :earned_badges, :quiz_submission, index: true, foreign_key: true
  end
end
