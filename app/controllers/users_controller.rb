class UsersController < ApplicationController

  def index
    @my_gym = current_user.gym
    @age = (18..100).to_a
    # @users = User.all
    @users = User.where(gym: @my_gym)
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
      if params[:user][:gym] == "" || current_user.gym == Gym.find_by(id: params[:user][:gym])
        @my_gym = current_user.gym
      else
        @my_gym = Gym.find_by(id: params[:user][:gym])
      end
      filtering_params(params[:user]).each do |key, value|
        if key == "sports"
          value.drop(1)
          v = UsersSport.where(sport_id: value)
          @users = @users.public_send("filter_by_#{key}", v) if value.second.present?
        elsif key == "weekdays"
          value.drop(1)
          v = UsersWeekday.where(weekday_id: value)
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
    @weekdays = Weekday.all
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
    @weekdays = params[:user][:weekday_ids]
    @user.quote = @quote
    @user.sport_ids = @sports
    @gym = Gym.find(params[:user][:gym_id])
    @user.gym = @gym
    @user.weekday_ids = @weekdays
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
    params.slice(:sports, :gym, :gender, :age1, :age2, :weekdays)
  end
end
