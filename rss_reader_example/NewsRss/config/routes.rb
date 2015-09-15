NewsReader::Application.routes.draw do
  resources :users
  resource :session
  namespace :api do
    resources :feeds, only: [:index, :create, :show, :destroy]
    resources :entries, only: [:index]

  end

  root to: "static_pages#index"
end
