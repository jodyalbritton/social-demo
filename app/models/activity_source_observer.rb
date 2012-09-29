class ActivitySourceObserver < ActiveRecord::Observer
 
 
 
 observe :post

  def after_create(target)
   @object = target.class.to_s
   
   
      if @object == "Post"
      Activity.create!(
      :user => target.user, 
      :target_id => target.id, 
      :activity_type=> target.class.to_s, 
      :tag_list => target.tag_list, 
      :created_at => target.date, 
      :updated_at => target.updated_at,
      :parent_id => target.parent_id,
      :target_type => target.class.to_s,
      :scope => target.scope,
      :verb => "Posted")
      end
   end

 def after_destroy(target)
   
 end
  

end
