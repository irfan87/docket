Rails.application.routes.draw do
  get 'stores/index'

  root 'stores#index'

  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
