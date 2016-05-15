class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to Private Events!"
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def attend_event
    @event = Event.find(params[:id])
    current_user.attended_events << @event
    flash[:success] = "The event has been saved."
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

end
