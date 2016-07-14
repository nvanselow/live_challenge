require 'spec_helper'
require_relative '../../lib/markdownable'

describe Markdown, type: :module do
  let(:fresh_class) do
    Class.new{ include Markdownable }
  end
  let(:input_string) { 'This is *italic* and **bold**.' }

  it 'converts a string with markdown to html' do
    html_output = fresh_class.new.render(input_string)

    expect(html_output).to include('<p>This is <em>italic</em> and '\
                                   '<strong>bold</strong>.</p>')
  end
end
