Rails.application.routes.draw do
  mount AppStock::Base => '/'
  root to: 'books#index'
  resources :books do
    resources :flows
  end
end
