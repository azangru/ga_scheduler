class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :cohort_id
      t.integer :student_id
      t.boolean :prework_done
      t.boolean :paid

      t.timestamps
    end
  end
end
