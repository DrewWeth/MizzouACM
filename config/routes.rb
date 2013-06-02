Mizzouacm::Application.routes.draw do

  resources :projects


  resources :events


  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ] do
    resources :skills, :only => [:create]
  end
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'

  get ':action' => 'static#:action'
end
