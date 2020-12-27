class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
 

  
  def index
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
    # @events = Event.where(user_id: current_user.id)
    end
  end

  def destroy
    if @event.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      flash.now[:alert] = '商品を削除できませんでした'
      render :show
    end
    # @user = User.find(params[:id])
    # event = Event.find(params[:id])
    # event.destroy
    # redirect_to user_path(@user)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      flash.now[:alert] = '必須事項を入力してください'
      render :edit
    end
  end

  def show
    # @user = User.find(params[:id])
    # @events = Event.where(user_id: @user.id)

  end



  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :start, :end, :user, customer_ids:[])
  end

end
