Rails.application.routes.draw do
  get 'bookmark/new'
  get 'bookmarks/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: %i[new create show destroy] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: %i[destroy]

  root to: "lists#index" #index becomes homepage
end
