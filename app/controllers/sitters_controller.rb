class SittersController < ApplicationController
  def show
    @sitter = Customer.find(params[:id])
  end

  def edit
    @sitter = Customer.find(params[:id])
  end
end
