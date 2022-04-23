class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :name, presence:true
  validates :postal_code, presence:true
  validates :address, presence:true

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { waiting: 0, paid_up: 1, under_production: 2, preparing: 3, shipped: 4 }


end
