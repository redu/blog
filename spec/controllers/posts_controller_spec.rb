require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController, 'creating a new post' do
  render_views

  it 'should redirect to post on successful save.' do
    FactoryGirl.build(:post)
    post 'create'
  end

  it 'should re-render new template on failed save.'

end
