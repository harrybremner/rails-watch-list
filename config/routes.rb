Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :movies, only: [:new, :create]
    resources :bookmarks, only: [:new, :create]
  end
  resources :movies, only: [:destroy]
  resources :bookmarks, only: [:destroy]

end
