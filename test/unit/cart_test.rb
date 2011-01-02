require 'test_helper'

class CartTest < ActiveSupport::TestCase

  test "cart line item should save price" do
    cart = carts(:cart1)
    [:ruby, :java, :ruby].each do |which_product|
      product = products(which_product)
      line_item = cart.add_product product.id
      assert_equal line_item.price, product.price,
      "cart line item did not save price"
    end
  end

  test "cart line item quantity should increment" do
    # print "*** start ***","\n"
    cart = carts(:cart2)
    product = products(:ruby)
    multiple = 3
    multiple.times { 
      #print "adding product_id=",product.id,"\n"
      line_item=cart.add_product product.id
      # why did I have to save this?
      line_item.save
    }
    #print "*** end ***","\n"
    item = cart.line_items.find_by_product_id product.id    
    assert_equal multiple, item.quantity,
    "cart line item quantity is incorrect"
  end

end



