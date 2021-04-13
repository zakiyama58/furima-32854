FactoryBot.define do
  factory :buyer_address do
    postal_code  {"123-4567"}
    area_id      {13}
    city         {"横浜市緑区"}
    house_number {"青山1-1-1"}
    house_name   {"青山ハイツ101"}
    phone_number {"09012345678"}
    token        {"tok_abcdefghijk00000000000000000"}

    association :item
    association :user
  end
end
