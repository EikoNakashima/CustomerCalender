class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    
    if  @customer.save
      redirect_to root_path, notice: "イベントを登録しました"
    else
      redirect_to new_customer_path, notice: "登録出来ませんでした"
    # @events = Event.where(user_id: current_user.id)
    end
  end

  def destroy
    if @customer.destroy
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
    if @customer.update(customer_params)
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

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:title, :body, :start, :end)
  end

end
