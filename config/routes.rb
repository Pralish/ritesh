Rails.application.routes.draw do
  resources :departments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "departments#index"
end