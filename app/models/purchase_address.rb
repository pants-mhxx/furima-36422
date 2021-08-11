class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :city, :address_line1, :address_line2, :telephone, :building, :purchase

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :address_line1
    validates :address_line2
    validates :telephone
  end
  validates :city, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item: item_id, user_id: user_id)
    Address.create(zip: zip, city: city, address_line1: address_line1, address_line2: address_line2, building: building, telephone: telephone)
  end
end