class Customer::AddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました。"
      redirect_to addresses_path
    else
      flash.now[:alert] = "配送先を入力してください。"
      @addresses = current_customer.addresses
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を更新しました。"
      redirect_to addresses_path
    else
      flash.now[:alert] = "配送先を入力してください。"
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "配送先を削除しました。"
    redirect_to request.referer
  end


  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
