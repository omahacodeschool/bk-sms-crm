Rails.application.routes.draw do
  devise_for :users 
  root to: "home#index"

# TOUCH 
  get "touch/incoming" => "touch#save_incoming_sms"

  get "touch/new/:client_id" => "touch#show_new_form"
  
  post "touch/create_new/:client_id" => "touch#create_new"

  get "touch" => 'touch#list'

  post "touch/search_touch" => "touch#search_touch"

  get "touch/current_thread/:client_id" => "touch#current_conversation_thread"

# PAGES
  get "dashboard/business/:id" => 'pages#dashboard_business'
  
# CLIENTS
  get "clients/:id/name" => 'clients#client_name'

  get "clients/:id/number" => 'clients#client_number'

  get "clients/:id/notes" => 'clients#client_notes'

  get "clients/:id/update_status" => 'clients#change_status'

  get "clients/:id/edit(/:business_id)" => 'clients#edit_client'

  post "clients/:id/update/:business_id" => 'clients#update_client'

  get "clients/new/:business_id" => 'clients#new'

  post "clients/add/:business_id" => 'clients#add'

  get "clients/view/:business_id(/:id)" => 'clients#view'

  get "dashboard/business/clients/profile/:id" => 'clients#profile'

  post "clients/info/:business_id" => 'clients#info'

  post "clients/:id/delete/:business_id" => 'clients#delete'

#BUSINESSES
  get "businesses/view" => 'businesses#view'

  post "businesses/new" => 'businesses#new'

  get "businesses/:id/edit" => 'businesses#edit'

  post "businesses/:id/update" => 'businesses#update'

  post "businesses/:id/delete" => 'businesses#delete'

  get "businesses/:id/select/" => 'businesses#select'

  get "dashboard/business/message/:client_id" => 'message#current_messages'

  get "dashboard/business/current_thread/:client_id" => "touch#current_conversation_thread"

  post "dashboard/business/send_message/:client_id"  => "touch#send_sms"

end

