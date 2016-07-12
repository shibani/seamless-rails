class AddColumnsToUserInfos < ActiveRecord::Migration
  def change
    add_column :user_infos, :firstname, :string
    add_column :user_infos, :lastname, :string
    add_column :user_infos, :phone, :string
    add_reference :user_infos, :user, index: true
  end
end
