class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_cart

  def find_cart
    @cart = session[:ordered_items] || []
  end
end
