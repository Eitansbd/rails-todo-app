Rails.application.routes.draw do
  
  root 'todo_lists#index'
  resources :todo_lists do
    resources :todo_items, only: [:create, :destroy]
  end
  
  #get '/todo_lists/:todo_list_id/complete_all' to: 'todo_lists#complete_all'
  
  # post '/todo_lists/:todo_list_id/todo_items/:todo_item_id/toggle' to: 'todo_items#toggle'
  
end
