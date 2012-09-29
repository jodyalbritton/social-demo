class AddPrivacyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :privacy, :boolean
    add_column :users, :opt_in, :boolean
    add_column :users, :notify_by_email, :boolean
  end
end
