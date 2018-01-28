Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  post 'user/:id/expert-search', to: 'users#expert_search', as: 'expert_search'
  post 'user/:id/:friend_id', to: 'users#add_friend', as: 'add_friend'
end
