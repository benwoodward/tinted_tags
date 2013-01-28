class TintedTaggableModel < ActiveRecord::Base
  acts_as_taggable
  tint_tags
end
