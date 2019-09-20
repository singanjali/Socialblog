Rails.application.routes.draw do
  
  
  resources :posts

  get 'users/sign_in', as: "user_sign_in"
  post 'users/create_session', as: "user_create_session"
  delete 'users/sign_out', as: "user_sign_out"
  


  get 'users/index' 
  get 'users/new'  
  get 'users/:id' => "users#show"
  delete 'users/:id' => "users#delete", as: "user_delete"
  get 'users/:id/edit' => "users#edit", as: "user_edit"
  patch 'users/:id/update' => "users#update", as: "user"
  post '/users/create', as: 'users'
  
  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
