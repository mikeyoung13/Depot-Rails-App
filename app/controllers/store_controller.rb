class StoreController < ApplicationController
  def index
    @products = Product.all
    @counter = increment_count
  end

end
