class OrderForm
  include ActiveModel::Model
  # order_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresse, :building, :phone_number, :token

  # 4行目と同じくこのタイミングでは生成前なので「validates :order_id」は不要
  with_options presence: true do
    # buyモデルのバリデーション
    validates :user_id
    validates :item_id
    # orderモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :addresse
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    buy = Buy.create(user_id:, item_id:)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    Order.create(buy_id: buy.id, postal_code:, prefecture_id:, city:, addresse:,
                 building:, phone_number:)
  end
end
