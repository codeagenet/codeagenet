module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def metatitle(page_title)
    content_for(:metatitle) { page_title }
  end

  def flash_class(level)
    case level
      when :notice then "info"
      when :error then "error"
      when :alert then "warning"
    end
  end
end
