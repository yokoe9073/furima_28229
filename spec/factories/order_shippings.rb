FactoryBot.define do
  factory :order_shipping do
    postal {123-4567}
    exhibitor_prefecture_id { 2 }
    city {吹田市}
    address {1}
    building {マンション}
    tel {12345678910}
  end
end
