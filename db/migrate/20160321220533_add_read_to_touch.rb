class AddReadToTouch < ActiveRecord::Migration
  def change
     add_column :touches, :business_id, :integer
     add_column :touches,:read, :boolean
  end
end
