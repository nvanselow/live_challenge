require 'redcarpet'

module Markdownable
  OPTIONS = {
    filter_html:     true,
    hard_wrap:       true,
    link_attributes: { rel: 'nofollow', target: "_blank" },
    space_after_headers: true,
    fenced_code_blocks: true
  }

  EXTENSIONS = {
    autolink:           true,
    superscript:        true,
    disable_indented_code_blocks: true
  }

  def parse_markdown(text)
    markdown.render(text)
  end

  private

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new(OPTIONS)
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(renderer, EXTENSIONS)
  end
end
