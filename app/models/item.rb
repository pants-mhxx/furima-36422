class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :item_state_id
    validates :shipping_fee_id
    validates :shipping_from_id
    validates :shipping_day_id
    validates :price
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_day
end
