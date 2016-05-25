class Intial < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :author, index: true

      t.integer :capacity
      t.float :cost
      t.string :description
      t.string :displayConfiguration
      t.datetime :endDate
      t.string :image
      t.string :location
      t.boolean :public
      t.datetime :startDate
      t.string :title

      t.references :host, index: true
      t.timestamps null: false
    end

    add_foreign_key :trips, :users, column: :author_id
    add_foreign_key :trips, :members, column: :host_id

    create_table :cars do |t|
      t.belongs_to :trip, index: true
      t.references :author, index: true

      t.integer :capacity

      t.references :driver, index: true

      t.timestamps null: false
    end

    add_foreign_key :cars, :members, column: :author_id
    add_foreign_key :cars, :members, column: :driver_id

    create_table :expenses do |t|
      t.belongs_to :trip, index: true
      t.belongs_to :member, index: true
      t.references :author, index: true

      t.float :cost
      t.string :title

      t.references :payee, index: true

      t.timestamps null: false
    end

    add_foreign_key :expenses, :members, column: :author_id
    add_foreign_key :expenses, :members, column: :payee_id

    create_table :items do |t|
      t.belongs_to :trip, index: true
      t.references :author, index: true

      t.integer :categoryId
      t.boolean :required
      t.string :title

      t.timestamps null: false
    end

    add_foreign_key :items, :members, column: :author_id

    create_table :members do |t|
      t.belongs_to :trip, index: true

      t.boolean :admin
      t.string :email
      t.integer :status

      t.references :inviter, index: true
      t.references :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :members, :members, column: :inviter_id
  end
end