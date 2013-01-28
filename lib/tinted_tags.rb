require "tinted_tags/engine"
require "tinted_tags/tag_tinter"

module TintedTags
  def tinted_tags
    class_eval do
      attr_accessible :tag_list
      after_save :update_tints, if: :tag_list_changed?

      private

      def update_tints
        TagTinter.new('black', 'white').update_tints
      end
    end
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend TintedTags
  end
end

