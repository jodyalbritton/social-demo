class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user
      t.references :circle

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :circle_id
  end
end
