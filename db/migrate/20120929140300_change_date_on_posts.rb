class ChangeDateOnPosts < ActiveRecord::Migration
  def up
   change_column :posts, :date, :datetime
  
  end

  def down
  end
end
