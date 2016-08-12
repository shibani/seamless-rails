class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hash_id, :string
  end
end
