class CreateTodo < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.date :date
    end
  end
end
