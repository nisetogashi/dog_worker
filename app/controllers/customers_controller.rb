class CustomersController < ApplicationController

  before_action :move_to_signed_in, except: [:index]

  def index
  end

  def new
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update_image #customerモデルのcreateアクションがdeviseで既に使われているため、アクション名をupdete_imageに変更した
    customer = Customer.find(params[:id])
    customer.images.each do |image| #active storageは削除する機能が備わっていないため削除の記述が必要
      image.purge #今まで登録していた画像を全て削除
    end
    customer.update params.require(:customer).permit(:images) #画像の情報だけ送りたい場合、ストロングパラメーターに書かずここに書くことでセキュリティ面で強い
    redirect_to customer_path(customer)
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  def calendar
    @calendar = Customer.find(params[:id])
  end

  def favorite_siiter
  end

  def review
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :first_name_kana, :nickname, :age, :sex, :professtion, :email, :password, :postal_code, :address, :introduction, :sitter_flag, :telephone_number)
  end
end
