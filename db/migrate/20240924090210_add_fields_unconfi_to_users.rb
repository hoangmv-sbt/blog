class AddFieldsUnconfiToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :unconfirmed_email, :string, limit: 255
  end
end
