Doxnews::Application.routes.draw do
  root "welcome#index"

  resources :posts, only: [:new, :create, :index]
end
