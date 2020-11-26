class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(tweet_params)
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def tweet_params
    params.require(:event).permit(:name, :image, :text)
  end

end
