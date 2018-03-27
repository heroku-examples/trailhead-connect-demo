class QuizSubmissionController < ApplicationController
  before_action :require_user

  def create
    # Save quiz submission
    @unit = Unit.find(params[:unit][:id])
    submission = QuizSubmission.create(
      user: @current_user,
      unit: @unit,
      answers: params[:quiz_submission]
    )

    incorrect_question_ids = submission.grade
    quiz_submission_is_correct = incorrect_question_ids.empty?

    if quiz_submission_is_correct
      badge = Badge.find_by(unit: @unit)

      earned_badge = EarnedBadge.create(
        user: @current_user,
        badge: badge,
        quiz_submission: submission
      )
    else
      session[:unit] = @unit.id
      session[:submitted_answers] = submission.answers
      session[:incorrect_questions] = incorrect_question_ids

      earned_badge = nil
    end

    respond_to do |format|
      format.js do
        session.delete(:unit)
        session.delete(:submitted_answers)
        session.delete(:incorrect_questions)

        render 'units/show_update', locals: { badge: earned_badge ? earned_badge.badge : nil,
                                              incorrect_questions: incorrect_question_ids }
      end

      format.html do
        if quiz_submission_is_correct
          redirect_to units_url, notice: "Good job, you\'ve earned the #{badge.name} badge!"
        else
          redirect_to unit_url(@unit), alert: 'One or more of your answers are incorrect. Please try again!'
        end
      end

    end
  end
end
