class MeetupsController < ApplicationController
  def index
    @meetups_accepted = []
    Meetup.all.each do |meetup|
      if (meetup.user_one == current_user || meetup.user_two == current_user) && meetup.meetup_status == "accepted"
        @meetups_accepted << meetup
      end
    end
    @start_date = params.fetch(:start_date, Date.today).to_date
    @meetups_invitations = []
    Meetup.all.each do |meetup|
      if (meetup.user_one == current_user || meetup.user_two == current_user) && (meetup.meetup_status == "pending") && (meetup.sender.to_i != current_user.id)
        @meetups_invitations << meetup
      end
    end
    @meetups_requests = []
    Meetup.all.each do |meetup|
      if (meetup.user_one == current_user || meetup.user_two == current_user) && (meetup.meetup_status == "pending" && meetup.sender.to_i == current_user.id)
        @meetups_requests << meetup
      end
    end
  end

  def new
    @friendship = Friendship.find(params[:friendship_id])
    @meetup = Meetup.new
    @sports = Sport.all
  end

  def create
    @friendship = Friendship.find(params[:friendship_id])
    @meetup = Meetup.create(date: time)
    @sport = Sport.find(params[:meetup][:sport].to_i)
    @meetup.sport = @sport
    @meetup.meetup_status = "pending"
    @meetup.friendship = @friendship
    @meetup.sender = current_user.id
    @meetup.save!
    if @meetup.save
      flash[:notice] = "You created a meetup request"
      redirect_to meetups_path
    else
      flash[:notice] = "You were unable to create a meetup request"
      redirect_to meetups_path
    end
  end

  def update
    @friendship = Friendship.find(params[:friendship_id])
    @meetup = Meetup.find(params[:id])
    @meetup.meetup_status = "accepted"
    @meetup.save!
    redirect_to meetups_path
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    flash[:notice] = "You canceled a meetup request"
    @meetup.destroy
    redirect_to meetups_path
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date)
  end

  def time
    pa = []
    pa = params[:meetup][:date].split(/\b/)
    Time.new(pa[0].to_i, pa[2].to_i, pa[4].to_i, pa[6].to_i, pa[8].to_i)
  end
end
