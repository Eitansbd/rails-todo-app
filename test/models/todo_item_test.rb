require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  def setup
    @todo_list = todo_lists(:list1)
    @todo_item = todo_items(:item1)
  end
  
  test "should be valid" do 
    assert @todo_item.valid?
  end
  
  test "name should be present" do
    @todo_item.name = ""
    
    assert_not @todo_item.valid?
  end
  
  test "name should be 100 characters or less" do 
    @todo_item.name = 'a' * 101
    
    assert_not @todo_item.valid?
  end
  
  test "name should be unique within same todo list" do
    @duplicate_todo_item = @todo_item.dup
    @duplicate_todo_item.todo_list = @todo_list
    
    assert_not @duplicate_todo_item.valid?
  end
  
  test "name can be duplicate between lists" do 
    @duplicate_todo_list = @todo_list.dup
    @duplicate_todo_list.todo_items = @todo_list.todo_items
    @todo_list.save
    
    assert @duplicate_todo_list.todo_items.first.valid?
  end
  
  test "item should be destroyed when list is destroyed" do
    number_of_todo_items = @todo_list.todo_items.count
    
    assert_difference "TodoItem.count", -number_of_todo_items do
      @todo_list.destroy
    end
  end
end


