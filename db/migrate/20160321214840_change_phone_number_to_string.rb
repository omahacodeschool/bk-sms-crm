class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
    change_column :clients, :phone_number, :string
  end
end
