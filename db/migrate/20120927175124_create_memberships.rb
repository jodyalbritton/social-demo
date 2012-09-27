class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user
      t.boolean :pending
      t.references :group
      t.boolean :blocked
      t.references :glevel

      t.timestamps
    end
    add_index :memberships, :user_id
    add_index :memberships, :group_id
    add_index :memberships, :glevel_id
  end
end
