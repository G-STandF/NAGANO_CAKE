class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :amount, presence: true
  def subtotal
    item.with_tax_price * product_count
  end
end
