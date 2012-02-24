require File.dirname(__FILE__) + '/../spec_helper' #carrega o que for necessário

describe Post do

  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:tags) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it 'must be valid when built by FactoryGirl.' do
    post = FactoryGirl.create(:post)
    post.should be_valid
  end

  it 'must have a valid title.' do
    post = FactoryGirl.build(:post, :title => '')
    post.should_not be_valid
  end

end
