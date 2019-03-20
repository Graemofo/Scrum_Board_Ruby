Rails.application.routes.draw do
  get 'managers/index'
  get 'home/index'
  get 'login', to: 'devise/registrations#new'
  #get 'devise/sessions#new'
  get 'sign_out', to: 'devise/sessions#destroy'
#  match ':controller(/:action(/:id))', :via => :get
  root 'home#index'
  get 'projects/show', to: 'projects#show'
#  resources :projects
  # resources :managers do
  #   resources :projects
  # end

  resources :tasks
  resources :projects do
    resources :tasks
  end
  devise_for :users do
    resources :tasks
  end
  devise_for :managers do
    resources :projects
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
