class MarkdownQuestion
  include Markdownable

  attr_reader :question, :title

  def initialize(question_id)
    @question = Question.find(question_id)
    @title = @question.title
  end

  def body
    parse_markdown(@question.body)
  end
end
