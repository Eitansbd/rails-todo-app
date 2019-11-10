class TodoItemsController < ApplicationController
  def create
    todo_item = new_todo_item
    
    todo_item.save
    
    redirect_to todo_list_url(params[:todo_list_id]) 
  end

  def toggle
  end

  def destroy
  end
  
  private
    def new_todo_item
      TodoItem.new do |item|
        item.name = params[:todo_item][:name]
        item.todo_list_id = params[:todo_list_id]
      end
    end
end
