class StoreController < ApplicationController

  def index
    @products = Product.all
    @counter = increment_count
    @cart = current_cart
  end

end
