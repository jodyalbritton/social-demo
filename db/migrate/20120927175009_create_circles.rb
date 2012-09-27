class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.references :user
      t.string :name
      t.text :description
      t.integer :author_id

      t.timestamps
    end
    add_index :circles, :user_id
  end
end
