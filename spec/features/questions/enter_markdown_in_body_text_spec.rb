require 'rails_helper'

feature 'markdown is supported in question body', %{
  As a user
  I want to add markdown to my question
  So that I can show code samples in my question
}, js: true do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.attributes_for(:question) }

  before do
    sign_in_as(user)
  end


end
