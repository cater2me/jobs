SimpleRss::Application.routes.draw do
  root to: "feeds#index"
  resource :feed, only: :create
end
