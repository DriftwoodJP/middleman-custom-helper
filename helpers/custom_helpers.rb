# Middleman Custom Helpers
module CustomHelpers
  def get_title(site_name, separator = ' | ')
    title = current_page.metadata[:page]['title']
    title ? title + separator + site_name : site_name
  end

  def get_breadcrumbs(home = 'Home')
    current_page_data = current_page

    hierarchy = [current_page_data]
    hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent

    breadcrumbs = current_page_data.metadata[:page]['breadcrumbs']

    list = []
    hierarchy.each_with_index do |page, index|
      title =
        if breadcrumbs.blank?
          page.data.title
        else
          breadcrumbs[index - 1]
        end
      list <<
        case index
        when 0
          content_tag(:li, link_to(home, "/#{page.path}"))
        when hierarchy.size - 1
          content_tag(:li, title, class: 'active')
        else
          content_tag(:li, link_to(title, "/#{page.path}"))
        end
    end
    list.join.html_safe
  end
end
