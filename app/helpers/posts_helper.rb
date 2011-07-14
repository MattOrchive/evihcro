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
		tagString += "Politics " if post.tags(:politics)
		tagString += "Technology " if post.tags(:technology)
		tagString += "Entertainment " if post.tags(:entertainment)
		tagString += "Sports " if post.tags(:sports)
		tagString += "Science " if post.tags(:science)
		tagString += "Crime " if post.tags(:crime)
		tagString += "Business " if post.tags(:business)
		tagString += "Social " if post.tags(:social)
		tagString += "Nature " if post.tags(:nature)
		tagString += "Other " if post.tags(:other)
		
		return tagString
	end
	
	def flagPost(post)
		
	end
	
end