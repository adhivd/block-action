Rails.application.routes.draw do
  resources :claims
  resources :lawsuits
  get 'dashboard/index'
  devise_for :holders
  devise_for :admins
  root to: 'dashboard#index'
  patch '/distribute', to: "lawsuits#distribute", as: 'distribute'
  post '/registerclaim', to: 'dashboard#register', as: 'registerclaim'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
