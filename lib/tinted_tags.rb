require "tinted_tags/engine"
require "tinted_tags/tag_tinter"
require "view_helpers/view_helpers"

module TintedTags

  def tinted_tags(opts={})
    class_attribute :opts
    self.opts = opts

    class_eval do

      attr_accessible :tag_list
      after_save :update_tints, if: :tag_list_changed?

      private

      def update_tints
        TagTinter.new(self.class, opts).update_tints
      end
    end
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend TintedTags
  end
end

