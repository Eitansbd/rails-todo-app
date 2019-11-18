class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.eager_load(:todo_items).order(:created_at)
  end

  def show
    @todo_list = TodoList.find(params[:id])
    @todo_items = @todo_list.todo_items.order(:completed, :created_at) 
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
    TodoItem.where(todo_list_id: params[:todo_list_id]).update_all(completed: true)
    
    redirect_to todo_list_path(params[:todo_list_id])
  end
  
  private
    
    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end
