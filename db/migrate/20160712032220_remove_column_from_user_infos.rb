class RemoveColumnFromUserInfos < ActiveRecord::Migration
  def change
    remove_column :user_infos, :bill_phone
    rename_column :user_infos, :phone, :primary_phone
  end
end
