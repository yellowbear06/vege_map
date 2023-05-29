module EventsHelper
  def formatted_datetime(datetime)
    datetime.strftime("%Y年%m月%d日 %H:%M")
  end
end
