class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,except:[:index]
 

  
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @events = Event.all
    @customer = Customer.all
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
    end
  end

  def destroy
    if @event.destroy
      redirect_to root_path, notice: 'イベントを削除しました'
    else
      flash.now[:alert] = 'イベントを削除できませんでした'
      render :show
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to root_path, notice: 'イベントを編集しました'
    else
      flash.now[:alert] = '必須事項を入力してください'
      render :edit
    end
  end

  def show
  end



  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :start_time, :end_time, :user, customer_ids:[]).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end