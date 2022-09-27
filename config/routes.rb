Rails.application.routes.draw do


  resources :departments, only: [:index, :show]
end
