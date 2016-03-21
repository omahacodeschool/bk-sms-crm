FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    password "MyString"
    phone_number 1
  end
  factory :touch do
    client_id 1
    message "MyText"
    outgoing false
  end
  factory :business do
    user_id 1
    name "MyString"
    business_phone 1
  end
  factory :client do
    first_name "MyString"
    last_name "MyString"
    phone_number 1
    notes "MyText"
    active false
  end
end
