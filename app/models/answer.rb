class Answer < ActiveRecord::Base
  belongs_to :question

  validates :body, presence: true, length: { minimum: 10 }
  validates :private_answer, inclusion: { in: [true, false] }
end
