require 'test_helper'

class TodoListsIndexTest < ActionDispatch::IntegrationTest
  def setup
    visit(root_url)
    @todo_list = todo_lists(:list1)
  end
  
  test "visit list show page" do
    click_link (@todo_list.name)
    
    assert_equal todo_list_path(@todo_list), current_path
  end
  
  test "visit new list page" do 
    click_link("New List")
    
    assert_equal new_todo_list_path, current_path
  end
end
