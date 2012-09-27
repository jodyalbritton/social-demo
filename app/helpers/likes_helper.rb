  module LikesHelper    
    def like_link_for(target)
      link_to "Give Props", like_path(:resource_name => target.class, :resource_id => target.id), :method => :post,:remote => true, :class => "icon-thumbs-up"
    end

    def unlike_link_for(target)
      link_to "Undo Props", like_path(:resource_name => target.class, :resource_id => target.id), :method => :delete,:remote => true, :class => "icon-thumbs-down" 
    end
  end
  
