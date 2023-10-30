require_relative 'main'

puts "Программа для вычисления b"
puts "Введите значение x:"
x = gets.chomp.to_f
puts "Введите значение y:"
y = gets.chomp.to_f
puts "Введите значение z:"
z = gets.chomp.to_f

result = calculate_b(x, y, z)

puts "Результат вычисления b: #{result}"