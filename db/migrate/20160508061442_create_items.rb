class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.datetime :createDate
      t.datetime :modifiedDate
      t.integer :authorUserId
      t.integer :categoryId
      t.boolean :required
      t.string :title

      t.references :trip, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
