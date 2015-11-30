Rails.application.routes.draw do

  resources :projects do
  	resources :revisions
	resources :legals
  	resources :accountings
  end

  devise_for :users
  root to: "users#index"

end
