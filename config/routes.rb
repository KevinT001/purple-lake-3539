Rails.application.routes.draw do

  resources :departments, only: [:index]

  resources :employees, only: [:show]
end
