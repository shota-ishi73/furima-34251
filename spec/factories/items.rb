FactoryBot.define do
  factory :item do
    association :user
    item_name                 {'test'}
    item_text                 {'test'}
    category_id               {2}
    status_id                 {2}
    delivery_payment_id       {2}
    prefecture_id             {2}
    delivery_day_id           {2}
    price                     {5000}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test.png')
    end
  end
end
