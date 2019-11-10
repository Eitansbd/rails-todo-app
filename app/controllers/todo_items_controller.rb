class TodoItemsController < ApplicationController
  def create
    todo_item = new_todo_item
    
    todo_item.save
    flash[:success] = "You created the todo item"
    
    redirect_to todo_list_url(params[:todo_list_id]) 
  end

  def toggle
  end

  def destroy
    todo_item = TodoItem.find_by(id: params[:id], todo_list_id: params[:todo_list_id])
    
    todo_item.destroy
    
    flash[:success] = "Todo item deleted"
    
    redirect_to todo_list_url(params[:todo_list_id])
  end
  
  private
    def new_todo_item
      TodoItem.new do |item|
        item.name = params[:todo_item][:name]
        item.todo_list_id = params[:todo_list_id]
      end
    end
end
