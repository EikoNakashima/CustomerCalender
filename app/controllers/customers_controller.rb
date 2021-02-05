class CustomersController < ApplicationController
  before_action :set_customer, only: [ :show, :edit, :update, :destroy]

  
  def index
    @customer = Customer.includes(:user)
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
   
    end
  end

  def destroy
    if @customer.destroy
      redirect_to root_path, notice: '顧客を削除しました'
    else
      flash.now[:alert] = '削除できませんでした'
      render :show
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path, notice: '顧客情報を編集しました'
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
    params.require(:customer).permit(:name, :code, :current_address, :building_site, :phone, :body, :user_id).merge(user_id: current_user.id)
  end

end
