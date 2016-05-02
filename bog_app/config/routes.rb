Rails.application.routes.draw do
  root "creatures#index"

  get "/creatuers", to: "creatures#index", as: "creatures"



end
