Rails.application.routes.draw do
  get "/one_contact_url" => 'entries#one_contact_method'
  get "/all_contact_url" => 'entries#all_contact_method'
end
