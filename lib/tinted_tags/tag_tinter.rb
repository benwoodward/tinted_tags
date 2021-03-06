require 'compass'

module TintedTags
  class TagTinter
    def initialize(klass, opts={})
      @base = opts[:base]
      @tint = opts[:tint]
      @strategy = opts[:strategy]
      @klass = klass
    end

    def update_tints
      @klass.tag_counts_on(:tags).each do |tag|
        percent = percentage(tag.count)
        tag.tint = evaluate("mix(#{@base}, #{@tint}, #{percent})")
        tag.save
      end
    end

    private

    def percentage(count)
      return percentage_of_total(count) unless @strategy == :rated_as_range
      percentage_within_range(count)
    end

    def percentage_of_total(count)
      total = @klass.tag_counts_on(:tags).map(&:count).inject(:+)
      ((count * 100) / total).round(2)
    end

    def percentage_within_range(count)
      max = @klass.tag_counts_on(:tags).order('count desc').first.count
      min = @klass.tag_counts_on(:tags).order('count desc').last.count
      ((100 * (count-min)) / (max-min)).round(2)
    end

    def evaluate(value)
      Sass::Script::Parser.parse(value, 0, 0).perform(Sass::Environment.new).to_s
    end
  end
end
