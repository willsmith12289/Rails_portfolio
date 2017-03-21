Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  devise_for :users
  resources :posts do
    resources :comments
  end
  root "posts#index"

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/projects', to: 'pages#projects'
end
