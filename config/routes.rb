Rails.application.routes.draw do

  root 'sushirolls#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :users do
    resources :sushirolls
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
