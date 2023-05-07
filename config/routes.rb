Rails.application.routes.draw do
  get 'top', to: 'top#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'contact', to: 'contact#index'
  resources :users, only: %i[new create]
  resources :mypage, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
