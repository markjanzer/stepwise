class CreatePassions < ActiveRecord::Migration[6.0]
  def change
    create_table :passions do |t|
      t.string :goals
      t.string :vision
      t.string :name
    end
  end
end
