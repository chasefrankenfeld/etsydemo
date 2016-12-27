Rails.application.routes.draw do

  devise_for :users
  resources :listings

  root "listings#index"

  get 'pages/about'
  get 'pages/contact'

  get 'seller', to: 'listings#seller'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
