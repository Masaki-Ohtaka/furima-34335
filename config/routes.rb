Rails.application.routes.draw do
  devise_for :users
  resources :itemes, only: :index
end
