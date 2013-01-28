require 'spec_helper'
require 'tag_tinter'

describe "Tag Tinter" do

  before(:each) do
    Post.delete_all
    ActsAsTaggableOn::Tag.delete_all
    ActsAsTaggableOn::Tagging.delete_all
  end

  context "calculate hex color to represent tag use as percentage of total taggings" do

    it "should give mix 25% white into black with four tags" do
      tags = ['red', 'yellow', 'green', 'blue']
      tags.each do |tag|
        Post.create(title: 'title', tag_list: tag)
      end
      TagTinter.new('black', 'white').update_tints
      ActsAsTaggableOn::Tag.first.tint.should eq '#bfbfbf'
    end

    it "should give mix 20% white into black with five tags" do
      tags = ['red', 'yellow', 'green', 'blue', 'orange']
      tags.each do |tag|
        Post.create(title: 'title', tag_list: tag)
      end
      TagTinter.new('black', 'white').update_tints
      ActsAsTaggableOn::Tag.first.tint.should eq '#cccccc'
    end
  end

  context "calculate percentage value from position within range" do
    it "should calculate hex color percentage as position within min-max tag usage range" do
      10.times { Post.create(title: 'title', tag_list: 'max') }
      5.times { Post.create(title: 'title', tag_list: 'median') }
      1.times { Post.create(title: 'title', tag_list: 'min') }
      TagTinter.new('black', 'white', tint_strategy: :rated_as_range).update_tints
      # 'median' tag should be 44% (1 being 0%, 10 being 100%)
      t = ActsAsTaggableOn::Tag.where(name: 'median').first
      t.tint.should eq '#8e8e8e'
    end
  end
  
end
