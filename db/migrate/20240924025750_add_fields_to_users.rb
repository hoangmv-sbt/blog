class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :string
  end
end
