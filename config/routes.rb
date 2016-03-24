Rails.application.routes.draw do
  devise_for :users 
  root to: "home#index"

# TOUCH 
  post "touch/create_new(/:client_id)" => "touch#create_new"

  get "touch" => 'touch#list'

  post "touch/search_touch" => "touch#search_touch"

# PAGES
  get "dashboard/business/:id" => 'pages#dashboard_business'
  
  # get "dashboard(/:client_id)" => 'pages#dashboard'

  get "onboard" => 'pages#onboard'

# CLIENTS
  get "clients/:id/name" => 'clients#client_name'

  get "clients/:id/number" => 'clients#client_number'

  get "clients/:id/notes" => 'clients#client_notes'

  get "clients/:id/update_status/:business_id" => 'clients#change_status'

  get "clients/:id/edit/:business_id" => 'clients#edit_client'

  post "clients/:id/update/:business_id" => 'clients#update_client'

  get "clients/new/:business_id" => 'clients#new'

  post "clients/add/:business_id" => 'clients#add'

  get "clients/view/:business_id(/:id)(/:active_only)" => 'clients#view'

  post "clients/info/:business_id" => 'clients#info'

  post "clients/:id/delete" => 'clients#delete'

#BUSINESSES
  get "businesses/view" => 'businesses#view'

  post "businesses/new" => 'businesses#new'

  get "businesses/:id/edit" => 'businesses#edit'

  post "businesses/:id/update" => 'businesses#update'

  post "businesses/:id/delete" => 'businesses#delete'

  get "businesses/:id/select/" => 'businesses#select'

  post "message" => 'message#current_message'


end

