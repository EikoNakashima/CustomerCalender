class CustomersController < ApplicationController
  before_action :set_customer, only: [ :show, :edit, :update, :destroy]

  
  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new

  end

  def create
    @customer = Customer.create(customer_params)
    
    if  @customer.save
      redirect_to root_path, notice: "顧客を登録しました"
    else
      redirect_to root_path, alert: "登録出来ませんでした"
    # @events = Event.where(user_id: current_user.id)
    end
  end

  def destroy
    if @customer.destroy
      redirect_to root_path, notice: '顧客を削除しました'
    else
      flash.now[:alert] = '顧客を削除できませんでした'
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
      redirect_to customers_path, notice: '商品を編集しました'
    else
      flash.now[:alert] = '必須事項を入力してください'
      render :edit
    end
  end

  def show
  end



  private

  def set_customer
    @customer = Customer.find(params[:id])
  end


  def customer_params
    params.require(:customer).permit(:name, :current_address, :building_site, :phone, :body, :user_id)
  end

end
