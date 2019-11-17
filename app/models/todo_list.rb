class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  
  validates :name, presence: true, 
                  length: { maximum: 100 },
                  uniqueness: { case_sensitive: false}
                  
  def complete?
    todo_items_count = todo_items.size
    todo_items_count > 0 && todo_items_count == completed_todos_count
  end
  
  def completed_todos_count
    todo_items.count { |item| item[:completed] }
  end
end
