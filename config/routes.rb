Rails.application.routes.draw do
  get 'items/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show] do
    resources :items
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
