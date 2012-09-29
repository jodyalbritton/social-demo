class CreateTags < ActiveRecord::Migration
   def change
    create_table :tags do |t|
      t.string :content

      t.timestamps
    end

    create_table :activities_tags do |t|
      t.integer :activity_id
      t.integer :tag_id
    end

    add_index :tags, :content, :unique => true
    add_index :activities_tags, :activity_id
    add_index :activities_tags, :tag_id
  end
end
