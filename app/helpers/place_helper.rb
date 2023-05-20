module PlaceHelper
  def format_opening_hours(opening_hours)
    days = %w[日 月 火 水 木 金 土]
    periods = opening_hours['periods']
  
    formatted_hours = []
  
    days.each_with_index do |day, index|
      day_periods = periods.select { |period| period['open']['day'] == index }
  
      if day_periods.empty?
        formatted_hours << "#{day}曜日：休業"
      else
        day_hours = day_periods.map do |period|
          open_time = format_time(period['open']['time'])
          close_time = format_time(period['close']['time'])
          "#{open_time}〜#{close_time}"
        end
  
        formatted_hours << "#{day}曜日 #{day_hours.join(', ')}"
      end
    end
  
    formatted_hours
  end
  
  def format_time(time)
    hours = time[0..1]
    minutes = time[2..3]
    "#{hours}:#{minutes}"
  end
end
