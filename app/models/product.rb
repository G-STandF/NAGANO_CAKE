class Product < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  # 消費税を加えた商品価格
  def with_tax_price
    (self.price * 1.1).round
  end
end
