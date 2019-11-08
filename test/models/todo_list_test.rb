require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  def setup
    @todo_list = TodoList.new(name: "Test List")
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
  
  test "name should be unique" do
    @duplicate_todo_list = @todo_list.dup
    @duplicate_todo_list.name.upcase!
    @todo_list.save
    
    assert_not @duplicate_todo_list.valid?
  end
end
