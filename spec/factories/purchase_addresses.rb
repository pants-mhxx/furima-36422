FactoryBot.define do
  factory :purchase_address do
    zip { '111-1111' }
    shipping_from_id { 1 }
    address_line1 { 'あああああああ' }
    address_line2 { 'あああああああ' }
    building { 'あああああああ' }
    telephone { 11111111111 }
    user_id { 1 }
    item_id { 1 }
    token {'ENV["PAYJP_SECRET_KEY"]'}
  end
end
