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
end
