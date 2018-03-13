class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  # Ensure both all answers are correct and all questions are answered
  #  i.e. a blank answer is incorrect
  def correct?
    return false unless answers.count == unit.questions.count

    answers.each do |question_id, answer_index|
      return false unless answer_is_correct? question_id, answer_index
    end

    true
  end

  private

  def answer_is_correct?(question_id, answer_index)
    q = Question.find(question_id)

    q.answers[answer_index.to_i]["is_correct"]
  end
end
