Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'top#index'
  get 'top', to: 'top#index'
  resources :place, only: %i[index new create edit update show] do
    collection do
      get :fetch_place_ids
    end
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'contact', to: 'contact#index'
  resources :users, only: %i[new create]
  resources :mypage, only: %i[show edit update]
  resources :user_lists, only: %i[new create edit update destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
