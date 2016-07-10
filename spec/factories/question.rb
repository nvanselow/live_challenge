FactoryGirl.define do
  factory :question do
    sequence(:title) { |num| "Question #{num}" }
    body 'This is some text for a question I want to add. It has **markdown**.'
    user
  end
end
