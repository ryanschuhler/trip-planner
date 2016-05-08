class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :createDate
      t.datetime :modifiedDate
      t.integer :authorUserId
      t.float :cost
      t.integer :payeeUserId
      t.string :title

      t.references :trip, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
