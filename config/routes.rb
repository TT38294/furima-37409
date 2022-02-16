Rails.application.routes.draw do
  devise_for :users
  root to: "items#index" 
<<<<<<< Updated upstream
#  resources :items, only: [:new, :create]
=======
  resources :items, only: [:new, :create]
>>>>>>> Stashed changes
end
