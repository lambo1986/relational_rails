Rails.application.routes.draw do
  # resources :musicians
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcomes#index"
  get "/musicians", to: "musicians#index"
  get "/musicians/:id", to: "musicians#show"
  get "/synthesizers", to: "synthesizers#index"
  get "/synthesizers/:id", to: "synthesizers#show"
  get "/musicians/:musician_id/synthesizers", to: "musicians_synthesizers#index"
end
