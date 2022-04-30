class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create params.require(:pet).permit(:customer_id, :name, :age, :sex, :color, :kind, :introduction, images: [])
    redirect_to @pet
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update params.require(:pet).permit(:customer_id, :name, :age, :sex, :color, :kind, :introduction, images: [])
    redirect_to @pet
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.images.purge #active storageの画像のみ削除
    flash[:notice] = "削除しました"
    redirect_to action: "index"
  end


end
