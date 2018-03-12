class UnitsController < ApplicationController
  before_action :require_user

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
  end
end
