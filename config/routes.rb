Rails.application.routes.draw do
  get "otp/send_otp"
  get "otp/verify_otp", to: "otp#verify_otp"
  post "otp/verify_otp", to: "otp#verify_otp"


  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :friends
  
  
  get 'home/about'
  root 'home#index'
end

