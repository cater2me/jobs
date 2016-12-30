RssReaderExample::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  match '/posts' => 'home#posts', :as => :posts
  match '/posts/:feed_url/:post_title' => 'home#post', :as => :post
  devise_for :users
  resources :users


end