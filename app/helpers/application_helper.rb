module ApplicationHelper
  def full_title page_title
    base_title = t "appname"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  include Pagy::Frontend
end
