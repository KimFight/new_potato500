class OrderPurchase
  include ActiveModel::Model
  # いくつかのテーブルのカラムを書いていく
  attr_accessor :name, :prefecture_code, :postal_code, :city, :building, :phone_number, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :name,             format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :prefecture_code
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :phone_number,     format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save 
    # purchaseテーブルへの保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # orderテーブルへの保存
    Order.create(name: name, prefecture_code: prefecture_code, postal_code: postal_code, city: city, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end