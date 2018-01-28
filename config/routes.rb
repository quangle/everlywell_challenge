Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users do
  end

  post 'user/:id/expert-search', to: 'users#expert_search', as: 'expert_search'
end
