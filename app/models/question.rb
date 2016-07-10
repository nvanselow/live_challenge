class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def self.all_for(user)
    if(user)
      Question.where(user: user)
    else
      []
    end
  end
end
