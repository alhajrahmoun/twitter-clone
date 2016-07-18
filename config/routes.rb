Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"  
  }
  devise_scope :user do
  get "/users/sign_out", to: "users/sessions#destroy"
  end

resources :tweets
  
root 'tweets#index'

end
