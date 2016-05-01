Rails.application.routes.draw do
  root "creatures#index", to: "creatures#index"

  get "/creatures", to: "creatures#index", as: "creatures"
  get "/creatures/new", to: "creatures#new", as: "new_creatures"

end
