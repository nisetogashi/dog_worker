class HomesController < ApplicationController
  def top
    @sitters = current_customer&.sitters || []
  end
end
