class ChangePhoneNumberInBusiness < ActiveRecord::Migration

  def change
    change_column :businesses, :business_phone, :string
  end

end
