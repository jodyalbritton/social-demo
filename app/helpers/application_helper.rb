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
    content.gsub(/\B@(\w*[A-Za-z0-9_]+\w*)/) do
    linker = User.where(:username => $1)
     if linker.any?
      link_to $1, user_path($1)
     else 
       $1
     end 
    end
  end
  
end