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
  get "/musicians/:id/synthesizers/sorted", to: "musicians_synthesizers#sorted"
  get "/musicians/:musician_id/synthesizers", to: "musicians_synthesizers#index"
  post "/musicians", to: "musicians#create"
  get  "/musicians/:id/edit", to: "musicians#edit"
  patch "/musicians/:id/edit", to: "musicians#update"
  get "/musicians/:id/synthesizers/new", to: "musicians_synthesizers#new"
  post "/musicians/:id/synthesizers/new", to: "musicians_synthesizers#create"
  get "/synthesizers/:id/edit", to: "synthesizers#edit"
  patch "/synthesizers/:id/edit", to: "synthesizers#update"
  delete "/musicians/:id", to: "musicians#destroy"
  delete "/synthesizers/:id", to: "synthesizers#destroy"
end
