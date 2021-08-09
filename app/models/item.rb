class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :item_state_id
      validates :shipping_fee_id
      validates :shipping_from_id
      validates :shipping_day_id
    end
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_day
end
