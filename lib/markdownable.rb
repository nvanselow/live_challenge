require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

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

  def render(text)
    markdown.render(text).html_safe
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(HTMLWithRouge, OPTIONS)
  end
end

class HTMLWithPygments < Redcarpet::Render::HTML
  def block_code(code, lang)
    lang = lang && lang.split.first || "text"
    add_code_tags(
      Pygmentize.process(code, lang), lang
    )
  end

  def add_code_tags(code, lang)
    code = code.sub(/<pre>/,'<div class="lang">' + lang +
                    '</div><pre><code class="' + lang + '">')
    code.sub(/<\/pre>/,"</code></pre>")
  end
end

class HTMLWithRouge < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
