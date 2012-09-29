class AddTagListToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :tag_list, :string
  end
end
