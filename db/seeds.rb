require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

3.times do |num|
  list = TodoList.create(name: "list #{num + 1}")
  
  3.times do |num|
    list.todo_items.create(name: "item #{num + 1}", complete: completed)
  end
  
end
