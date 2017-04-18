Rails.application.routes.draw do
  devise_for :users
  mount AppStock::Base => '/'
  root to: 'books#index'
  resources :books do
    resources :flows
  end
end
