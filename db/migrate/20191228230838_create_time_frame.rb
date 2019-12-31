class CreateTimeFrame < ActiveRecord::Migration[6.0]
  def change
    create_table :time_frames do |t|
      t.string :name
    end
  end
end
