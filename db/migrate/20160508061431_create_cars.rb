class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.datetime :createDate
      t.datetime :modifiedDate
      t.integer :authorUserId
      t.integer :capacity
      t.integer :driverUserId
      t.string :title

      t.references :trip, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end