Doxnews::Application.routes.draw do
  root "welcome#index"

  resources :posts do
    member do
      post :up_vote
      post :down_vote
    end
  end
  resources :users
  resources :sessions

  get  'my_posts' => 'posts#my_posts'
  get  'log_in'   => 'users#log_in'
  post 'log_out'  => 'sessions#log_out'
end
