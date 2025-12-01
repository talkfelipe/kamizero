module ApplicationHelper
  def markdown(text)
    return "" if text.blank?

    Kramdown::Document.new(text).to_html.html_safe
  end

  def navbar_role_class
    return "navbar-teacher" if current_user&.role == "teacher"
    return "navbar-lewagon" if current_user&.role == "parent"
  end

end
