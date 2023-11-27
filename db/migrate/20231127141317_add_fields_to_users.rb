class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :biography, :text, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
