class MarkdownQuestion
  include Markdownable

  attr_reader :question, :id, :title, :shareable_link

  def initialize(question_id)
    @question = Question.find(question_id)
    @id = @question.id
    @title = @question.title
    @shareable_link = @question.shareable_link
  end

  def body
    render(@question.body).html_safe
  end

  def body_raw
    @question.body
  end
end
