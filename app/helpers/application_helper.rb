module ApplicationHelper
  
  
  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title ="What's my X?"
     if page_title.empty?
       base_title
     else 
       "#{base_title} | #{page_title}"
     end
  end
  
  def mention_linker(content)
    content.gsub(/\B*([@#])(\w*[A-Za-z0-9_]+\w*)/) do
    if $1 == "@"
      linker = User.where(:username => $2)
        if linker.any?
        link_to "@"+$2.downcase, user_path(linker.last)
        else 
        $2
        end  
   elsif $1 == "#"
     linker = Tag.where(:content => $2.downcase)
       if linker.any?
       link_to "#"+$2.downcase, tag_path(linker.last) 
       else 
       $2.downcase
       end
   end 
  end
  end
end