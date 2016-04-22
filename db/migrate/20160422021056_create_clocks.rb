class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.datetime :date
      t.references :employee, index: true, foreign_key: true
      t.string :evaluation
      t.references :moment, index: true, foreign_key: true
      t.integer :diference

      t.timestamps null: false
    end
  end
end
