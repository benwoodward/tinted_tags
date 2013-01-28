module TintedTags
  class Engine < ::Rails::Engine
    isolate_namespace TintedTags
    initializer 'tinted tags' do
      ActionView::Base.send :include, TintedTags::ViewHelpers
    end
  end
end
