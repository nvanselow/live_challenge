FactoryGirl.define do
  factory :answer do
    question
    sequence(:body) { |num| "This is my awesome answer #{num}" }
    private_answer false
    sequence(:name) { |num| "Student #{num}" }
  end
end
