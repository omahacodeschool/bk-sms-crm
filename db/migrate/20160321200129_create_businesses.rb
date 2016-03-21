class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.integer :business_phone

      t.timestamps null: false
    end
  end
end
