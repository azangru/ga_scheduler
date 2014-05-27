class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :size
      t.integer :location_id

      t.timestamps
    end
  end
end
