class CreateTask < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :passion_id
      t.integer :timeframe_id
      t.string :description
      t.datetime :completed_at, default: nil
      t.boolean :is_current, default: false
    end
  end
end
