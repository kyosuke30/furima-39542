class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresse, :building, :phone_number, :token
  
  with_options presence: true do
    # buyモデルのバリデーション
    validates :user_id
    validates :item_id
    # orderモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresse
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(buy_id: buy.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresse: addresse,
                 building: building, phone_number: phone_number)
  end
end
