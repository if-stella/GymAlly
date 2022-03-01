class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @age = (18..100).to_a
    @users = User.all
    @gym = []
    @locations = []
    @sports = []
    @genders = []
    User.all.each do |user|
      @gym << user.gym
      @locations << user.location
      @sports << user.sport
      @genders << user.gender
    end

    filtering_params(params[:user]).each do |key, value|
      @users = @users.public_send("filter_by_#{key}", value) if value.present?
    end

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def filtering_params(params)
    params.slice(:sport, :location, :gym, :gender, :age1, :age2)
  end
end
