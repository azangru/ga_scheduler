class CreateTeachingAssignments < ActiveRecord::Migration
  def change
    create_table :teaching_assignments do |t|
      t.integer :cohort_id
      t.integer :instructor_id
      t.integer :negotiated_rate

      t.timestamps
    end
  end
end
