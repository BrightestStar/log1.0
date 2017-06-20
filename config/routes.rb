Rails.application.routes.draw do
  root 'logs#index'

  devise_for :users

  resources :logs do
    resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
