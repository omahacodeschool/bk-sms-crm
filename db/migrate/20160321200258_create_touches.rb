class CreateTouches < ActiveRecord::Migration
  def change
    create_table :touches do |t|
      t.integer :client_id
      t.text :message
      t.boolean :outgoing

      t.timestamps null: false
    end
  end
end
