class CreateReminder < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.date :trigger_at
      t.boolean :is_active, default: false
    end
  end
end
