class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.date :startdate
      t.date :enddate
      t.references :car, index: true

      t.timestamps null: false
    end
    add_foreign_key :slots, :cars
  end
end
