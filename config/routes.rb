Rails.application.routes.draw do
  post 'attachments/attach'
  get 'attachments/remove/:id', to: 'attachments#remove'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
