class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  before_action :set_profiles, only: [:index]

  def index
  end

  def show
    @workouts = @profile.workouts
    @bookings = @profile.bookings
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end

  def set_profiles
    @profiles = User.find_all
  end
end
