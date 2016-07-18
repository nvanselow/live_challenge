require 'rails_helper'

describe MarkdownQuestion do
  let(:question) { FactoryGirl.create(:question) }
  let(:markdown_question) { MarkdownQuestion.new(question.id) }

  describe '.new' do
    it 'finds a question based on the id' do
      expect(markdown_question.question).to eq(question)
    end
  end

  describe '#body' do
    it 'returns an html formatted version of the question body' do
      expect(markdown_question.body).to include('<p>This is some text for a '\
                                                'question I want to add.</p>')
    end
  end

  describe '#body_raw' do
    it 'returns the original text of the body, not formatted in html' do
      expect(markdown_question.body_raw).to eq('This is some text for a '\
                                               'question I want to add.')
      expect(markdown_question.body_raw).not_to include('<p>')
    end
  end

  describe "#code_question" do
    it 'returns the html to display the code question label if code question' do
      markdown_question.question.code_question = true

      expect(markdown_question.code_question).to eq('<p><i class="fa fa-file-c'\
                                                    'ode-o"></i> Code-Based An'\
                                                    'swers</p>')
    end

    it 'returns the html to dispaly the text question lable if text question' do
      expect(markdown_question.code_question).to eq('<p><i class="fa fa-file-t'\
                                                    'ext-o"></i> Text-Based An'\
                                                    'swers</p>')
    end
  end
end
