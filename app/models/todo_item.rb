class TodoItem < ApplicationRecord
  belongs_to :todo_list
  
  validates :name, presence: true, 
                   length: { maximum: 100 },
                   uniqueness: { scope: :todo_list_id }
                   
end
