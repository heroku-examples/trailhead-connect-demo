class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  # Return an array of the question ID of any questions with an incorrect answer.
  #  a blank answer is considered incorrect
  def grade
    incorrect_question_ids = []

    # Add skipped questions to array
    unit.questions.each do |q|
      incorrect_question_ids << q.id unless answers.has_key?(q.id.to_s)
    end

    # Add incorrectly answered questions to the array
    answers.each do |question_id, answer_index|
      incorrect_question_ids << question_id.to_i unless answer_is_correct? question_id, answer_index
    end

    return incorrect_question_ids
  end

  private

  def answer_is_correct?(question_id, answer_index)
    q = Question.find(question_id)

    q.answers[answer_index.to_i]["is_correct"]
  end
end
