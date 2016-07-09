require 'rails_helper'

describe User, type: :model do
  it { should have_valid(:display_name).when('John Smith', 'John', 'Betty') }
  it { should_not have_valid(:display_name).when('', nil) }

  it { should have_valid(:email).when('test@email.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when('', nil, 'test', 123, 'user.com') }
  it { should validate_uniqueness_of(:email) }

  it 'has a matching password confirmation for the password' do
    user = FactoryGirl.build(:user)
    user.password = 'password'
    user.password_confirmation = 'bad password'

    expect(user.valid?).to eq(false)
    expect(user.errors[:password_confirmation]).not_to be_blank
  end
end
