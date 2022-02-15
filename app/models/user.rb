class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :family_name_kana, presence: true, format: { with: /\p{katakana}//\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\p{katakana}//\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
/\p{katakana}//\A[ァ-ヶー－]+\z/