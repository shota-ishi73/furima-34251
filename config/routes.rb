Rails.application.routes.draw do

  devise_for :users
  get 'items/index'
  root to: 'items#index'

  resources :users

  resources :items, only: [:index, :new, :create] do
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
