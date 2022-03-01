class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @age = (18..100).to_a
    @users = User.all
    @gyms = []
    @locations = []
    @sports = []
    @genders = []
    User.all.each do |user|
      @gyms << user.gym
      @locations << user.gym.name
      @sports << user.sport
      @genders << user.gender
    end

    if params[:commit].present?
      filtering_params(params[:user]).each do |key, value|
        @users = @users.public_send("filter_by_#{key}", value) if value.present?
      end
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @age = (18..100).to_a
    @gyms = []
    @locations = []
    @sports = []
    @genders = []
    User.all.each do |user|
      @gyms << user.gym
      @locations << user.gym.name
      @sports << user.sport
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :sport, :age, :gym, :gender)
  end

  def filtering_params(params)
    params.slice(:sport, :location, :gym, :gender, :age1, :age2)
  end
end
