class PuchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :city, :address_line1, :address_line2, :telephone, :building, :purchase
end