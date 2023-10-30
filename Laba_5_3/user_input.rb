
require_relative 'main'

puts "Программа для коррекции строк"
print "Введите строку: "
input_string = gets.chomp

result = correct_string(input_string)
puts "Скорректированная строка: #{result}"