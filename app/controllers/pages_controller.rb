class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @workouts = Workout.includes(:user).all.sample(3)
  end


end
