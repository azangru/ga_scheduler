class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :program_id
      t.integer :location_id
      t.integer :producer_id

      t.timestamps
    end

    add_index :courses, :program_id
    add_index :courses, :location_id
    add_index :courses, :producer_id

  end
end
