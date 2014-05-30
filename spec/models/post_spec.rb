require 'spec_helper'

describe "Post" do
  it "requries a title" do
    expect {
      create(:post, title: false)
    }.to raise_error(ActiveRecord::RecordInvalid)

  end

  it "requires a url" do
    expect {
      create(:post, url: nil)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
