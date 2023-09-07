class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status, class_name: 'Salesstatus'
  belongs_to :shipping_fee_status, class_name: 'Shippingfeestatus'
  belongs_to :prefecture
  belongs_to :scheduled_delivery, class_name: 'Scheduleddelivery'

  with_options presence: true do
    validates :image
    validates :user_id
    validates :name
    validates :text
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, numericality: { greater_than: 299, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
