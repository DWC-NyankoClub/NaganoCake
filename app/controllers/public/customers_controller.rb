class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:quit]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def quit_confirm
  end

  def quit
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用頂き、誠にありがとうございました。"
    redirect_to root_path
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
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :telephone_number, :is_deleted)
  end

end
