FactoryBot.define do
  factory :item do
    name                    {"product"}
    category_id             {2}
    detail_id               {2}
    status_id               {2}
    delivery_fee_id         {2}
    exhibitor_prefecture_id {2}
    shipping_date_id        {2}
    price                   {500}
    user_id                 {1}

  end
end
