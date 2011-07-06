module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end
  
  def truncate_content(post, content)
    output = content.truncate(410, :omission => '', :separator=>' ')
    output += link_to('... See More', post, :id=>'omitText') if content.size > 410
    output.html_safe
  end
  
end
