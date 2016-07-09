FactoryGirl.define do
  factory :user do
    sequence(:display_name) { |num| "user_#{num}" }
    sequence(:email) { |num| "email_#{num}@mailinator.com" }
    password 'password'
  end
end
