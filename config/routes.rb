Rails.application.routes.draw do
  get 'top', to: 'top#index'
  get 'inquiry', to: 'inquiry#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
