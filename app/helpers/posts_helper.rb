module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end
  
  def truncate_content(post, content)
    output = content.truncate(420, :omission => '', :separator=>' ')
    output += link_to('... See More', post, :id=>'omitText') if content.size > 420
    output.html_safe
  end

	def showTags(post)
		tagString = ''
		tagString += "Politics " if post.tag[:politics]
		tagString += "Technology " if post.tag(:technology)
		tagString += "Entertainment " if post.tag(:entertainment)
		tagString += "Sports " if post.tag(:sports)
		tagString += "Science " if post.tag(:science)
		tagString += "Crime " if post.tag(:crime)
		tagString += "Business " if post.tag(:business)
		tagString += "Social " if post.tag(:social)
		tagString += "Nature " if post.tag(:nature)
		tagString += "Other " if post.tag(:other)
		
		return tagString
	end
	
	def flagPost(post)
		
	end
	
end