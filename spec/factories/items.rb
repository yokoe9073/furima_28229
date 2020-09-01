FactoryBot.define do
  factory :item do
    name                    { 'アイテム' }
    detail                  { 'せつめい' }
    category_id             { 2 }
    detail_id               { 2 }
    status_id               { 2 }
    delivery_fee_id         { 2 }
    exhibitor_prefecture_id { 2 }
    shipping_date_id        { 2 }
    price                   { 500 }
    association :user
  end
end
