require_relative 'main'

puts "Программа для преобразования дат из ISO-формата в строковый формат"
loop do
  print "Введите дату в формате ISO (например, 2009-06-15): "
  iso_date = gets.chomp

  begin
    result = iso_to_string(iso_date)
    if result
      puts "Результат преобразования: #{result}"
      break
    else
      puts "Неправильный формат даты. Пожалуйста, введите дату в правильном формате."
    end
  rescue ArgumentError
    puts "Неправильная дата. Пожалуйста, введите корректную дату."
  end
end
