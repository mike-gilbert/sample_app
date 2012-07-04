FactoryGirl.define do
  factory :user do
    first_name     "Michael"
    last_name      "Hartl"
    phone_number  "(999) 99 9 99 99 9"
    account_id    1
    email    "michael99@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
