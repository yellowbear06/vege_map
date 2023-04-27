def check_leap_year(year)
  if year % 4 == 0
    puts "閏年である"
  elsif year % 100 == 0
    puts "閏年ではない"
  elsif year % 400 == 0
    puts "閏年である"
  end
end