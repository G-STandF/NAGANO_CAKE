class Address < ApplicationRecord
  belongs_to :customer

  def address_display　#注文情報入力画面のお届け先表示用
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
