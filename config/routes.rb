Rails.application.routes.draw do
  devise_for :users 
  root to: "home#index"

  post "touch/create_new" => "touch#create_new"

  get "touch" => 'touch#list'
  
  get "dashboard(/:client_id)" => 'pages#dashboard'

  get "clients/:id/name" => 'clients#client_name'

  get "clients/:id/number" => 'clients#client_number'

  get "clients/:id/notes" => 'clients#client_notes'

  get "clients/:id/update_status" => 'clients#change_status'

  get "clients/:id/edit" => 'clients#edit_client'

  post "clients/:id/update" => 'clients#update_client'

  get "clients/new" => 'clients#new'

  post "clients/add" => 'clients#add'

  post "clients/view" => 'clients#view'

  post "touch/search_touch" => "touch#search_touch"

  get "settings" => "user#settings"

  get "user/add_new_business" => "user#add_new_business"

  get "user/:id" => "user#change_user_settings"

  get "user/:id/update" => "user#change_business_settings"

end

