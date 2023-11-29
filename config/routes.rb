Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcomes#index"
  get "/artists/", to: "musicians#index"
  get "/artists/synthesizer/", to: "synthesizers#index"
end
