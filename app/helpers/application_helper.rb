module ApplicationHelper
  def title
    base_title = "Orchive"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def errorImage(user, field)
    if user.errors.any?
      registrationsErrorImage(user.errors[field].blank?)
    else
      image_tag('errors_blank.png')
    end
  end
  
  def registrationsErrorImage(is_error)
      if is_error
        image_tag('errors_check.png')
      else
        image_tag('errors_x.png')
      end
  end
end