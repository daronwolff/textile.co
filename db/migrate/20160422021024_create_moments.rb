class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
