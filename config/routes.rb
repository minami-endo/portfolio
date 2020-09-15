Rails.application.routes.draw do
  root to: 'public/items#home'

  namespace :public do
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      registrations: 'public/users/registrations',
      passwords: 'public/users/passwords',
    }

    get 'recipes/ranking', to: 'recipes#ranking', as: 'recipes_ranking'
    resources :recipes

    post '/like/:recipe_id', to: 'likes#like', as: 'like'
    delete '/like/:recipe_id', to: 'likes#unlike', as: 'unlike'

    resources :items, only: [:index, :show]

    get 'users/unsubscribe', to: 'users#unsubscribe', as: 'user_unsubscribe'
    patch 'users/withdraw', to: 'users#withdraw', as: 'user_withdraw'
    resources :users, only: [:show, :edit, :update]

    get 'gifts/nowgift', to: 'gifts#nowgift', as: 'nowgift'
  end

  namespace :admins do
    devise_for :admins, controllers: {
      sessions: 'admins/admins/sessions',
      passwords: 'client/admins/passwords',
    }

    get 'recipes/home', to: 'recipes#home', as: 'recipe_home'
    get 'recipes/top', to: 'recipes#top', as: 'recipe_top'
    resources :recipes, only: [:index, :show]

    resources :items

    resources :users, only: [:index, :show]

    get 'gifts/nowgift', to: 'gifts#nowgift', as: 'nowgift'
    resources :gifts, only: [:new, :create, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
