class SittersController < ApplicationController

  def show
    @sitter = Customer.find(params[:id])
  end

  def edit
    @sitter = Customer.find(params[:id])
  end

  def update
    @sitter = Customer.find(params[:id])
    @sitter.update(customer_params)
    redirect_to sitter_customer_path(@sitter)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :first_name_kana, :nickname, :age, :sex, :professtion, :email, :password, :postal_code, :address, :introduction, :sitter_flag, :telephone_number)
  end
end
