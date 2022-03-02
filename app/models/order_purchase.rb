class OrderPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :tel_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :tel_number, format: { with: /\A[0-9]{11}\z/}
    
    validates :token
    
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create( user_id: user_id, item_id: item_id)
    Purchase.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id,
       municipalities: municipalities, address: address, building_name: building_name, tel_number: tel_number)
  end
end
