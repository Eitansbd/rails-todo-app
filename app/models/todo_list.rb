class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destory
  
  validates :name, presence: true, 
                  length: { maximum: 100 },
                  uniqueness: { case_sensitive: false}
end
