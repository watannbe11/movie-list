Rails.application.routes.draw do
  root to: 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end
end
