Rails.application.routes.draw do

  resources :posts


  mount TintedTags::Engine => "/tinted_tags"
end
