class ReviewsController < ApplicationController
  def new
    @review = Review.new()
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.sitter_id = params[:sitter_id]
    @review.save!
    redirect_to customer_sitter_path(customer_id: current_customer.id, id: params[:sitter_id])
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:review, :introduction, :rate)
  end
end
