require 'rails_helper'

describe Answer, type: :model do
  it { should belong_to(:question) }

  it { should have_valid(:body).when('This is more than 10 characters longs.') }
  it { should_not have_valid(:body).when('', nil, 'Too short') }

  it { should have_valid(:private_answer).when(true, false) }
  it { should_not have_valid(:private_answer).when('', nil) }
end
