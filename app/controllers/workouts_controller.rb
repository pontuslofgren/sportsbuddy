class WorkoutsController < ApplicationController
  before_action :set_workouts, only: [:index]
  before_action :set_workout, only: %i[show destroy]

  def index
    @workouts = @workouts.where("start_date_time > ?", DateTime.now())
    @workouts = @workouts.where(category_id: params[:category_query]) if params[:category_query].present?
    @workouts = @workouts.where(level_id: params[:level_query]) if params[:level_query].present?
    @workouts = @workouts.where(location_id: params[:location_query]) if params[:location_query].present? && !params[:location_query].empty?
    @workouts = @workouts.where("start_date_time > ?", DateTime.parse(params[:datetime])) if params[:datetime].present?
    @workouts = @workouts.where("amount <= ?", params[:price_query]) if params[:price_query].present?
    @workouts = @workouts.text_search(params[:text]) if params[:text].present? && !params[:text].empty?
    if params[:location].present?
      @workouts = @workouts.near(params[:location].split, 100)
    end
    @workouts = @workouts.order(start_date_time: :asc)
    @workouts = @workouts.paginate(page: params[:page], per_page: 10)

    @markers = @workouts.geocoded.map do |workout|
      {
        lat: workout.latitude,
        lng: workout.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {workout: workout}),
        workout_id: workout.id
      }
    end

  end

  def show
    @markers = [{ lat: @workout.latitude, lng: @workout.longitude }]
    @booking = Booking.new
    @profile = User.find_by(id: @workout.user_id)
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
      chatroom = Chatroom.new(workout_id: @workout.id)
      chatroom.save
      redirect_to workout_path(@workout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to profile_path(current_user), notice: "Workout canceled successfully"
  end

  private

  def set_workouts
    @workouts = Workout.all
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :description, :start_date,
      :start_time, :duration, :address, :latitude, :longitude, :spots,
      :category_id, :level_id, :location_id, :amount)
  end

  # # Formats "Wed 2023-11-29 at 15:45" to DateTimeObject
  # def dateformat(date_string)
  #   # ['Wed', '2023-11-29', 'at', '15:45']
  #   array = date.split()
  #   date = array[1]
  #   time = array[3]
  # end

end
