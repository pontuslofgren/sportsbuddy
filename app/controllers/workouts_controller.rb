class WorkoutsController < ApplicationController
  before_action :set_workouts, only: [:index]

  def index
    if params[:category_query].present?
      @workouts = @workouts.where(category_id: params[:category_query])
    end
    if params[:level_query].present?
      @workouts = @workouts.where(level_id: params[:level_query])
    end
    if params[:location_query].present?
      @workouts = @workouts.where(location_id: params[:location_query])
    end
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.start_date_time = DateTime.new(@workout.start_date.year,
                                            @workout.start_date.month,
                                            @workout.start_date.day,
                                            @workout.start_time.hour,
                                            @workout.start_time.min)

    @workout.end_date_time =  @workout.start_date_time +
                              @workout.duration.seconds_since_midnight.seconds

    @workout.user_id = current_user.id
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_workouts
    @workouts = Workout.all
  end

  def workout_params
    params.require(:workout).permit(:title, :description, :start_date,
      :start_time, :duration, :address, :latitude, :longitude, :spots,
      :category_id, :level_id, :location_id)
  end

end
