Rails.application.routes.draw do
 devise_for :users
 
 root to: "clients#index"

 resources :clients do
   resources :contacts
   get 'report', on: :collection
   
 end                
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
