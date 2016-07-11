require 'securerandom'

class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  before_validation(on: :create) do
    self.long_id = SecureRandom.hex
  end

  def self.all_for(user)
    if user
      Question.where(user: user)
    else
      []
    end
  end

  def shareable_link
    "/answer_questions/#{long_id}"
  end
end
