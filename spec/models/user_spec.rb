require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  subject { Factory(:user) }

  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value('foo').for(:email) }
  it { should_not allow_value('').for(:email) }
  it { should_not allow_value('example@example.com').for(:email) }
  it { should allow_value('example@redu.com.br').for(:email) }
  it { should have_many(:posts) }
end
