class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    
  end
  
  def updated
    
  end
  
  def destroy
    CartItem.destroy
  end
  
  def destroy_all
    CartItem.destroy_all
  end
  
  
end
