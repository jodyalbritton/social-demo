class AddAttachmentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :attachment, :string
    add_column :posts, :tag_list, :string
   
  end
end
