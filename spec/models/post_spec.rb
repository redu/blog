require File.dirname(__FILE__) + '/../spec_helper'

describe Post do

  it 'must be valid when built by FactoryGirl.' do
    post = FactoryGirl.build(:post)
    post.should be_valid
  end

  it 'must have a valid title.' do
    post = FactoryGirl.build(:post, :title => '')
    post.should_not be_valid
  end
end
