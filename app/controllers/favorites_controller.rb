class FavoritesController < ApplicationController

  def index
    @sitter = Customer.find(params[:sitter_id])
    # @sitter_favorites = current_customer.favorites
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:sitter_id)
    @sitter_favorites = Customer.find(favorites)
  end

  def create
    @sitter_favorite = Favorite.new
    @sitter_favorite.customer_id = current_customer.id
    @sitter_favorite.sitter_id = params[:sitter_id]
    @sitter_favorite.save
    redirect_to customer_sitter_path(current_customer.id, @sitter_favorite.sitter_id)
  end

  def destroy
    @sitter_favorite = Favorite.where(customer_id: params[:customer_id], sitter_id: params[:sitter_id])[0]
    @sitter_favorite.destroy
    redirect_to customer_sitter_path(current_customer.id, @sitter_favorite.sitter_id)
  end
end