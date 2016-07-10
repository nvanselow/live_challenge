require 'rails_helper'

describe Question, type: :model do
  it { should have_valid(:title).when('A title', 'Title') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:body).when('Some text', '**with markdown**') }
  it { should_not have_valid(:body).when('', nil) }
end
