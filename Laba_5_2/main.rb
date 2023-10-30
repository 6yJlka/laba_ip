require 'date'

def month_to_string(month)
  months = %w(января февраля марта апреля мая июня июля августа сентября октября ноября декабря)
  return months[month - 1]
end

def iso_to_string(iso_date)
  date = Date.parse(iso_date)
  return "#{date.day} #{month_to_string(date.month)} #{date.year}"
end