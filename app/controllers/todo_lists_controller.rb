class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all_with_item_completed_counts
  end

  def show
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
  end

  def update
  end

  def destroy
  end
  
  def complete_all
    
  end
  
  private
    
    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end
