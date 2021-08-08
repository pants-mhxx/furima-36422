class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :item_state_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_fee_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_from_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_day_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :price, numericality: {greater_than: 300,less_than: 9999999}, format: { with: /\A[0-9]+\z/ }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_day
end
