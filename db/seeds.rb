3.times do |num|
  list = TodoList.create(name: "list #{num + 1}")
  
  3.time do |num|
    list.todo_items.create(name: "item #{num + 1}")
  end
  
end
