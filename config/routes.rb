Rails.application.routes.draw do
  resources :musicians
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcomes#index"
  get "/musicians", to: "musicians#index"
  get "/musicians/id:", to: "musicians#show"
  get "/musicians/synthesizers", to: "synthesizers#index"
end
