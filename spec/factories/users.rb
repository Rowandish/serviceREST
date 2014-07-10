FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| "test_mail#{n}#@gmail.com" }
    sequence(:password)  { |n| "password #{n}" }
    sequence(:username)  { |n| "username #{n}" }

    factory :user_with_buildings do
      ignore do
        buildings_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:building, evaluator.buildings_count, user: user)
      end
    end
  end
end
