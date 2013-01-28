require 'spec_helper'

describe ActsAsTaggableOn::Tag do
  include ActsAsTaggableOn

  @tag = ActsAsTaggableOn::Tag.new

  it "should have a tint attribute" do
    @tag.tint = '#fff000'
    @tag.save
  end
end
