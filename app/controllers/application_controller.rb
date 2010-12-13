class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_cart 
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
   
  before_filter :prepare_time_for_display
  def prepare_time_for_display
    @current_time = Time.now
  end
  
  def increment_count
    # best way:
    session[:counter] ||= 0
    
    # works, but more verbose:
    #if session[:counter].nil?
    #  session[:counter] = 0
    #end
    session[:counter] += 1
  end
  
  def reset_count
    session[:counter]=0
  end
  
end
