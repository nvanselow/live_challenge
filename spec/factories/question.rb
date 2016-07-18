FactoryGirl.define do
  factory :question do
    sequence(:title) { |num| "Question #{num}" }
    body 'This is some text for a question I want to add.'
    long_id 'abcdefg'
    user
    code_question false

    factory :markdown_question do
      body 'This body has some **markdown**.'
    end

    factory :code_question do
      code_question true
    end
  end
end
