class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :address
      t.string :abbreviation

      t.timestamps
    end
  end
end
