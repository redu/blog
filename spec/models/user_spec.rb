require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  it 'user built by FactoryGirl must be valid' do
    u = FactoryGirl.create(:user)
    u.should be_valid
  end

  it 'should validate_uniqueness_of email' do
    u = FactoryGirl.create(:user)
    FactoryGirl.create(:user, :email => u.email).should_not be_valid
  end

  it { should_not allow_value('foo').for(:email) }
  it { should_not allow_value('').for(:email) }
  it { should_not allow_value('example@example.com').for(:email) }
  it { should allow_value('example@redu.com.br').for(:email) }
  it { should have_many(:posts) }
end
