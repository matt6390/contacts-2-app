Rails.application.routes.draw do
get "/entries" => 'entries#index'
post "/entries" => 'entries#create'
get "/entries/:id" => 'entries#show'
patch "/entries/:id" => 'entries#update'
delete "entries/:id" => 'entries#destroy'
end
