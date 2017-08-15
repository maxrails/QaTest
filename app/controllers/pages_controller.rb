class PagesController < ApplicationController
  def home
    if current_user
      @orders = current_user.orders
    end
  end
end
