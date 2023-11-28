class WorkoutsController < ApplicationController
  before_action :set_workouts, only: [:index]

  def index
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    if @workout.save
      raise
      redirect_to workout_path(@workout)
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_workouts
    @workouts = Workout.all
  end

  def workout_params
    params.require(:workout).permit(:title, :description, :start, :end, :address, :spots, :category_id, :level_id, :location_id)
  end

end
