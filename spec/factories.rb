FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { |n| 'Person'}
    sequence(:last_name)  { |n| n }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    sequence(:phone_number)  { |n| "(999) 99 9 99 99 #{n}"}
    account_id    1

    factory :admin do
      admin true
    end
  end
end
