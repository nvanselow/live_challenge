require 'markdownable'

class Api::V1::MarkdownController < ApiController
  include Markdownable

  def create
    render json: { html: parse_markdown(params[:text]) }, status: :ok
  end
end
