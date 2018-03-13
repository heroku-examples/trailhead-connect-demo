class QuizSubmissionController < ApplicationController
  before_action :require_user

  def create
    # Save quiz submission
    unit = Unit.find(params[:unit][:id])
    submission = QuizSubmission.create(
      user: @current_user,
      unit: unit,
      answers: params[:quiz_submission]
    )

    if submission.correct?
      badge = Badge.find_by(unit: unit)
      EarnedBadge.create(
        user: @current_user,
        badge: badge,
        quiz_submission: submission
      )

      redirect_to units_url, notice: "Good job, you\'ve earned the #{badge.name} badge!"
    else
      redirect_to unit_url(unit), alert: 'One or more of your answers are incorrect. Please try again!'
    end
  end
end
