require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  def setup
    @todo_list = TodoList.new(name: "Test List")
    @todo_item = @todo_list.todo_items.build(name: "Test Item")
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
    @duplicate_todo_item.name.upcase!
    
    @todo_list.save
    
    assert_not @duplicate_todo_item.valid?
  end
  
  test "name can be duplicate between lists" do 
    @duplicate_todo_list = @todo_list.dup
    @duplicate_todo_list.todo_items = @todo_list.todo_items
    @todo_list.save
    
    assert @duplicate_todo_list.todo_items.first.valid?
  end
end


