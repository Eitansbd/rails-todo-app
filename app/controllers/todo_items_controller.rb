class TodoItemsController < ApplicationController
  def create
    todo_item = new_todo_item
    
    if todo_item.save
      flash[:success] = "You created the todo item"
      
      redirect_to todo_list_url(params[:todo_list_id]) 
    else 
      flash[:error] = todo_item.errors.full_messages.first
      render '/new'
    end
  end

  def toggle
    todo_item = TodoItem.find_by(id: params[:todo_item_id], todo_list_id: params[:todo_list_id])
    
    todo_item.toggle!(:completed)

    redirect_to todo_list_url(params[:todo_list_id])
  end

  def destroy
    todo_item = TodoItem.find_by(id: params[:id], todo_list_id: params[:todo_list_id])
    
    if todo_item.destroy
      flash[:success] = "Todo item deleted"
    else
      flash[:error] = "There was an error deleting the todo"
    end
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
