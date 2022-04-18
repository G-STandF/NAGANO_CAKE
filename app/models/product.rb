class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  def with_tax_price
    (price * 1.1).floor
  end
end
