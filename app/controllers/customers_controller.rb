class CustomersController < ApplicationController
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

  def sitter_show
    @sitter = Customer.find(params[:id])
  end

  def sitter_edit
    @sitter = Customer.find(params[:id])
  end

  def sitter_show_for_customer
    @sitter = Customer.find(params[:id])
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
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(customer)
  end

  def update_sitter
    sitter = Customer.find(params[:id])
    sitter.update(customer_params)
    redirect_to sitter_customer_path(sitter)
  end

  def calendar
    @calendar = Customer.find(params[:id])
  end

  def favorite_siiter
  end

  def review
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :first_name_kana, :nickname, :age, :sex, :professtion, :email, :password, :postal_code, :address, :introduction, :sitter_flag, :telephone_number)
  end
end
