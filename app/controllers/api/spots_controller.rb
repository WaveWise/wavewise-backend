class Api::SpotsController < ApplicationController
  def index
    @spots = Spot.all
    render :index
  end
end
