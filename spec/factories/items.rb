FactoryBot.define do
  factory :item do
    name                     { 'sample' }
    describe                 { 'あいうえお' }
    category_id              { 1 }
    status_id                { 1 }
    charge_id                { 1 }
    prefecture_id            { 1 }
    shipping_days_id         { 1 }
    price                    { 1111 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
