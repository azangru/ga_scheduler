class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :cohort_id
      t.integer :classroom_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
