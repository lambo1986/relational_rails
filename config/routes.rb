Rails.application.routes.draw do
  # resources :musicians
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcomes#index"
  get "/musicians", to: "musicians#index"
  get "/musicians/new", to: "musicians#new" #why did this need to go before musicians#show
  get "/musicians/:id", to: "musicians#show"
  get "/synthesizers", to: "synthesizers#index"
  get "/synthesizers/:id", to: "synthesizers#show"
  get "/musicians/:musician_id/synthesizers", to: "musicians_synthesizers#index"
  post "/musicians", to: "musicians#create"
  get  "/musicians/:id/edit", to: "musicians#edit"
  patch "/musicians/:id/edit", to: "musicians#update"
end
