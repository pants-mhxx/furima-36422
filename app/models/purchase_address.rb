class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :shipping_from_id, :address_line1, :address_line2, :telephone, :building, :purchase, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :address_line1
    validates :address_line2
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
  end
  validates :shipping_from_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(zip: zip, shipping_from_id: shipping_from_id, address_line1: address_line1, address_line2: address_line2, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end