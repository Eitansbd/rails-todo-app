require 'test_helper'

class NewListTest < ActionDispatch::IntegrationTest
  def setup
    @list1 = todo_lists(:list1)
  end
  
  test "new list happy path" do
    get new_todo_list_path
    
    assert_difference "TodoList.count", 1 do
      post todo_lists_path, params: { todo_list: { name: "Homework" } }
    end
    
    follow_redirect!
    
    assert_template 'todo_lists/index'
    assert_equal "You created a new list called Homework!", flash[:success]
  end
  
  test "list with empty name" do
    assert_no_difference "TodoList.count" do
      post todo_lists_path, params: { todo_list: { name: "" } }
    end
    
    assert_template 'todo_lists/new'
    assert_equal "Name can't be blank", flash[:error]
  end
  
  test "list with name longer than 100 characters" do
    assert_no_difference "TodoList.count" do
      post todo_lists_path, params: { todo_list: { name: "a" * 101 } }
    end
    
    assert_template 'todo_lists/new'
    assert_equal "Name is too long (maximum is 100 characters)", flash[:error]
  end
  
  test "list that already exsit" do 
    assert_no_difference "TodoList.count" do
      post todo_lists_path, params: { todo_list: { name: @list1.name } }
    end
    
    assert_template 'todo_lists/new'
    assert_equal "Name has already been taken", flash[:error]
  end
  
  test "new list links" do
    get new_todo_list_path
    assert_select "a[href=?]", root_url, count: 2
  end
end
