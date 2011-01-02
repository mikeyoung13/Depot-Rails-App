class CopyPriceToLineItem < ActiveRecord::Migration
  def self.up
    #LineItem.where("price is NULL") do |lineitem|
    #LineItem.where({:price => nil}) do |lineitem|
    #LineItem.all(:conditions => 'price IS NULL') do |lineitem|
    
    LineItem.all.each do |lineitem|
      product = Product.find(lineitem.product_id)
      lineitem.update_attribute :price, product.price
    end
  end

  def self.down
    LineItem.all.each do |lineitem|
      lineitem.update_attribute :price, nil
    end
  end
end
