FactoryBot.define do
  factory :item do
    association :user

    name                     { 'sample' }
    describe                 { 'あいうえお' }
    category_id              { 2 }
    status_id                { 2 }
    charge_id                { 2 }
    prefecture_id            { 2 }
    shipping_days_id         { 2 }
    price                    { 1111 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
