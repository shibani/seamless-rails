class AddBillingColumnsToUserInfos < ActiveRecord::Migration
  def change
    add_column :user_infos, :bill_address1, :string
    add_column :user_infos, :bill_address2, :string
    add_column :user_infos, :bill_city, :string
    add_column :user_infos, :bill_state, :string
    add_column :user_infos, :bill_zip, :string
    add_column :user_infos, :bill_phone, :string
  end
end
