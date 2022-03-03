class UsersController < ApplicationController

  def index
    @age = (18..100).to_a
    # @users = User.where(gym: current_user.gym)
    @users = User.all
    @gyms = Gym.all
    @sports = Sport.all
    @weekdays = Weekday.all
    @days = Day.all
    @genders = []
    User.all.each do |user|
      @genders << user.gender
    end

    if params[:user].present?
      # @users = User.where(gym: current_user.gym)
      @users = User.all
      filtering_params(params[:user]).each do |key, value|
        if key == "sport" || key == "weekday"
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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @age = (18..100).to_a
    @users = User.where(gym_id: current_user.gym_id)
    @gyms = Gym.all
    @sports = Sport.all
    @genders = []
    User.all.each do |user|
      @genders << user.gender
    end
  end

  def update
    @user = User.find(params[:id])

    @quote = params[:user][:quote]
    @sports = params[:user][:sport_ids]
    @user.quote = @quote
    @user.sport_ids = @sports
    @gym = Gym.find(params[:user][:gym_id])
    @user.gym = @gym
    @user.save
    if @user.save
      flash[:notice] = 'Your profile was updated.'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:quote, :sport, :gym)
  end

  def filtering_params(params)
    params.slice(:sport, :location, :gym, :gender, :age1, :age2)
  end
end
