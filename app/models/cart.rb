class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def add_product(product_id)
    
    product = Product.find(product_id)
    
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
      #print "increment\n"
    else
      current_item = LineItem.new(:product_id=>product_id, :price=>product.price)
      line_items << current_item
      #print "new\n"
    end
    #print "product_id=",product_id,"; quantity=",current_item.quantity,"; price=",current_item.price,"\n"
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
end

