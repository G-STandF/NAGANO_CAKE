class Product < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :genre
  has_many :cart_items, dependent: :destroy



  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 消費税を加えた商品価格
  def with_tax_price
    (self.price * 1.1).round
  end
end
