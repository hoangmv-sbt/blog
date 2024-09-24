class AddConfirmableFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :confirmation_expires_at, :datetime
  end
end
