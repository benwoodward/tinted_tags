require 'spec_helper'

describe "Tinted Tags" do
  before(:each) do
    Post.delete_all
    ActsAsTaggableOn::Tag.delete_all
    ActsAsTaggableOn::Tagging.delete_all
  end

  it "updates tag tints after save" do
    p = Post.new
    p.tag_list = 'one, two, three'
    p.save
    ActsAsTaggableOn::Tag.first.tint.should_not be_nil
  end
end
