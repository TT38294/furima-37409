class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true, length: { maximum: 40 }
  validates :describe, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :image, presence: true

  validates_inclusion_of :price, in:300..9_999_999, format: { with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 0 }
  validates :charge_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :shipping_days_id, numericality: { other_than: 0 }

  belongs_to :user
  
  has_one_attached :image

  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_day

end
