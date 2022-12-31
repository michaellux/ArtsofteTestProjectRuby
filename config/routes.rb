Rails.application.routes.draw do
  get "add", to: "list_employee#add", as: :add
  get "edit", to: "list_employee#edit"

  get "department", to: "department#add"
  get "language", to: "programming_language#add"
  
  root to: "list_employee#index"
end
