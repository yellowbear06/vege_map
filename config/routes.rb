Rails.application.routes.draw do
  get 'top', to: 'top#index'
  get 'inquiry', to: 'inquiry#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
