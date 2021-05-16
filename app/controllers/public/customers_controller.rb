class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:success] = "登録情報を変更しました。"
       redirect_to customer_path
    else
        render 'edit'
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
  end

end
