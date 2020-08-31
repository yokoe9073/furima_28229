FactoryBot.define do
  factory :user do
    nickname {"furima"}        
    email {"furima@123"}                
    password {"furima123"}
    password_confirmation {password}
    last_name {"たろう"}
    first_name {"ふりま"}
    furi_first_n {"フリマ"}
    furi_last_n {"タロウ"}
    birthday 
    end
end