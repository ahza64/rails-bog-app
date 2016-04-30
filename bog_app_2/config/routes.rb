Rails.application.routes.draw do
  root to: "creatures#index"

  get "/creatures", to: "creatures#index", as: "creatures"

end
