class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.integer :activity_type
      t.integer :target_id
      t.string :target_type
      t.integer :parent_id
      t.string :verb
      t.integer :scope

      t.timestamps
    end
    add_index :activities, :user_id
  end
end
