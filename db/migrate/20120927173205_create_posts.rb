class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :content
      t.integer :parent_id
      t.integer :scope
      t.integer :reply_to_id
      t.date :date

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
