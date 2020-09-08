FactoryBot.define do
  factory :order_shipping do
    token {'tok_498d79aa2ebb01d68581f5151fe3'}
    postal { "123-4567" }
    exhibitor_prefecture_id { 2 }
    city { '吹田市' }
    address { 1 }
    building { 'マンション' }
    tel { 123456789 }
    user_id {create(:user).id}
  end
end
