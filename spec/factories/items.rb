FactoryBot.define do
  factory :item do
    name               {"海"}
    description       {"海の写真"}
    category_id        {1}
    condition_id       {1}
    delivery_charge_id {1}
    area_id            {1}
    days_to_ship_id    {1}
    price              {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end