Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json} do
    resources :feeds, only: [:create, :index, :show]
  end
end
