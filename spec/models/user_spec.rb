require 'rails_helper'

describe User, type: :model do
  it { should have_valid(:display_name).when('John Smith', 'John', 'Betty') }
  it { should_not have_valid(:display_name).when('', nil) }

  it { should have_valid(:email).when('test@email.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when('', nil, 'test', 123, 'user.com') }
  it { should validate_uniqueness_of(:email) }

  it 'is valid if there is a matching password confirmation for the password' do
    user = FactoryGirl.build(:user)

    expect(user.valid?).to eq(true)
  end

  it 'is invalid if no matching password confirmation for the password' do
    user = FactoryGirl.build(:user)
    user.password = 'password'
    user.password_confirmation = 'bad password'

    expect(user.valid?).to eq(false)
    expect(user.errors[:password_confirmation]).not_to be_blank
  end

  it 'is not an admin if the role is not admin' do
    user = FactoryGirl.create(:user)

    expect(user.admin?).to eq(false)
  end

  it 'is an admin if the role equals admin' do
    admin = FactoryGirl.create(:admin)

    expect(admin.admin?).to eq(true)
  end
end
