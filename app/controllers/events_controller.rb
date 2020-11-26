class EventsController < ApplicationController

  def index
  end

  def new
    # @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
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
    params.require(:tweet).permit(:name, :image, :text)
  end
  
end
