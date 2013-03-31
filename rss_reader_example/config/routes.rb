RssReaderExample::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  match '/posts' => 'home#posts', :as => :posts
  devise_for :users
  resources :users


end