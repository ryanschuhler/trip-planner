class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.datetime :createDate
      t.datetime :modifiedDate
      t.integer :authorUserId
      t.integer :capacity
      t.float :cost
      t.string :description
      t.datetime :endDate
      t.integer :hostUserId
      t.string :image
      t.string :location
      t.boolean :public
      t.datetime :startDate

      t.timestamps null: false
    end
  end
end
