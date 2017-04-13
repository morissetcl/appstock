Rails.application.routes.draw do
  root to: 'books#index'
  resources :books do
    resources :flows
  end
end
