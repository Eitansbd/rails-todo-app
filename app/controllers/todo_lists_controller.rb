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
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def complete_all
    
  end
end
