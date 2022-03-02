FactoryBot.define do
  factory :order_purchase do
    user_id         {1}
    item_id         {1}
    post_code       { '123-4567' }
    prefecture_id   {2}
    municipalities  { '札幌市' }
    address         { '1-1-1' }
    building_name   { 'ビル202' }
    tel_number      { '09022222222' }
    token           {'tok_abcdefghijk00000000000000000'}
  end
end
