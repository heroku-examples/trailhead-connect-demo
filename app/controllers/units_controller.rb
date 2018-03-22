class UnitsController < ApplicationController
  before_action :require_user

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])

    pending_quiz = session[:unit] == @unit.id &&
                    session[:submitted_answers].present? &&
                    session[:incorrect_questions].present?

    if pending_quiz
      @submitted_answers = session.delete(:submitted_answers)
      @incorrect_questions = session.delete(:incorrect_questions)
      session.delete(:unit)
      puts "Pending Quiz! Submitted answers: #{@submitted_answers}"
      puts "Pending Quiz! Incorrect questions: #{@incorrect_questions}"
    end

    @submitted_answers ||= nil
    @incorrect_questions ||= []
  end
end
