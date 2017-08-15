class ItemsController < ApplicationController

  def index
    @item_type  = params[:item_type]
    @valid_item = ShopItem.valid_item?(@item_type)
    if @valid_item
      page      = params[:page].to_i
      page      = 1 if page <= 0 if @item_type != 'juice'
      @items    = ShopItem.where(item_type: @item_type).paginate(page: page)
    else
      render 'non_existent_category'
    end
  end

  def add_to_cart
    id    = params[:id].to_i
    cart  = session[:ordered_items] || []

    unless cart.include?(id)
      cart << id
      session[:ordered_items] = cart
    end

    redirect_back fallback_location: '/'
  end

  def remove_from_cart
    id    = params[:id].to_i
    cart  = session[:ordered_items] || []

    if cart.include?(id)
      cart.delete( id )
      session[:ordered_items] = cart
    end

    redirect_back fallback_location: '/'
  end

  def cart
    @items = ShopItem.where(id: @cart)
  end

  def order
    resp = false
    if current_user && @cart.present?
      resp = Order.place_an_order( @cart, current_user.id )
    end

    render json: { success: resp }
  end

end
