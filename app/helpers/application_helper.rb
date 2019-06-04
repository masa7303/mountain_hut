module ApplicationHelper
  def page_title
    title = "Tateyama Lodge"
    title = @page_title + "-" + title if @page_title
    title
  end
end
