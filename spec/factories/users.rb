FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| "test_mail#{n}#@gmail.com" }
    sequence(:password)  { |n| "password #{n}" }
    sequence(:username)  { |n| "username #{n}" }
  end
end
