Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
end

Rails.application.routes.draw do
  post "touch/create_new" => "touch#create_new"
end
