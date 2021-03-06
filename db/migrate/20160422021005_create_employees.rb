class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.date :birth
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
