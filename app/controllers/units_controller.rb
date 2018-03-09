class UnitsController < ApplicationController
  def index
  end

  def show
    @unit = Unit.find(params[:id])
  end
end
