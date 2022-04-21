class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

 enum product_status: { not_started: 0, waiting_production: 1, in_production: 2, production_completed: 3}

end
