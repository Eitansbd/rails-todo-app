Rails.application.routes.draw do
  
  root 'todo_lists#index'
  resources :todo_lists
  
  post '/todo_list/complete_all'
end
