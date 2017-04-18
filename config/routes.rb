Rails.application.routes.draw do
  mount AppStock::API => '/'

  root to: 'books#index'
  resources :books do
    resources :flows
  end
end
