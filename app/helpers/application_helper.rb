module ApplicationHelper
  def page_title(page_title = '', admin = false)
    base_title = if admin
                  'Vegee(管理画面)'
                 else
                  'Vegee'
                 end
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def active_if(path)
    path == controller_path ? 'active' : ''
  end

  def vege_option(option)
    t("enums.place_of_vegetarian_type.option.#{option}")
  end

  def event_status(status)
    t("enums.event.status.#{status}")
  end
end
