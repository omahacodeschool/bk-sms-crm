Rails.application.routes.draw do
  devise_for :users 
  root to: "home#index"

# TOUCH 
  post "touch/create_new(/:client_id)" => "touch#create_new"

  get "touch" => 'touch#list'

  post "touch/search_touch" => "touch#search_touch"

# PAGES
  get "dashboard/business/(:id)" => 'pages#dashboard_business'
  
  # get "dashboard(/:client_id)" => 'pages#dashboard'

  get "onboard" => 'pages#onboard'

# CLIENTS
  get "clients/:id/name" => 'clients#client_name'

  get "clients/:id/number" => 'clients#client_number'

  get "clients/:id/notes" => 'clients#client_notes'

  get "clients/:id/update_status" => 'clients#change_status'

  get "clients/:id/edit" => 'clients#edit_client'

  post "clients/:id/update" => 'clients#update_client'

  get "clients/new" => 'clients#new'

  post "clients/add" => 'clients#add'

  get "clients/info/(:id)" => 'clients#info'

  post "clients/view" => 'clients#view'


# USER
  get "settings" => "user#settings"

  get "user/:id" => "user#change_user_settings"

  get "user/:id/update" => "user#change_business_settings"


#BUSINESSES
  post "businesses/:user_id/new" => 'businesses#new'


end

