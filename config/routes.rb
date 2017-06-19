Rails.application.routes.draw do
  devise_for :users
  resources :logs
  root 'logs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
