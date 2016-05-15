class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @events = Event.all
    end
  end
end
