class CreateRecpients < ActiveRecord::Migration
  def change
    create_table :recpients do |t|
      t.references :message
      t.references :user

      t.timestamps
    end
    add_index :recpients, :message_id
    add_index :recpients, :user_id
  end
end
