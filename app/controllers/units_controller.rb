class UnitsController < ApplicationController
  before_action :require_user

  def index
    @units = Unit.all
  end

  def show
    @submitted_answers = nil
    @incorrect_questions = []
    @unit = Unit.find(params[:id])
  end
end
