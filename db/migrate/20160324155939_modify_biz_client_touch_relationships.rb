class ModifyBizClientTouchRelationships < ActiveRecord::Migration
  def change
    remove_column :touches, :business_id
    add_column :clients, :business_id, :integer
  end
end
