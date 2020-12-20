class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    
    if  @event.save
      redirect_to root_path, notice: "イベントを登録しました"
    else
      redirect_to new_event_path, notice: "登録出来ませんでした"
    # @events = Event.where(user_id: current_user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    event = Event.find(params[:id])
    event.destroy
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    @event = Event.new
  end

  private
  def event_params
    params.require(:event).permit(:title, :body, :start, :end)
  end

end
