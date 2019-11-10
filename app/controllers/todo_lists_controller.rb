class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all_with_item_completed_counts
  end

  def show
    @todo_list = TodoList.find(params[:id])
    @todo_items = @todo_list.todo_items.map(&:dup)
    
    @todo_item = @todo_list.todo_items.build
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    
    if @todo_list.save
      flash[:success] = "You created a new list called #{@todo_list.name}!"
      redirect_to root_url
    else
      flash.now[:error] = @todo_list.errors.full_messages.first
      render 'new'
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:id])
    
    if @todo_list.update_attributes(todo_list_params)
      flash[:success] = "You changed the list name"
      redirect_to todo_list_url @todo_list
    else
      flash[:error] = @todo_list.errors.full_messages.first
      render 'edit'
    end
  end

  def destroy
    TodoList.find(params[:id]).destroy
    
    flash[:success] = "List deleted"
    
    redirect_to root_url
  end
  
  def complete_all
    
  end
  
  private
    
    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end
