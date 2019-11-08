require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @todo_list1 = todo_lists(:list1)
  end
  
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get show" do
    get todo_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get todo_lists_new_url
    assert_response :success
  end

  test "should get edit" do
    get todo_lists_edit_url
    assert_response :success
  end



end
