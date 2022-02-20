class Item < ApplicationRecord
  validates :name, presence: true
  validates :describe, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :image, presence: true

  validates_inclusion_of :price, in:300..9_999_999, format: { with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
end
