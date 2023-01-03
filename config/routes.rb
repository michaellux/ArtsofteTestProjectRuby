Rails.application.routes.draw do
  get "add", to: "list_employee#add", as: :add
  get "names" => "list_employee#names", as: "names"
  get "edit", to: "list_employee#edit"
  post "add", to: "list_employee#create"
  patch "edit", to: "list_employee#update"
  delete "delete", to: "list_employee#destroy"

  get "department", to: "department#add"
  post "department", to: "department#create"
  get "language", to: "programming_language#add"
  post "language", to: "programming_language#create"
  
  root to: "list_employee#index"
end
