Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get "touch" => 'touch#list'
  
  get "dashboard" => 'pages#dashboard'

  get "clients/:id/name" => 'clients#client_name'

  get "clients/:id/number" => 'clients#client_number'

  get "clients/:id/notes" => 'clients#client_notes'

  get "clients/:id/update_status" => 'clients#change_status'

  get "clients/:id/edit" => 'clients#edit_client'

  post "clients/:id/update" => 'clients#update_client'
end