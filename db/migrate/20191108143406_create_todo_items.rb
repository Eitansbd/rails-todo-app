class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.text :name
      t.references :todo_list, foreign_key: true
      
      t.index [:name, :todo_list_id], unique: true

      t.timestamps
    end
  end
end
