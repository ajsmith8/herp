Assoc::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :topics
  resources :sessions
  resources :tags
  resources :relationships, only: [:create, :destroy]
  resources :bookmarks
  resources :comments
  resources :scorings
  resources :commentscorings
  resources :suggestededits
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/contact', to: 'pages#contact'
  match '/about',   to: 'pages#about'
  match '/help',    to: 'pages#help'
  match '/taglist', to: 'pages#taglist'
  match '/topicdiscovery', to: 'pages#topicdiscovery'
  #match '/topiclist',    to: 'pages#topiclist'
  
  root to: 'pages#home'

end
