class WorkoutsController < ApplicationController
  before_action :set_workouts, only: [:index]

  def index
  end

  def new
    @workout = Workout.new
  end

  private

  def set_workouts
    @workouts = Workout.all
  end

end
