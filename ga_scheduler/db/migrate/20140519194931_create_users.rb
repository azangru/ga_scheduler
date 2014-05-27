class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :photo
      t.text :biography
      t.string :email
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
