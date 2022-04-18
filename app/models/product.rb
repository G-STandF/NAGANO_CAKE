class Product < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  # 消費税を加えた商品価格
  def with_tax_price
    (self.price * 1.1).round
  end
end
