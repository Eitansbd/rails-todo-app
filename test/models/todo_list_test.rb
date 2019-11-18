require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  def setup
    @todo_list = TodoList.new(name: "Test List")
    @todo_list.todo_items = [todo_items(:item1), todo_items(:item2), todo_items(:item3)]
  end
  
  test "should be valid" do
    assert @todo_list.valid?
  end
  
  test "name should be present" do
    @todo_list.name = ""
    assert_not @todo_list.valid?
  end
  
  test "name should be less than 100 characters" do 
    @todo_list.name = 'a' * 101
    assert_not @todo_list.valid?
  end
  
  test "name should be unique not case sensitive" do
    @duplicate_todo_list = @todo_list.dup
    @duplicate_todo_list.name.upcase!
    @todo_list.save
    
    assert_not @duplicate_todo_list.valid?
  end
  
  test "completed_todos_count with some complete" do
    assert_equal 2, @todo_list.completed_todos_count
  end
  
  test "#complete? when list is has no items" do 
    @todo_list.todo_items = []
    
    assert_not @todo_list.complete?
  end
  
  test "#complete? when list is not complete" do 
    assert_not @todo_list.complete?
  end
  
  test "#complete? when list is complete" do 
    @todo_list.todo_items.each { |item| item[:completed] = true }
    assert @todo_list.complete?
  end
end
