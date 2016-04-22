class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :description
      t.time :arrival_time
      t.time :departure_time
      t.integer :tolerance

      t.timestamps null: false
    end
  end
end
