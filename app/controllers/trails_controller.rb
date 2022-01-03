class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end
  
  def show
    @trail = Trail.find(params[:id])
    @trips = @trail.trips
  end
end
