Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :notes
post 'notes/ingrat'
root "notes#index"
end
