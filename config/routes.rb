Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
end

Rails.application.routes.draw do
  get "clients/name" => 'clients#name'
end

Rails.application.routes.draw do
  get "clients/number" => 'clients#number'
end

Rails.application.routes.draw do
  get "clients/notes" => 'clients#notes'
end
