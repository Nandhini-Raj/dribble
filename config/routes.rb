Rails.application.routes.draw do
  get 'posts/profile'
  get 'posts/destroy_all'
  get 'users/show'
  devise_for :users
  resources :posts do
     member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
     end
     resources :comments
    end
    root 'posts#index'

  match '/posts',   to: 'posts#profile',   via: 'get'

  match '/posts', to: 'posts#destroy_all', via: 'delete'
end
