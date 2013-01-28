require 'compass'

module TintedTags
  class TagTinter
    def initialize(col1, col2, options={})
      @colour1 = col1
      @colour2 = col2
      @opts = {tint_strategy: :percentage_of_total_taggings}.merge options
    end

    def update_tints
      Post.tag_counts_on(:tags).each do |tag|
        percent = percentage(tag.count)
        tag.tint = evaluate("mix(#{@colour1}, #{@colour2}, #{percent})")
        tag.save
      end
    end

    private

    def percentage(count)
      return percentage_of_total(count) unless @opts[:tint_strategy] == :rated_as_range
      percentage_within_range(count)
    end

    def percentage_of_total(count)
      total = Post.tag_counts_on(:tags).map(&:count).inject(:+)
      ((count * 100) / total).round(2)
    end

    def percentage_within_range(count)
      max = Post.tag_counts_on(:tags).order('count desc').first.count
      min = Post.tag_counts_on(:tags).order('count desc').last.count
      ((100 * (count-min)) / (max-min)).round(2)
    end

    def evaluate(value)
      Sass::Script::Parser.parse(value, 0, 0).perform(Sass::Environment.new).to_s
    end
  end
end
