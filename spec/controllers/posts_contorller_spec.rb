require 'spec_helper'

describe PostsController, type: :controller do
  it "lists all published posts" do
    post1 = create(:post, state: "published")
    post2 = create(:post, state: "published")
    post3 = create(:post)

    get :index

    should render_template(:index)
    assigns(:posts).should == [post1, post2]
  end

  it "creates a post" do
    post :create, post: { url: "http://url.com", title: "Test" }
    should redirect_to posts_path
  end
end
