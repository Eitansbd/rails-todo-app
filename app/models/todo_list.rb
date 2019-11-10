class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  
  validates :name, presence: true, 
                  length: { maximum: 100 },
                  uniqueness: { case_sensitive: false}
                  
  scope :all_with_item_completed_counts, 
        -> { TodoList.select("todo_lists.*, COUNT(todo_items.id) AS todo_items_count, COUNT(CASE WHEN completed = 't' THEN 1 END) AS todo_items_completed")
        .left_outer_joins(:todo_items)
        .group(:id) }
        
  def complete?
    self.todo_items_count == todo_items_completed
  end
end
