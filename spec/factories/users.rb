FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@com' }
    encrypted_password    { 'test1111' }
    password_confirmation { 'test1111' }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2000-01-01' }
  end
end

class User < ApplicationRecord
  validates :nickname,               presence: true
  validates :encrypted_password,     presence: true, length: { minimum: 6 }
  validates :family_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
