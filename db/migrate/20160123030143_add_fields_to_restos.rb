class AddFieldsToRestos < ActiveRecord::Migration
  def change
      add_column :restaurants, :phone, :string
      add_column :restaurants, :hours, :string
      add_column :restaurants, :email, :string
      add_column :restaurants, :website, :string
      
      add_column :restaurants, :latitude, :decimal
      add_column :restaurants, :longitude, :decimal
      
      add_column :restaurants, :description, :text
      add_column :restaurants, :owner, :string
      add_column :restaurants, :accounts_payable, :string
      
      add_column :restaurants, :bill_name, :string
      add_column :restaurants, :bill_address1, :string
      add_column :restaurants, :bill_address2, :string
      add_column :restaurants, :bill_city, :string
      add_column :restaurants, :bill_state, :string
      add_column :restaurants, :bill_zip, :string
  end
end
