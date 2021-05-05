FactoryBot.define do
  factory :purchase_address do
    address       {"123-4567"}
    prefecture_id {5}
    city          {"横浜市西区みなとみらい"}
    city_text     {"2-1"}
    city_building {"東京タワー"}
    tell          {"1234567890"}
    token         {"sampleToken"}
  end
  
end