module TintedTags
  module ViewHelpers
    def tinted_tag_cloud tags
      content_tag(:ul, nil, class: "tinted-tag-cloud") do
        tags.map do |tag|
          concat(content_tag(:li, tag.name, style: ("background-color: #{tag.tint}")))
        end
      end
    end
  end
end
