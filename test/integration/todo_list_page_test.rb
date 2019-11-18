require 'test_helper'

class TodoListPageTest < ActionDispatch::IntegrationTest
  def setup
    @todo_list = todo_lists(:list1)
    visit todo_list_url(@todo_list)
  end
  
  test "visit edit list" do
    click_link("Edit list")
    
    assert_equal edit_todo_list_path(@todo_list), current_path
  end
  
  test "visit home page" do 
    click_link("To Do Tracker") 
    
    assert_equal root_path, current_path
  end
  
  test "visit all lists" do 
    click_link("All Lists")
    
    assert_equal root_path, current_path
  end
  
  test "enter a new todo item" do
    todo_item_name = "Another Item"
    within '#new_todo_item' do
      fill_in 'todo_item_name', with: todo_item_name
      click_button 'Save'
    end
    
    assert page.has_selector?('.todo-item h3') { |ele| ele.text == todo_item_name }
    
    assert page.has_content? "You created the todo item"
  end
  
  test "delete a todo item" do
    first_todo_item = first('li.todo-item')
    text = first_todo_item.text
  
    within first_todo_item do 
      click_link class: 'delete'
    end
    
    assert page.has_content? "Todo item deleted"
    assert page.has_no_content? text
  end
  
  test "mark a todo item complete" do
    completed_item = first('li.todo-item.complete')
    text = completed_item.text
    
    within completed_item do
      click_link class: 'check'
    end
    
    page.find('li.todo-item.incomplete') do |ele|
      ele.text == text
    end
  end
  
  test "mark all todos complete" do 
    assert page.has_selector?('li.incomplete')
    assert page.has_no_selector?('section.complete')
    
    click_link 'Complete All'
    
    assert page.has_no_selector?('li.incomplete')
    assert page.has_selector?('li.complete')
  end
end
