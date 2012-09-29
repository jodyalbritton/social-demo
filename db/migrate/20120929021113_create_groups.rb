class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
      t.string :privacy_level
      t.boolean :active
      t.text :description
      t.integer :gcategory_id
      t.string :avatar
      t.timestamps
    end
  end
end
