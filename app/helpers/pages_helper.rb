 module PagesHelper
  #Return the Correct Title
  def title
    base_title = "Orchive"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
