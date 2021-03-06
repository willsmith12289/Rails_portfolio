Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  devise_for :users
  
  resources :posts do
    resources :comments
  end

  root "posts#index"

  resources :projects
  resources "messages", only: [:new, :create]
  get '/about', to: 'pages#about'
  get '/contact', to: 'messages#new', as: 'contact'
  post '/contact', to: 'messages#create'
  
end
