class Post < ActiveRecord::Base
  attr_accessible :title, :tag_list
  acts_as_taggable
  tinted_tags base: 'black', tint: 'white'
end
