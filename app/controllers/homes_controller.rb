class HomesController < ApplicationController
  def top
    @sitters = Customer.all
  end
end
