Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
end

Rails.application.routes.draw do
  post "touch/create_new" => "touch#create_new"
end
Rails.application.routes.draw do
  get "touch" => 'touch#list'
end
Rails.application.routes.draw do
  get "dashboard" => 'pages#dashboard'
end

Rails.application.routes.draw do
  get "clients/:id/name" => 'clients#client_name'
end

Rails.application.routes.draw do
  get "clients/:id/number" => 'clients#client_number'
end

Rails.application.routes.draw do
  get "clients/:id/notes" => 'clients#client_notes'

end
