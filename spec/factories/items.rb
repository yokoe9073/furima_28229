FactoryBot.define do
  factory :item do
    name                    {"product"}
    category_id             {1}
    detail_id               {1}
    status_id               {1}
    delivery_fee_id         {1}
    exhibitor_prefecture_id {1}
    shipping_date_id        {1}
    price                   {100}
    user_id                 {1}

  end
end
