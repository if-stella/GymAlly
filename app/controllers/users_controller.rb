class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @age = (18..100).to_a
    @users = User.where(gym: current_user.gym)
    @gyms = Gym.all
    @sports = Sport.all
    @locations = []
    @genders = []
    User.all.each do |user|
      @genders << user.gender
    end
    if params[:user].present?

      @users = User.all
      filtering_params(params[:user]).each do |key, value|
        if key == "sport"
          value.drop(1)
          v = UsersSport.where(sport_id: value)
          @users = @users.public_send("filter_by_#{key}", v) if value.second.present?
        else
          @users = @users.public_send("filter_by_#{key}", value) if value.present?
        end
      end
    end
  end

  def show
  end

  def edit
    @age = (18..100).to_a
    @gyms = []
    @locations = []
    @genders = []
    User.all.each do |user|
      @gyms << user.gym.name
      @genders << user.gender
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:notice] = 'Your profile was updated.'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:quote, :sport, :gym_name, :location)
  end

  def filtering_params(params)
    params.slice(:sport, :location, :gym, :gender, :age1, :age2)
  end
end
