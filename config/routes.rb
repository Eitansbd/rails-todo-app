Rails.application.routes.draw do
  
  root 'todo_lists#index'
  resources :todo_lists do
    resources :todo_items, only: [:create, :destroy] do
      patch :toggle, to: 'todo_items#toggle'
    end
    patch :complete_all, to: 'todo_lists#complete_all'
  end

  
end
