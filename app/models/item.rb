class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :shipping_day_id
    validates_inclusion_of :price, in: 300..9_999_999, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
